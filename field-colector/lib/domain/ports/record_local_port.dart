abstract class RecordLocalPort<T> {
  Future<void> saveRecord(T record);
  Future<T?> getRecordById(String recordId);
  Future<List<T>> getAllRecords();
  Future<void> deleteRecord(String recordId);
  Future<void> clearAll();

  Future<List<T>> getRecordsByOuting(String outingId);
  Future<List<T>> getRecordsByUser(String userId);
  Future<List<T>> getRecordsByDateRange(
    DateTime startDate,
    DateTime endDate,
  );

  Future<List<T>> getPendingSyncRecords();
  Future<void> updateSyncStatus(String recordId, String syncStatus);
  Future<void> updateFirebaseId(int localIsarId, String firebaseId);
}
