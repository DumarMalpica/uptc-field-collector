import '../entities/vegetation_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class VegetationRecordRemotePort {
  Future<void> saveVegetationRecord(VegetationRecord item);
  Future<void> updateVegetationRecord(String id, Map<String, dynamic> data);
  Future<void> deleteVegetationRecord(String id);
  Future<VegetationRecord?> getVegetationRecordById(String id);
  Future<VegetationRecordSearchResult> getVegetationRecords({int limit = 20, DocumentSnapshot? lastDocument});
}

class VegetationRecordSearchResult {
  final List<VegetationRecord> items;
  final DocumentSnapshot? lastDocument;

  VegetationRecordSearchResult({required this.items, this.lastDocument});
}
