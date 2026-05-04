import '../entities/water_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class WaterRecordRemotePort {
  Future<void> saveWaterRecord(WaterRecord item);
  Future<void> updateWaterRecord(String id, Map<String, dynamic> data);
  Future<void> deleteWaterRecord(String id);
  Future<WaterRecord?> getWaterRecordById(String id);
  Future<WaterRecordSearchResult> getWaterRecords({int limit = 20, DocumentSnapshot? lastDocument});
  Future<List<WaterRecord>> getWaterRecordsForExport({String? outingId, String? userId});
}

class WaterRecordSearchResult {
  final List<WaterRecord> items;
  final DocumentSnapshot? lastDocument;

  WaterRecordSearchResult({required this.items, this.lastDocument});
}
