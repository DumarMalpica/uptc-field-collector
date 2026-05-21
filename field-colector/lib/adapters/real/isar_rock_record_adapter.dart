// ignore_for_file: experimental_member_use
import 'package:isar/isar.dart';
import '../../domain/entities/rock_record.dart';
import '../../domain/ports/rock_record_local_port.dart';
import '../../core/database/isar_service.dart';
import 'rock_record_model.dart';

class IsarRockRecordAdapter implements RockRecordLocalPort {
  @override
  Future<void> saveRecord(RockRecord record) async {
    final isar = await IsarService.getInstance();
    final model = RockRecordModel.fromDomain(record);
    await isar.writeTxn(() async {
      await isar.rockRecordModels.putByRecordId(model);
    });
  }

  @override
  Future<RockRecord?> getRecordById(String recordId) async {
    final isar = await IsarService.getInstance();
    final query = isar.rockRecordModels.buildQuery<RockRecordModel>(
      filter: FilterCondition.equalTo(property: 'recordId', value: recordId),
      limit: 1,
    );
    final results = await query.findAll();
    if (results.isEmpty) return null;
    return results.first.toDomain();
  }

  @override
  Future<List<RockRecord>> getAllRecords() async {
    final isar = await IsarService.getInstance();
    final results =
        await isar.rockRecordModels.buildQuery<RockRecordModel>().findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<void> deleteRecord(String recordId) async {
    final isar = await IsarService.getInstance();
    await isar.writeTxn(() async {
      await isar.rockRecordModels.deleteByRecordId(recordId);
    });
  }

  @override
  Future<void> clearAll() async {
    final isar = await IsarService.getInstance();
    await isar.writeTxn(() async {
      await isar.rockRecordModels.clear();
    });
  }

  @override
  Future<List<RockRecord>> getRecordsByOuting(String outingId) async {
    final isar = await IsarService.getInstance();
    final query = isar.rockRecordModels.buildQuery<RockRecordModel>(
      filter: FilterCondition.equalTo(property: 'outingId', value: outingId),
    );
    final results = await query.findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<List<RockRecord>> getRecordsByUser(String userId) async {
    final isar = await IsarService.getInstance();
    final query = isar.rockRecordModels.buildQuery<RockRecordModel>(
      filter: FilterCondition.equalTo(property: 'userId', value: userId),
    );
    final results = await query.findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<List<RockRecord>> getRecordsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final isar = await IsarService.getInstance();
    final query = isar.rockRecordModels.buildQuery<RockRecordModel>(
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
  Future<List<RockRecord>> getPendingSyncRecords() async {
    final isar = await IsarService.getInstance();
    final query = isar.rockRecordModels.buildQuery<RockRecordModel>(
      filter:
          FilterCondition.equalTo(property: 'syncStatus', value: 'pending'),
    );
    final results = await query.findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<void> updateSyncStatus(String recordId, String syncStatus) async {
    final isar = await IsarService.getInstance();
    final query = isar.rockRecordModels.buildQuery<RockRecordModel>(
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
      await isar.rockRecordModels.put(model);
    });
  }

  @override
  Future<void> updateFirebaseId(int localIsarId, String firebaseId) async {
    final isar = await IsarService.getInstance();
    final model = await isar.rockRecordModels.get(localIsarId);
    if (model == null) return;
    model.firebaseId = firebaseId;
    await isar.writeTxn(() async {
      await isar.rockRecordModels.put(model);
    });
  }
}
