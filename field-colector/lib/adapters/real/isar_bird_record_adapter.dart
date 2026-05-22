// ignore_for_file: experimental_member_use
import 'package:isar/isar.dart';
import '../../domain/entities/bird_record.dart';
import '../../domain/ports/bird_record_local_port.dart';
import '../../core/database/isar_service.dart';
import 'bird_record_model.dart';

class IsarBirdRecordAdapter implements BirdRecordLocalPort {
  @override
  Future<void> saveRecord(BirdRecord record) async {
    final isar = await IsarService.getInstance();
    final model = BirdRecordModel.fromDomain(record);
    await isar.writeTxn(() async {
      await isar.birdRecordModels.putByRecordId(model);
    });
  }

  @override
  Future<BirdRecord?> getRecordById(String recordId) async {
    final isar = await IsarService.getInstance();
    final query = isar.birdRecordModels.buildQuery<BirdRecordModel>(
      filter: FilterCondition.equalTo(property: 'recordId', value: recordId),
      limit: 1,
    );
    final results = await query.findAll();
    if (results.isEmpty) return null;
    return results.first.toDomain();
  }

  @override
  Future<List<BirdRecord>> getAllRecords() async {
    final isar = await IsarService.getInstance();
    final results =
        await isar.birdRecordModels.buildQuery<BirdRecordModel>().findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<void> deleteRecord(String recordId) async {
    final isar = await IsarService.getInstance();
    await isar.writeTxn(() async {
      await isar.birdRecordModels.deleteByRecordId(recordId);
    });
  }

  @override
  Future<void> clearAll() async {
    final isar = await IsarService.getInstance();
    await isar.writeTxn(() async {
      await isar.birdRecordModels.clear();
    });
  }

  @override
  Future<List<BirdRecord>> getRecordsByOuting(String outingId) async {
    final isar = await IsarService.getInstance();
    final query = isar.birdRecordModels.buildQuery<BirdRecordModel>(
      filter: FilterCondition.equalTo(property: 'outingId', value: outingId),
    );
    final results = await query.findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<List<BirdRecord>> getRecordsByUser(String userId) async {
    final isar = await IsarService.getInstance();
    final query = isar.birdRecordModels.buildQuery<BirdRecordModel>(
      filter: FilterCondition.equalTo(property: 'userId', value: userId),
    );
    final results = await query.findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<List<BirdRecord>> getRecordsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final isar = await IsarService.getInstance();
    final query = isar.birdRecordModels.buildQuery<BirdRecordModel>(
      filter: FilterCondition.between(
        property: 'recordedAt',
        lower: startDate,
        upper: endDate,
      ),
    );
    final results = await query.findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<List<BirdRecord>> getPendingSyncRecords() async {
    final isar = await IsarService.getInstance();
    final query = isar.birdRecordModels.buildQuery<BirdRecordModel>(
      filter: FilterGroup.or([
        FilterCondition.equalTo(property: 'syncStatus', value: 'pending'),
        FilterCondition.equalTo(property: 'syncStatus', value: 'error'),
      ]),
    );
    final results = await query.findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<void> updateSyncStatus(String recordId, String syncStatus) async {
    final isar = await IsarService.getInstance();
    final query = isar.birdRecordModels.buildQuery<BirdRecordModel>(
      filter: FilterCondition.equalTo(property: 'recordId', value: recordId),
      limit: 1,
    );
    final results = await query.findAll();
    if (results.isEmpty) return;
    final model = results.first..syncStatus = syncStatus;
    if (syncStatus == 'synced') {
      model.firebaseId ??= recordId;
    }
    await isar.writeTxn(() async {
      await isar.birdRecordModels.put(model);
    });
  }

  @override
  Future<void> updateFirebaseId(int localIsarId, String firebaseId) async {
    final isar = await IsarService.getInstance();
    final model = await isar.birdRecordModels.get(localIsarId);
    if (model == null) return;
    model.firebaseId = firebaseId;
    await isar.writeTxn(() async {
      await isar.birdRecordModels.put(model);
    });
  }
}
