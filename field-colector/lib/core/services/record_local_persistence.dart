import 'package:field_colector/domain/entities/base_record.dart';
import 'package:field_colector/domain/entities/bird_record.dart';
import 'package:field_colector/domain/entities/rock_record.dart';
import 'package:field_colector/domain/entities/social_record.dart';
import 'package:field_colector/domain/entities/soil_record.dart';
import 'package:field_colector/domain/entities/vegetation_record.dart';
import 'package:field_colector/domain/entities/water_record.dart';
import 'package:field_colector/domain/mappers/form_mapper_registry.dart';
import 'package:field_colector/domain/ports/bird_record_local_port.dart';
import 'package:field_colector/domain/ports/rock_record_local_port.dart';
import 'package:field_colector/domain/ports/social_record_local_port.dart';
import 'package:field_colector/domain/ports/soil_record_local_port.dart';
import 'package:field_colector/domain/ports/vegetation_record_local_port.dart';
import 'package:field_colector/domain/ports/water_record_local_port.dart';

/// Persiste registros remotos en Isar sin pisar cambios locales pendientes.
class RecordLocalPersistence {
  RecordLocalPersistence({
    required BirdRecordLocalPort birdLocal,
    required RockRecordLocalPort rockLocal,
    required SoilRecordLocalPort soilLocal,
    required VegetationRecordLocalPort vegetationLocal,
    required WaterRecordLocalPort waterLocal,
    required SocialRecordLocalPort socialLocal,
  })  : _birdLocal = birdLocal,
        _rockLocal = rockLocal,
        _soilLocal = soilLocal,
        _vegetationLocal = vegetationLocal,
        _waterLocal = waterLocal,
        _socialLocal = socialLocal;

  final BirdRecordLocalPort _birdLocal;
  final RockRecordLocalPort _rockLocal;
  final SoilRecordLocalPort _soilLocal;
  final VegetationRecordLocalPort _vegetationLocal;
  final WaterRecordLocalPort _waterLocal;
  final SocialRecordLocalPort _socialLocal;

  Future<void> upsertSyncedRecord(
    String moduleFormId,
    BaseRecord record,
  ) async {
    final existing = await _getById(moduleFormId, record.id);
    if (existing != null) {
      if (existing.syncStatus == 'pending' || existing.syncStatus == 'error') {
        return;
      }
    }

    switch (moduleFormId) {
      case FormMapperRegistry.moduloAves:
        if (record is BirdRecord) {
          await _birdLocal.saveRecord(record);
        }
      case FormMapperRegistry.moduloRocas:
        if (record is RockRecord) {
          await _rockLocal.saveRecord(record);
        }
      case FormMapperRegistry.moduloSuelos:
        if (record is SoilRecord) {
          await _soilLocal.saveRecord(record);
        }
      case FormMapperRegistry.moduloVegetacion:
        if (record is VegetationRecord) {
          await _vegetationLocal.saveRecord(record);
        }
      case FormMapperRegistry.moduloAgua:
        if (record is WaterRecord) {
          await _waterLocal.saveRecord(record);
        }
      case FormMapperRegistry.moduloSocial:
        if (record is SocialRecord) {
          await _socialLocal.saveRecord(record);
        }
    }
  }

  Future<void> upsertSyncedRecords(
    String moduleFormId,
    List<BaseRecord> records,
  ) async {
    for (final record in records) {
      await upsertSyncedRecord(moduleFormId, record);
    }
  }

  /// Borra registros con `syncStatus == 'synced'` de un outing (para unpin offline).
  ///
  /// **NO** toca registros con syncStatus `pending` o `error` para no perder
  /// trabajo creado offline por el usuario.
  Future<void> deleteSyncedRecordsForOuting(String outingId) async {
    await _deleteSyncedForModule(
      () => _birdLocal.getRecordsByOuting(outingId),
      (id) => _birdLocal.deleteRecord(id),
    );
    await _deleteSyncedForModule(
      () => _rockLocal.getRecordsByOuting(outingId),
      (id) => _rockLocal.deleteRecord(id),
    );
    await _deleteSyncedForModule(
      () => _soilLocal.getRecordsByOuting(outingId),
      (id) => _soilLocal.deleteRecord(id),
    );
    await _deleteSyncedForModule(
      () => _vegetationLocal.getRecordsByOuting(outingId),
      (id) => _vegetationLocal.deleteRecord(id),
    );
    await _deleteSyncedForModule(
      () => _waterLocal.getRecordsByOuting(outingId),
      (id) => _waterLocal.deleteRecord(id),
    );
    await _deleteSyncedForModule(
      () => _socialLocal.getRecordsByOuting(outingId),
      (id) => _socialLocal.deleteRecord(id),
    );
  }

  Future<void> _deleteSyncedForModule(
    Future<List<BaseRecord>> Function() getRecords,
    Future<void> Function(String id) deleteRecord,
  ) async {
    final records = await getRecords();
    for (final record in records) {
      if (record.syncStatus == 'synced') {
        await deleteRecord(record.id);
      }
    }
  }

  Future<BaseRecord?> _getById(String moduleFormId, String recordId) {
    return switch (moduleFormId) {
      FormMapperRegistry.moduloAves => _birdLocal.getRecordById(recordId),
      FormMapperRegistry.moduloRocas => _rockLocal.getRecordById(recordId),
      FormMapperRegistry.moduloSuelos => _soilLocal.getRecordById(recordId),
      FormMapperRegistry.moduloVegetacion =>
        _vegetationLocal.getRecordById(recordId),
      FormMapperRegistry.moduloAgua => _waterLocal.getRecordById(recordId),
      FormMapperRegistry.moduloSocial => _socialLocal.getRecordById(recordId),
      _ => Future<BaseRecord?>.value(null),
    };
  }
}
