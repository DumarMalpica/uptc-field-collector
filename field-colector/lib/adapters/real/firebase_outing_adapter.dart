import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/outing.dart';
import '../../domain/ports/outing_remote_port.dart';

class FirebaseOutingAdapter implements OutingRemotePort {
  final FirebaseFirestore _firestore;
  final String _collection = 'outings';

  FirebaseOutingAdapter(this._firestore);

  @override
  Future<void> saveOuting(Outing item) async {
    await _firestore.collection(_collection).doc(item.id).set({
      'prefix': item.prefix,
      'name': item.name,
      'location': item.location,
      'zone': item.zone,
      'reason': item.reason,
      'startDate': item.startDate.toIso8601String(),
      'endDate': item.endDate.toIso8601String(),
      'createdById': item.createdById,
      'participantIds': item.participantIds,
      'status': item.status,
      'syncStatus': item.syncStatus,
    });
  }

  @override
  Future<void> updateOuting(String id, Map<String, dynamic> data) async {
    await _firestore.collection(_collection).doc(id).update(data);
  }

  @override
  Future<void> deleteOuting(String id) async {
    await _firestore.collection(_collection).doc(id).delete();
  }

  @override
  Future<Outing?> getOutingById(String id) async {
    final doc = await _firestore.collection(_collection).doc(id).get();
    if (!doc.exists) return null;
    return _mapSnapshotToOuting(doc);
  }

  @override
  Future<OutingSearchResult> getOutings({
    int limit = 20,
    DocumentSnapshot? lastDocument,
  }) async {
    Query query = _firestore.collection(_collection).limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    final snapshot = await query.get();

    return OutingSearchResult(
      items: snapshot.docs.map((doc) => _mapSnapshotToOuting(doc)).toList(),
      lastDocument: snapshot.docs.isNotEmpty ? snapshot.docs.last : null,
    );
  }

  @override
  Future<OutingSearchResult> getOutingsByCreatorId(String userId, {
    int limit = 20,
    DocumentSnapshot? lastDocument,
  }) async {
    Query query = _firestore.collection(_collection)
        .where('createdById', isEqualTo: userId)
        .limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    final snapshot = await query.get();

    return OutingSearchResult(
      items: snapshot.docs.map((doc) => _mapSnapshotToOuting(doc)).toList(),
      lastDocument: snapshot.docs.isNotEmpty ? snapshot.docs.last : null,
    );
  }

  Outing _mapSnapshotToOuting(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Outing(
      id: doc.id,
      prefix: data['prefix'] ?? '',
      name: data['name'] ?? '',
      location: data['location'] ?? '',
      zone: data['zone'] ?? '',
      reason: data['reason'] ?? '',
      startDate: data['startDate'] != null ? DateTime.parse(data['startDate']) : DateTime.now(),
      endDate: data['endDate'] != null ? DateTime.parse(data['endDate']) : DateTime.now(),
      createdById: data['createdById'] ?? '',
      participantIds: List<String>.from(data['participantIds'] ?? []),
      status: data['status'] ?? 'active',
      syncStatus: data['syncStatus'] ?? 'synced',
    );
  }
}
