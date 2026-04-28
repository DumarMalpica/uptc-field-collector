import '../entities/bird_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BirdRecordRemotePort {
  Future<void> saveBirdRecord(BirdRecord item);
  Future<void> updateBirdRecord(String id, Map<String, dynamic> data);
  Future<void> deleteBirdRecord(String id);
  Future<BirdRecord?> getBirdRecordById(String id);
  Future<BirdRecordSearchResult> getBirdRecords({int limit = 20, DocumentSnapshot? lastDocument});
}

class BirdRecordSearchResult {
  final List<BirdRecord> items;
  final DocumentSnapshot? lastDocument;

  BirdRecordSearchResult({required this.items, this.lastDocument});
}
