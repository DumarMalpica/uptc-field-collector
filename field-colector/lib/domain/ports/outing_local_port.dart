import '../entities/outing.dart';

abstract class OutingLocalPort {
  // ── CRUD básico ────────────────────────────────────────────────────────────
  Future<void> saveOuting(Outing outing);
  Future<Outing?> getOutingById(String firebaseId);
  Future<List<Outing>> getAllOutings();
  Future<void> updateOuting(String id, Map<String, dynamic> data);
  Future<void> deleteOuting(String firebaseId);
  Future<void> clearAll();

  // ── Queries (espejo de OutingRemotePort) ──────────────────────────────────
  Future<List<Outing>> getOutingsByStatus(String status);
  Future<List<Outing>> getOutingsByDateRange(DateTime startDate, DateTime endDate);
  Future<List<Outing>> getOutingsByCreator(String userId);
  Future<List<Outing>> getOutingsByParticipant(String userId);

  // ── Pending users (espejo de OutingRemotePort) ────────────────────────────
  Future<void> addPendingUserToOuting(String outingId, PendingUser user);
  Future<void> removePendingUserFromOuting(String outingId, String userId);
  Future<List<PendingUser>> getPendingUsersByOutingId(String outingId);

  // ── Sincronización offline→online (exclusivo local) ───────────────────────
  Future<List<Outing>> getPendingSyncOutings();
  Future<void> updateSyncStatus(String firebaseId, String syncStatus);
  Future<void> updateFirebaseId(int localIsarId, String firebaseId);
}
