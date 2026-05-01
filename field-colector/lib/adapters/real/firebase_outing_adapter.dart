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
      'latitude': item.latitude,
      'longitude': item.longitude,
      'altitude': item.altitude,
      'startDate': item.startDate.toIso8601String(),
      'endDate': item.endDate.toIso8601String(),
      'createdById': item.createdById,
      'participantIds': item.participantIds,
      'status': item.status,
      'syncStatus': item.syncStatus,
      'pendingUsers': item.pendingUsers.map((u) => u.toMap()).toList(),
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
      latitude: (data['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (data['longitude'] as num?)?.toDouble() ?? 0.0,
      altitude: (data['altitude'] as num?)?.toDouble() ?? 0.0,
      startDate: data['startDate'] != null ? DateTime.parse(data['startDate']) : DateTime.now(),
      endDate: data['endDate'] != null ? DateTime.parse(data['endDate']) : DateTime.now(),
      createdById: data['createdById'] ?? '',
      participantIds: List<String>.from(data['participantIds'] ?? []),
      status: data['status'] ?? 'active',
      syncStatus: data['syncStatus'] ?? 'synced',
      pendingUsers: (data['pendingUsers'] as List<dynamic>?)
          ?.map((e) => PendingUser.fromMap(e as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  @override
  Future<void> addPendingUserToOuting(String outingId, PendingUser user) async {
    await _firestore.collection(_collection).doc(outingId).update({
      'pendingUsers': FieldValue.arrayUnion([user.toMap()]),
    });
  }

  @override
  Future<void> removePendingUserFromOuting(String outingId, String userId) async {
    final doc = await _firestore.collection(_collection).doc(outingId).get();
    if (!doc.exists) return;
    
    final data = doc.data();
    if (data == null) return;
    
    final pendingList = List<dynamic>.from(data['pendingUsers'] ?? []);
    pendingList.removeWhere((e) => e is Map && e['id'] == userId);
    
    await _firestore.collection(_collection).doc(outingId).update({
      'pendingUsers': pendingList,
    });
  }

  @override
  Future<List<PendingUser>> getPendingUsersByOutingId(String outingId) async {
    final doc = await _firestore.collection(_collection).doc(outingId).get();
    if (!doc.exists) return [];
    
    final data = doc.data();
    if (data == null) return [];
    
    return (data['pendingUsers'] as List<dynamic>?)
        ?.map((e) => PendingUser.fromMap(e as Map<String, dynamic>))
        .toList() ?? [];
  }
}
