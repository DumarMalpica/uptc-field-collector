import '../entities/soil_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SoilRecordRemotePort {
  Future<void> saveSoilRecord(SoilRecord item);
  Future<void> updateSoilRecord(String id, Map<String, dynamic> data);
  Future<void> deleteSoilRecord(String id);
  Future<SoilRecord?> getSoilRecordById(String id);
  Future<SoilRecordSearchResult> getSoilRecords({int limit = 20, DocumentSnapshot? lastDocument});
  Future<List<SoilRecord>> getSoilRecordsForExport({String? outingId, String? userId});
}

class SoilRecordSearchResult {
  final List<SoilRecord> items;
  final DocumentSnapshot? lastDocument;

  SoilRecordSearchResult({required this.items, this.lastDocument});
}
