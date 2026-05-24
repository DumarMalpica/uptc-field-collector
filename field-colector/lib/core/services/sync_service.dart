import 'dart:async';
import '../../domain/ports/sync_port.dart';
import '../../domain/ports/outing_local_port.dart';
import '../../domain/ports/outing_remote_port.dart';
import '../../domain/ports/bird_record_local_port.dart';
import '../../domain/ports/bird_record_remote_port.dart';
import '../../domain/ports/rock_record_local_port.dart';
import '../../domain/ports/rock_record_remote_port.dart';
import '../../domain/ports/soil_record_local_port.dart';
import '../../domain/ports/soil_record_remote_port.dart';
import '../../domain/ports/vegetation_record_local_port.dart';
import '../../domain/ports/vegetation_record_remote_port.dart';
import '../../domain/ports/water_record_local_port.dart';
import '../../domain/ports/water_record_remote_port.dart';
import '../../domain/ports/social_record_local_port.dart';
import '../../domain/ports/social_record_remote_port.dart';
import '../../domain/entities/photo.dart';
import '../../domain/ports/photo_local_port.dart';
import '../../adapters/real/record_photo_sync_helper.dart';
import '../../features/records/services/record_photo_enrichment.dart';

class SyncService implements SyncPort {
  final OutingLocalPort _outingLocalPort;
  final OutingRemotePort _outingRemotePort;
  final BirdRecordLocalPort _birdLocalPort;
  final BirdRecordRemotePort _birdRemotePort;
  final RockRecordLocalPort _rockLocalPort;
  final RockRecordRemotePort _rockRemotePort;
  final SoilRecordLocalPort _soilLocalPort;
  final SoilRecordRemotePort _soilRemotePort;
  final VegetationRecordLocalPort _vegLocalPort;
  final VegetationRecordRemotePort _vegRemotePort;
  final WaterRecordLocalPort _waterLocalPort;
  final WaterRecordRemotePort _waterRemotePort;
  final SocialRecordLocalPort _socialLocalPort;
  final SocialRecordRemotePort _socialRemotePort;
  final PhotoLocalPort _photoLocalPort;

  final _progressController = StreamController<SyncProgress>.broadcast();
  Completer<SyncResult>? _activeSyncCompleter;

  SyncService({
    required OutingLocalPort outingLocalPort,
    required OutingRemotePort outingRemotePort,
    required BirdRecordLocalPort birdLocalPort,
    required BirdRecordRemotePort birdRemotePort,
    required RockRecordLocalPort rockLocalPort,
    required RockRecordRemotePort rockRemotePort,
    required SoilRecordLocalPort soilLocalPort,
    required SoilRecordRemotePort soilRemotePort,
    required VegetationRecordLocalPort vegLocalPort,
    required VegetationRecordRemotePort vegRemotePort,
    required WaterRecordLocalPort waterLocalPort,
    required WaterRecordRemotePort waterRemotePort,
    required SocialRecordLocalPort socialLocalPort,
    required SocialRecordRemotePort socialRemotePort,
    required PhotoLocalPort photoLocalPort,
  })  : _outingLocalPort = outingLocalPort,
        _outingRemotePort = outingRemotePort,
        _birdLocalPort = birdLocalPort,
        _birdRemotePort = birdRemotePort,
        _rockLocalPort = rockLocalPort,
        _rockRemotePort = rockRemotePort,
        _soilLocalPort = soilLocalPort,
        _soilRemotePort = soilRemotePort,
        _vegLocalPort = vegLocalPort,
        _vegRemotePort = vegRemotePort,
        _waterLocalPort = waterLocalPort,
        _waterRemotePort = waterRemotePort,
        _socialLocalPort = socialLocalPort,
        _socialRemotePort = socialRemotePort,
        _photoLocalPort = photoLocalPort;

  @override
  Stream<SyncProgress> get syncProgress => _progressController.stream;

  @override
  Future<bool> hasPendingSync() async {
    final summary = await getPendingSummary();
    return summary.hasPending;
  }

  @override
  Future<SyncPendingSummary> getPendingSummary() async {
    final outings = await _outingLocalPort.getPendingSyncOutings();
    final birds = await _birdLocalPort.getPendingSyncRecords();
    final rocks = await _rockLocalPort.getPendingSyncRecords();
    final soils = await _soilLocalPort.getPendingSyncRecords();
    final vegs = await _vegLocalPort.getPendingSyncRecords();
    final waters = await _waterLocalPort.getPendingSyncRecords();
    final socials = await _socialLocalPort.getPendingSyncRecords();
    final photos = await _photoLocalPort.getPendingSyncPhotos();

    return SyncPendingSummary(
      pendingOutings: outings.length,
      pendingRecords: birds.length +
          rocks.length +
          soils.length +
          vegs.length +
          waters.length +
          socials.length,
      pendingPhotos: photos.length,
    );
  }

  @override
  Future<SyncResult> syncPendingData() async {
    if (_activeSyncCompleter != null) {
      return _activeSyncCompleter!.future;
    }
    _activeSyncCompleter = Completer<SyncResult>();
    try {
      final result = await _doSyncPendingData();
      _activeSyncCompleter!.complete(result);
      return result;
    } catch (e) {
      final fallback = SyncResult(synced: 0, failed: 0, errors: [e.toString()]);
      _activeSyncCompleter!.complete(fallback);
      return fallback;
    } finally {
      _activeSyncCompleter = null;
    }
  }

  Future<SyncResult> _doSyncPendingData() async {
    int synced = 0;
    int failed = 0;
    final errors = <String>[];

    final pendingOutings = await _outingLocalPort.getPendingSyncOutings();
    final pendingBirds = await _birdLocalPort.getPendingSyncRecords();
    final pendingRocks = await _rockLocalPort.getPendingSyncRecords();
    final pendingSoils = await _soilLocalPort.getPendingSyncRecords();
    final pendingVegs = await _vegLocalPort.getPendingSyncRecords();
    final pendingWaters = await _waterLocalPort.getPendingSyncRecords();
    final pendingSocials = await _socialLocalPort.getPendingSyncRecords();
    final pendingPhotos = await _photoLocalPort.getPendingSyncPhotos();

    final total = pendingOutings.length +
        pendingBirds.length +
        pendingRocks.length +
        pendingSoils.length +
        pendingVegs.length +
        pendingWaters.length +
        pendingSocials.length +
        pendingPhotos.length;

    int completed = 0;

    void emitProgress(String item) {
      if (!_progressController.isClosed) {
        _progressController.add(SyncProgress(
          total: total,
          completed: completed,
          currentItem: item,
        ));
      }
    }

    // 1. Outings — first, because records reference outingId
    for (final outing in pendingOutings) {
      emitProgress('Sincronizando expedición ${outing.id}');
      try {
        await _outingRemotePort.saveOuting(outing);
        await _outingLocalPort.updateSyncStatus(outing.id, 'synced');
        synced++;
      } catch (e) {
        await _outingLocalPort.updateSyncStatus(outing.id, 'error');
        failed++;
        errors.add('outing:${outing.id}: $e');
      }
      completed++;
    }

    // 2. Records — second (bird, rock, soil, vegetation, water)
    for (final record in pendingBirds) {
      emitProgress('Sincronizando registro de ave ${record.id}');
      try {
        await _birdRemotePort.saveBirdRecord(record);
        await _birdLocalPort.updateSyncStatus(record.id, 'synced');
        synced++;
      } catch (e) {
        await _birdLocalPort.updateSyncStatus(record.id, 'error');
        failed++;
        errors.add('bird:${record.id}: $e');
      }
      completed++;
    }

    for (final record in pendingRocks) {
      emitProgress('Sincronizando registro de roca ${record.id}');
      try {
        await _rockRemotePort.saveRockRecord(record);
        await _rockLocalPort.updateSyncStatus(record.id, 'synced');
        synced++;
      } catch (e) {
        await _rockLocalPort.updateSyncStatus(record.id, 'error');
        failed++;
        errors.add('rock:${record.id}: $e');
      }
      completed++;
    }

    for (final record in pendingSoils) {
      emitProgress('Sincronizando registro de suelo ${record.id}');
      try {
        await _soilRemotePort.saveSoilRecord(record);
        await _soilLocalPort.updateSyncStatus(record.id, 'synced');
        synced++;
      } catch (e) {
        await _soilLocalPort.updateSyncStatus(record.id, 'error');
        failed++;
        errors.add('soil:${record.id}: $e');
      }
      completed++;
    }

    for (final record in pendingVegs) {
      emitProgress('Sincronizando registro de vegetación ${record.id}');
      try {
        await _vegRemotePort.saveVegetationRecord(record);
        await _vegLocalPort.updateSyncStatus(record.id, 'synced');
        synced++;
      } catch (e) {
        await _vegLocalPort.updateSyncStatus(record.id, 'error');
        failed++;
        errors.add('vegetation:${record.id}: $e');
      }
      completed++;
    }

    for (final record in pendingWaters) {
      emitProgress('Sincronizando registro de agua ${record.id}');
      try {
        await _waterRemotePort.saveWaterRecord(record);
        await _waterLocalPort.updateSyncStatus(record.id, 'synced');
        synced++;
      } catch (e) {
        await _waterLocalPort.updateSyncStatus(record.id, 'error');
        failed++;
        errors.add('water:${record.id}: $e');
      }
      completed++;
    }

    for (final record in pendingSocials) {
      emitProgress('Sincronizando registro social ${record.id}');
      try {
        final enriched = await RecordPhotoEnrichment.socialWithPhotos(
          record,
          _photoLocalPort,
        );
        await _socialRemotePort.saveSocialRecord(enriched);
        await _socialLocalPort.updateSyncStatus(record.id, 'synced');
        synced++;
      } catch (e) {
        await _socialLocalPort.updateSyncStatus(record.id, 'error');
        failed++;
        errors.add('social:${record.id}: $e');
      }
      completed++;
    }

    // 3. Fotos huérfanas — registro ya sincronizado pero foto aún pendiente
    final pendingRecordIds = {
      ...pendingBirds.map((r) => r.id),
      ...pendingRocks.map((r) => r.id),
      ...pendingSoils.map((r) => r.id),
      ...pendingVegs.map((r) => r.id),
      ...pendingWaters.map((r) => r.id),
      ...pendingSocials.map((r) => r.id),
    };

    for (final photo in pendingPhotos) {
      if (pendingRecordIds.contains(photo.recordId)) {
        completed++;
        continue;
      }

      emitProgress('Sincronizando foto ${photo.id}');
      try {
        final outingId = await _outingIdForPhoto(photo);
        await RecordPhotoSyncHelper.uploadAndSyncPhotos(
          recordId: photo.recordId,
          recordType: photo.recordType,
          outingId: outingId,
          photos: [photo],
        );
        final refreshed = await _photoLocalPort.getPhotoById(photo.id);
        if (refreshed?.syncStatus == 'synced') {
          synced++;
        } else {
          failed++;
          errors.add('photo:${photo.id}: upload failed');
        }
      } catch (e) {
        await _photoLocalPort.updatePhotoSyncStatus(photo.id, 'error');
        failed++;
        errors.add('photo:${photo.id}: $e');
      }
      completed++;
    }

    return SyncResult(synced: synced, failed: failed, errors: errors);
  }

  Future<String> _outingIdForPhoto(Photo photo) async {
    final recordId = photo.recordId;
    final recordType = photo.recordType.toLowerCase();

    switch (recordType) {
      case 'bird':
        return (await _birdLocalPort.getRecordById(recordId))?.outingId ?? '';
      case 'rock':
        return (await _rockLocalPort.getRecordById(recordId))?.outingId ?? '';
      case 'soil':
        return (await _soilLocalPort.getRecordById(recordId))?.outingId ?? '';
      case 'vegetation':
        return (await _vegLocalPort.getRecordById(recordId))?.outingId ?? '';
      case 'water':
        return (await _waterLocalPort.getRecordById(recordId))?.outingId ?? '';
      case 'social':
        return (await _socialLocalPort.getRecordById(recordId))?.outingId ?? '';
      default:
        return '';
    }
  }

  void dispose() {
    _progressController.close();
  }
}
