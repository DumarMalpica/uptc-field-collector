// ignore_for_file: experimental_member_use
import 'package:isar/isar.dart';
import '../../domain/entities/water_record.dart';
import '../../domain/ports/water_record_local_port.dart';
import '../../core/database/isar_service.dart';
import 'water_record_model.dart';

class IsarWaterRecordAdapter implements WaterRecordLocalPort {
  @override
  Future<void> saveRecord(WaterRecord record) async {
    final isar = await IsarService.getInstance();
    final model = WaterRecordModel.fromDomain(record);
    await isar.writeTxn(() async {
      await isar.waterRecordModels.putByRecordId(model);
    });
  }

  @override
  Future<WaterRecord?> getRecordById(String recordId) async {
    final isar = await IsarService.getInstance();
    final query = isar.waterRecordModels.buildQuery<WaterRecordModel>(
      filter: FilterCondition.equalTo(property: 'recordId', value: recordId),
      limit: 1,
    );
    final results = await query.findAll();
    if (results.isEmpty) return null;
    return results.first.toDomain();
  }

  @override
  Future<List<WaterRecord>> getAllRecords() async {
    final isar = await IsarService.getInstance();
    final results =
        await isar.waterRecordModels.buildQuery<WaterRecordModel>().findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<void> deleteRecord(String recordId) async {
    final isar = await IsarService.getInstance();
    await isar.writeTxn(() async {
      await isar.waterRecordModels.deleteByRecordId(recordId);
    });
  }

  @override
  Future<void> clearAll() async {
    final isar = await IsarService.getInstance();
    await isar.writeTxn(() async {
      await isar.waterRecordModels.clear();
    });
  }

  @override
  Future<List<WaterRecord>> getRecordsByOuting(String outingId) async {
    final isar = await IsarService.getInstance();
    final query = isar.waterRecordModels.buildQuery<WaterRecordModel>(
      filter: FilterCondition.equalTo(property: 'outingId', value: outingId),
    );
    final results = await query.findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<List<WaterRecord>> getRecordsByUser(String userId) async {
    final isar = await IsarService.getInstance();
    final query = isar.waterRecordModels.buildQuery<WaterRecordModel>(
      filter: FilterCondition.equalTo(property: 'userId', value: userId),
    );
    final results = await query.findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<List<WaterRecord>> getRecordsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final isar = await IsarService.getInstance();
    final query = isar.waterRecordModels.buildQuery<WaterRecordModel>(
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
  Future<List<WaterRecord>> getPendingSyncRecords() async {
    final isar = await IsarService.getInstance();
    final query = isar.waterRecordModels.buildQuery<WaterRecordModel>(
      filter:
          FilterCondition.equalTo(property: 'syncStatus', value: 'pending'),
    );
    final results = await query.findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<void> updateSyncStatus(String recordId, String syncStatus) async {
    final isar = await IsarService.getInstance();
    final query = isar.waterRecordModels.buildQuery<WaterRecordModel>(
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
      await isar.waterRecordModels.put(model);
    });
  }

  @override
  Future<void> updateFirebaseId(int localIsarId, String firebaseId) async {
    final isar = await IsarService.getInstance();
    final model = await isar.waterRecordModels.get(localIsarId);
    if (model == null) return;
    model.firebaseId = firebaseId;
    await isar.writeTxn(() async {
      await isar.waterRecordModels.put(model);
    });
  }
}
