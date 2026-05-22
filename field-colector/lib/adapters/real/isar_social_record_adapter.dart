// ignore_for_file: experimental_member_use
import 'package:isar/isar.dart';
import '../../core/database/isar_service.dart';
import '../../domain/entities/social_record.dart';
import '../../domain/ports/social_record_local_port.dart';
import 'social_record_model.dart';

class IsarSocialRecordAdapter implements SocialRecordLocalPort {
  @override
  Future<void> saveRecord(SocialRecord record) async {
    final isar = await IsarService.getInstance();
    final model = SocialRecordModel.fromDomain(record);
    await isar.writeTxn(() async {
      await isar.socialRecordModels.putByRecordId(model);
    });
  }

  @override
  Future<SocialRecord?> getRecordById(String recordId) async {
    final isar = await IsarService.getInstance();
    final query = isar.socialRecordModels.buildQuery<SocialRecordModel>(
      filter: FilterCondition.equalTo(property: 'recordId', value: recordId),
      limit: 1,
    );
    final results = await query.findAll();
    if (results.isEmpty) return null;
    return results.first.toDomain();
  }

  @override
  Future<List<SocialRecord>> getAllRecords() async {
    final isar = await IsarService.getInstance();
    final results =
        await isar.socialRecordModels.buildQuery<SocialRecordModel>().findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<void> deleteRecord(String recordId) async {
    final isar = await IsarService.getInstance();
    await isar.writeTxn(() async {
      await isar.socialRecordModels.deleteByRecordId(recordId);
    });
  }

  @override
  Future<void> clearAll() async {
    final isar = await IsarService.getInstance();
    await isar.writeTxn(() async {
      await isar.socialRecordModels.clear();
    });
  }

  @override
  Future<List<SocialRecord>> getRecordsByOuting(String outingId) async {
    final isar = await IsarService.getInstance();
    final query = isar.socialRecordModels.buildQuery<SocialRecordModel>(
      filter: FilterCondition.equalTo(property: 'outingId', value: outingId),
    );
    final results = await query.findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<List<SocialRecord>> getRecordsByUser(String userId) async {
    final isar = await IsarService.getInstance();
    final query = isar.socialRecordModels.buildQuery<SocialRecordModel>(
      filter: FilterCondition.equalTo(property: 'userId', value: userId),
    );
    final results = await query.findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<List<SocialRecord>> getRecordsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final isar = await IsarService.getInstance();
    final query = isar.socialRecordModels.buildQuery<SocialRecordModel>(
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
  Future<List<SocialRecord>> getPendingSyncRecords() async {
    final isar = await IsarService.getInstance();
    final query = isar.socialRecordModels.buildQuery<SocialRecordModel>(
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
    final query = isar.socialRecordModels.buildQuery<SocialRecordModel>(
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
      await isar.socialRecordModels.put(model);
    });
  }

  @override
  Future<void> updateFirebaseId(int localIsarId, String firebaseId) async {
    final isar = await IsarService.getInstance();
    final model = await isar.socialRecordModels.get(localIsarId);
    if (model == null) return;
    model.firebaseId = firebaseId;
    await isar.writeTxn(() async {
      await isar.socialRecordModels.put(model);
    });
  }
}
