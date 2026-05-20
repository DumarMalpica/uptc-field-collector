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
import '../../domain/ports/photo_local_port.dart';

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
  final PhotoLocalPort _photoLocalPort;

  final _progressController = StreamController<SyncProgress>.broadcast();

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
        _photoLocalPort = photoLocalPort;

  @override
  Stream<SyncProgress> get syncProgress => _progressController.stream;

  @override
  Future<bool> hasPendingSync() async {
    final outings = await _outingLocalPort.getPendingSyncOutings();
    if (outings.isNotEmpty) return true;

    final birds = await _birdLocalPort.getPendingSyncRecords();
    if (birds.isNotEmpty) return true;

    final rocks = await _rockLocalPort.getPendingSyncRecords();
    if (rocks.isNotEmpty) return true;

    final soils = await _soilLocalPort.getPendingSyncRecords();
    if (soils.isNotEmpty) return true;

    final vegs = await _vegLocalPort.getPendingSyncRecords();
    if (vegs.isNotEmpty) return true;

    final waters = await _waterLocalPort.getPendingSyncRecords();
    if (waters.isNotEmpty) return true;

    final photos = await _photoLocalPort.getPendingSyncPhotos();
    return photos.isNotEmpty;
  }

  @override
  Future<SyncResult> syncPendingData() async {
    int synced = 0;
    int failed = 0;
    final errors = <String>[];

    final pendingOutings = await _outingLocalPort.getPendingSyncOutings();
    final pendingBirds = await _birdLocalPort.getPendingSyncRecords();
    final pendingRocks = await _rockLocalPort.getPendingSyncRecords();
    final pendingSoils = await _soilLocalPort.getPendingSyncRecords();
    final pendingVegs = await _vegLocalPort.getPendingSyncRecords();
    final pendingWaters = await _waterLocalPort.getPendingSyncRecords();
    final pendingPhotos = await _photoLocalPort.getPendingSyncPhotos();

    final total = pendingOutings.length +
        pendingBirds.length +
        pendingRocks.length +
        pendingSoils.length +
        pendingVegs.length +
        pendingWaters.length +
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

    // 3. Photos — last, because they reference recordId in Firebase Storage
    for (final photo in pendingPhotos) {
      emitProgress('Sincronizando foto ${photo.id}');
      try {
        await _photoLocalPort.updatePhotoSyncStatus(photo.id, 'synced');
        synced++;
      } catch (e) {
        await _photoLocalPort.updatePhotoSyncStatus(photo.id, 'error');
        failed++;
        errors.add('photo:${photo.id}: $e');
      }
      completed++;
    }

    return SyncResult(synced: synced, failed: failed, errors: errors);
  }

  void dispose() {
    _progressController.close();
  }
}
