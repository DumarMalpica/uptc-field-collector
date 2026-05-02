import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/bird_record.dart';
import '../../domain/ports/bird_record_remote_port.dart';
import '../../domain/entities/photo.dart';
import '../../domain/entities/coordinate.dart';

class FirebaseBirdRecordAdapter implements BirdRecordRemotePort {
  final FirebaseFirestore _firestore;
  final String _collection = 'bird_records';

  FirebaseBirdRecordAdapter(this._firestore);

  @override
  Future<void> saveBirdRecord(BirdRecord item) async {
    await _firestore.collection(_collection).doc(item.id).set({
      'outingId': item.outingId,
      'userId': item.userId,
      'recordedAt': item.recordedAt.toIso8601String(),
      'department': item.department,
      'municipality': item.municipality,
      'village': item.village,
      'sector': item.sector,
      'syncStatus': item.syncStatus,
      'coordinates': {
        'latitude': item.coordinates.latitude,
        'longitude': item.coordinates.longitude,
        'altitude': item.coordinates.altitude,
        'gpsAccuracy': item.coordinates.gpsAccuracy,
        'manuallyEdited': item.coordinates.manuallyEdited,
      },
      'season': item.season,
      'place': item.place,
      'speciesId': item.speciesId,
      'birdType': item.birdType,
      'migratorStatus': item.migratorStatus,
      'individualCount': item.individualCount,
      'behavior': item.behavior,
      'activity': item.activity,
      'habitat': item.habitat,
      'foragingType': item.foragingType,
      'observedThreats': item.observedThreats,
      'photos': item.photos.map((p) => {
        'id': p.id, 'filename': p.filename, 'localPath': p.localPath, 'storageUrl': p.storageUrl,
        'photoType': p.photoType, 'recordId': p.recordId, 'recordType': p.recordType, 'syncStatus': p.syncStatus
      }).toList(),
    });
  }

  @override
  Future<void> updateBirdRecord(String id, Map<String, dynamic> data) async {
    await _firestore.collection(_collection).doc(id).update(data);
  }

  @override
  Future<void> deleteBirdRecord(String id) async {
    await _firestore.collection(_collection).doc(id).delete();
  }

  @override
  Future<BirdRecord?> getBirdRecordById(String id) async {
    final doc = await _firestore.collection(_collection).doc(id).get();
    if (!doc.exists) return null;
    return _mapSnapshotToBirdRecord(doc);
  }

  @override
  Future<BirdRecordSearchResult> getBirdRecords({
    int limit = 20,
    DocumentSnapshot? lastDocument,
  }) async {
    Query query = _firestore.collection(_collection).limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    final snapshot = await query.get();

    return BirdRecordSearchResult(
      items: snapshot.docs.map((doc) => _mapSnapshotToBirdRecord(doc)).toList(),
      lastDocument: snapshot.docs.isNotEmpty ? snapshot.docs.last : null,
    );
  }

  @override
  Future<List<BirdRecord>> getBirdRecordsForExport({String? outingId, String? userId}) async {
    Query query = _firestore.collection(_collection);

    if (outingId != null) {
      query = query.where('outingId', isEqualTo: outingId);
    } else if (userId != null) {
      query = query.where('userId', isEqualTo: userId);
    }

    final snapshot = await query.get();
    return snapshot.docs.map((doc) => _mapSnapshotToBirdRecord(doc)).toList();
  }

  BirdRecord _mapSnapshotToBirdRecord(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final coord = data['coordinates'] as Map<String, dynamic>? ?? {};

    return BirdRecord(
      id: doc.id,
      outingId: data['outingId'] ?? '',
      userId: data['userId'] ?? '',
      recordedAt: data['recordedAt'] != null ? DateTime.parse(data['recordedAt']) : DateTime.now(),
      department: data['department'] ?? '',
      municipality: data['municipality'] ?? '',
      village: data['village'] ?? '',
      sector: data['sector'] ?? '',
      syncStatus: data['syncStatus'] ?? 'synced',
      coordinates: Coordinate(
        latitude: (coord['latitude'] ?? 0.0).toDouble(),
        longitude: (coord['longitude'] ?? 0.0).toDouble(),
        altitude: (coord['altitude'] ?? 0.0).toDouble(),
        gpsAccuracy: (coord['gpsAccuracy'] ?? 0.0).toDouble(),
        manuallyEdited: coord['manuallyEdited'] ?? false,
      ),
      season: data['season'] ?? '',
      place: data['place'] ?? '',
      speciesId: data['speciesId'] ?? '',
      birdType: data['birdType'] ?? '',
      migratorStatus: data['migratorStatus'] ?? '',
      individualCount: data['individualCount'] ?? 0,
      behavior: data['behavior'] ?? '',
      activity: data['activity'] ?? '',
      habitat: List<String>.from(data['habitat'] ?? []),
      foragingType: List<String>.from(data['foragingType'] ?? []),
      observedThreats: List<String>.from(data['observedThreats'] ?? []),
      photos: (data['photos'] as List<dynamic>? ?? []).map((p) => Photo(
        id: p['id'] ?? '', filename: p['filename'] ?? '', localPath: p['localPath'] ?? '',
        storageUrl: p['storageUrl'] ?? '', photoType: p['photoType'] ?? '', recordId: p['recordId'] ?? '',
        recordType: p['recordType'] ?? '', syncStatus: p['syncStatus'] ?? '',
      )).toList(),
    );
  }
}
