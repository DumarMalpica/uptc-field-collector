import '../entities/outing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class OutingRemotePort {
  Future<void> saveOuting(Outing item);
  Future<void> updateOuting(String id, Map<String, dynamic> data);
  Future<void> deleteOuting(String id);
  Future<Outing?> getOutingById(String id);
  Future<OutingSearchResult> getOutings({int limit = 20, DocumentSnapshot? lastDocument});
  Future<OutingSearchResult> getOutingsByCreatorId(String userId, {int limit = 20, DocumentSnapshot? lastDocument});
  
  // Pending users
  Future<void> addPendingUserToOuting(String outingId, PendingUser user);
  Future<void> removePendingUserFromOuting(String outingId, String userId);
  Future<List<PendingUser>> getPendingUsersByOutingId(String outingId);
}

class OutingSearchResult {
  final List<Outing> items;
  final DocumentSnapshot? lastDocument;

  OutingSearchResult({required this.items, this.lastDocument});
}
