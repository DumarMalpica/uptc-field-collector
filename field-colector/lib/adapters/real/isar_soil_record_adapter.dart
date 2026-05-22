// ignore_for_file: experimental_member_use
import 'package:isar/isar.dart';
import '../../domain/entities/soil_record.dart';
import '../../domain/ports/soil_record_local_port.dart';
import '../../core/database/isar_service.dart';
import 'soil_record_model.dart';

class IsarSoilRecordAdapter implements SoilRecordLocalPort {
  @override
  Future<void> saveRecord(SoilRecord record) async {
    final isar = await IsarService.getInstance();
    final model = SoilRecordModel.fromDomain(record);
    await isar.writeTxn(() async {
      await isar.soilRecordModels.putByRecordId(model);
    });
  }

  @override
  Future<SoilRecord?> getRecordById(String recordId) async {
    final isar = await IsarService.getInstance();
    final query = isar.soilRecordModels.buildQuery<SoilRecordModel>(
      filter: FilterCondition.equalTo(property: 'recordId', value: recordId),
      limit: 1,
    );
    final results = await query.findAll();
    if (results.isEmpty) return null;
    return results.first.toDomain();
  }

  @override
  Future<List<SoilRecord>> getAllRecords() async {
    final isar = await IsarService.getInstance();
    final results =
        await isar.soilRecordModels.buildQuery<SoilRecordModel>().findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<void> deleteRecord(String recordId) async {
    final isar = await IsarService.getInstance();
    await isar.writeTxn(() async {
      await isar.soilRecordModels.deleteByRecordId(recordId);
    });
  }

  @override
  Future<void> clearAll() async {
    final isar = await IsarService.getInstance();
    await isar.writeTxn(() async {
      await isar.soilRecordModels.clear();
    });
  }

  @override
  Future<List<SoilRecord>> getRecordsByOuting(String outingId) async {
    final isar = await IsarService.getInstance();
    final query = isar.soilRecordModels.buildQuery<SoilRecordModel>(
      filter: FilterCondition.equalTo(property: 'outingId', value: outingId),
    );
    final results = await query.findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<List<SoilRecord>> getRecordsByUser(String userId) async {
    final isar = await IsarService.getInstance();
    final query = isar.soilRecordModels.buildQuery<SoilRecordModel>(
      filter: FilterCondition.equalTo(property: 'userId', value: userId),
    );
    final results = await query.findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<List<SoilRecord>> getRecordsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final isar = await IsarService.getInstance();
    final query = isar.soilRecordModels.buildQuery<SoilRecordModel>(
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
  Future<List<SoilRecord>> getPendingSyncRecords() async {
    final isar = await IsarService.getInstance();
    final query = isar.soilRecordModels.buildQuery<SoilRecordModel>(
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
    final query = isar.soilRecordModels.buildQuery<SoilRecordModel>(
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
      await isar.soilRecordModels.put(model);
    });
  }

  @override
  Future<void> updateFirebaseId(int localIsarId, String firebaseId) async {
    final isar = await IsarService.getInstance();
    final model = await isar.soilRecordModels.get(localIsarId);
    if (model == null) return;
    model.firebaseId = firebaseId;
    await isar.writeTxn(() async {
      await isar.soilRecordModels.put(model);
    });
  }
}
