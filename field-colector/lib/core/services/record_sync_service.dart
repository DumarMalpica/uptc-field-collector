import 'dart:developer' as developer;

import 'package:field_colector/core/services/record_local_persistence.dart';
import 'package:field_colector/domain/entities/base_record.dart';
import 'package:field_colector/domain/mappers/form_mapper_registry.dart';
import 'package:field_colector/domain/ports/bird_record_remote_port.dart';
import 'package:field_colector/domain/ports/network_reachability.dart';
import 'package:field_colector/domain/ports/rock_record_remote_port.dart';
import 'package:field_colector/domain/ports/social_record_remote_port.dart';
import 'package:field_colector/domain/ports/soil_record_remote_port.dart';
import 'package:field_colector/domain/ports/vegetation_record_remote_port.dart';
import 'package:field_colector/domain/ports/water_record_remote_port.dart';
import 'package:flutter/foundation.dart';

/// Descarga registros de Firestore por expedición y los persiste en Isar (pull).
class RecordSyncService {
  RecordSyncService({
    required BirdRecordRemotePort birdRemote,
    required RockRecordRemotePort rockRemote,
    required SoilRecordRemotePort soilRemote,
    required VegetationRecordRemotePort vegetationRemote,
    required WaterRecordRemotePort waterRemote,
    required SocialRecordRemotePort socialRemote,
    required RecordLocalPersistence recordPersistence,
    required NetworkReachability reachability,
  })  : _birdRemote = birdRemote,
        _rockRemote = rockRemote,
        _soilRemote = soilRemote,
        _vegetationRemote = vegetationRemote,
        _waterRemote = waterRemote,
        _socialRemote = socialRemote,
        _recordPersistence = recordPersistence,
        _reachability = reachability;

  final BirdRecordRemotePort _birdRemote;
  final RockRecordRemotePort _rockRemote;
  final SoilRecordRemotePort _soilRemote;
  final VegetationRecordRemotePort _vegetationRemote;
  final WaterRecordRemotePort _waterRemote;
  final SocialRecordRemotePort _socialRemote;
  final RecordLocalPersistence _recordPersistence;
  final NetworkReachability _reachability;

  /// Descarga todos los registros remotos de una expedición a Isar.
  Future<int> syncRecordsForOuting(String outingId) async {
    if (outingId.isEmpty) {
      debugPrint('[RecordSync] outingId empty, skipping');
      return 0;
    }
    if (!await _reachability.hasConnectivityNow()) {
      debugPrint('[RecordSync] offline, skipping');
      return 0;
    }

    try {
      final results = await Future.wait([
        _birdRemote.getBirdRecordsForExport(outingId: outingId),
        _rockRemote.getRockRecordsForExport(outingId: outingId),
        _soilRemote.getSoilRecordsForExport(outingId: outingId),
        _vegetationRemote.getVegetationRecordsForExport(outingId: outingId),
        _waterRemote.getWaterRecordsForExport(outingId: outingId),
        _socialRemote.getSocialRecordsForExport(outingId: outingId),
      ]);

      final modules = [
        FormMapperRegistry.moduloAves,
        FormMapperRegistry.moduloRocas,
        FormMapperRegistry.moduloSuelos,
        FormMapperRegistry.moduloVegetacion,
        FormMapperRegistry.moduloAgua,
        FormMapperRegistry.moduloSocial,
      ];

      var upserted = 0;
      for (var i = 0; i < modules.length; i++) {
        final records = results[i];
        await _recordPersistence.upsertSyncedRecords(
          modules[i],
          records.cast<BaseRecord>(),
        );
        upserted += records.length;
      }

      debugPrint(
        '[RecordSync] Synced $upserted records for outing $outingId',
      );
      return upserted;
    } catch (e, stack) {
      debugPrint('[RecordSync] ERROR: $e');
      developer.log(
        'RecordSyncService.syncRecordsForOuting failed',
        name: 'RecordSync',
        error: e,
        stackTrace: stack,
      );
      return 0;
    }
  }
}
