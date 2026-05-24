import 'package:uuid/uuid.dart';

import '../../domain/entities/photo.dart';
import '../../domain/mappers/form_mapper_registry.dart';
import '../../domain/ports/bird_record_local_port.dart';
import '../../domain/ports/outing_local_port.dart';
import '../../domain/ports/photo_local_port.dart';
import '../../domain/ports/rock_record_local_port.dart';
import '../../domain/ports/soil_record_local_port.dart';
import '../../domain/ports/social_record_local_port.dart';
import '../../domain/ports/vegetation_record_local_port.dart';
import '../../domain/ports/water_record_local_port.dart';

/// Persiste un registro de campo construido desde valores del formulario dinámico.
class RecordSubmitService {
  RecordSubmitService({
    required FormMapperRegistry registry,
    required OutingLocalPort outingLocal,
    required PhotoLocalPort photoLocal,
    required BirdRecordLocalPort birdLocal,
    required RockRecordLocalPort rockLocal,
    required SoilRecordLocalPort soilLocal,
    required VegetationRecordLocalPort vegetationLocal,
    required WaterRecordLocalPort waterLocal,
    required SocialRecordLocalPort socialLocal,
  })  : _registry = registry,
        _outingLocal = outingLocal,
        _photoLocal = photoLocal,
        _birdLocal = birdLocal,
        _rockLocal = rockLocal,
        _soilLocal = soilLocal,
        _vegetationLocal = vegetationLocal,
        _waterLocal = waterLocal,
        _socialLocal = socialLocal;

  final FormMapperRegistry _registry;
  final OutingLocalPort _outingLocal;
  final PhotoLocalPort _photoLocal;
  final BirdRecordLocalPort _birdLocal;
  final RockRecordLocalPort _rockLocal;
  final SoilRecordLocalPort _soilLocal;
  final VegetationRecordLocalPort _vegetationLocal;
  final WaterRecordLocalPort _waterLocal;
  final SocialRecordLocalPort _socialLocal;

  static const _uuid = Uuid();

  Future<String> submit({
    required String moduleFormId,
    required Map<String, dynamic> values,
    required String outingId,
    required String userId,
    String? draftRecordId,
  }) async {
    final outing = await _outingLocal.getOutingById(outingId);
    if (outing == null || !outing.isMember(userId)) {
      throw StateError(
        'No tienes permiso para registrar en esta expedición',
      );
    }

    final recordId = _uuid.v4();
    final recordType = FormMapperRegistry.recordTypeFor(moduleFormId);

    if (draftRecordId != null &&
        draftRecordId.isNotEmpty &&
        draftRecordId != recordId) {
      await _photoLocal.relinkPhotosToRecord(
        draftRecordId,
        recordId,
        recordType: recordType,
      );
    }

    final photos = await _resolvePhotos(
      values: values,
      recordId: recordId,
      draftRecordId: draftRecordId,
    );

    final mapper = _registry.mapperFor(moduleFormId);
    if (mapper == null) {
      throw UnsupportedError('Formulario no soportado: $moduleFormId');
    }

    switch (moduleFormId) {
      case FormMapperRegistry.moduloAves:
        await _birdLocal.saveRecord(
          _registry.bird.fromFormValues(
            values,
            recordId: recordId,
            outingId: outingId,
            userId: userId,
            photos: photos,
          ),
        );
      case FormMapperRegistry.moduloRocas:
        await _rockLocal.saveRecord(
          _registry.rock.fromFormValues(
            values,
            recordId: recordId,
            outingId: outingId,
            userId: userId,
            photos: photos,
          ),
        );
      case FormMapperRegistry.moduloSuelos:
        await _soilLocal.saveRecord(
          _registry.soil.fromFormValues(
            values,
            recordId: recordId,
            outingId: outingId,
            userId: userId,
            photos: photos,
          ),
        );
      case FormMapperRegistry.moduloVegetacion:
        await _vegetationLocal.saveRecord(
          _registry.vegetation.fromFormValues(
            values,
            recordId: recordId,
            outingId: outingId,
            userId: userId,
            photos: photos,
          ),
        );
      case FormMapperRegistry.moduloAgua:
        await _waterLocal.saveRecord(
          _registry.water.fromFormValues(
            values,
            recordId: recordId,
            outingId: outingId,
            userId: userId,
            photos: photos,
          ),
        );
      case FormMapperRegistry.moduloSocial:
        await _socialLocal.saveRecord(
          _registry.social.fromFormValues(
            values,
            recordId: recordId,
            outingId: outingId,
            userId: userId,
            photos: photos,
          ),
        );
      default:
        throw UnsupportedError('Formulario no soportado: $moduleFormId');
    }

    return recordId;
  }

  Future<List<Photo>> _resolvePhotos({
    required Map<String, dynamic> values,
    required String recordId,
    String? draftRecordId,
  }) async {
    final photoIds = <String>{};
    for (final entry in values.entries) {
      final v = entry.value;
      if (v is List) {
        for (final item in v) {
          final id = item.toString();
          if (id.isNotEmpty) photoIds.add(id);
        }
      }
    }

    final byRecord = await _photoLocal.getPhotosByRecord(recordId);
    final merged = <String, Photo>{
      for (final p in byRecord) p.id: p,
    };

    if (draftRecordId != null &&
        draftRecordId.isNotEmpty &&
        draftRecordId != recordId) {
      final draftPhotos = await _photoLocal.getPhotosByRecord(draftRecordId);
      for (final p in draftPhotos) {
        merged[p.id] = p;
      }
    }

    for (final id in photoIds) {
      final photo = await _photoLocal.getPhotoById(id);
      if (photo != null) merged[id] = photo;
    }

    return merged.values.toList();
  }
}
