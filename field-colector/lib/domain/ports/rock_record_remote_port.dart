import '../entities/rock_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RockRecordRemotePort {
  Future<void> saveRockRecord(RockRecord item);
  Future<void> updateRockRecord(String id, Map<String, dynamic> data);
  Future<void> deleteRockRecord(String id);
  Future<RockRecord?> getRockRecordById(String id);
  Future<RockRecordSearchResult> getRockRecords({int limit = 20, DocumentSnapshot? lastDocument});
}

class RockRecordSearchResult {
  final List<RockRecord> items;
  final DocumentSnapshot? lastDocument;

  RockRecordSearchResult({required this.items, this.lastDocument});
}
