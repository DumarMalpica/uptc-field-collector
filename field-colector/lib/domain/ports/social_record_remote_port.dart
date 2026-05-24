import '../entities/social_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SocialRecordRemotePort {
  Future<void> saveSocialRecord(SocialRecord item);
  Future<void> updateSocialRecord(String id, Map<String, dynamic> data);
  Future<void> deleteSocialRecord(String id);
  Future<SocialRecord?> getSocialRecordById(String id);
  Future<SocialRecordSearchResult> getSocialRecords({
    int limit = 20,
    DocumentSnapshot? lastDocument,
  });
  Future<List<SocialRecord>> getSocialRecordsForExport({
    String? outingId,
    String? userId,
    DateTime? startDate,
    DateTime? endDate,
  });

  Stream<List<SocialRecord>> watchSocialRecordsByOuting(String outingId);
}

class SocialRecordSearchResult {
  final List<SocialRecord> items;
  final DocumentSnapshot? lastDocument;

  SocialRecordSearchResult({required this.items, this.lastDocument});
}
