import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/water_record.dart';
import '../../domain/ports/water_record_remote_port.dart';
import '../../domain/entities/photo.dart';
import '../../domain/entities/coordinate.dart';

class FirebaseWaterRecordAdapter implements WaterRecordRemotePort {
  final FirebaseFirestore _firestore;
  final String _collection = 'water_records';

  FirebaseWaterRecordAdapter(this._firestore);

  @override
  @override
  Future<void> saveWaterRecord(WaterRecord item) async {
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
      'weatherConditions': item.weatherConditions,
      'visibility': item.visibility,
      'access': item.access,
      'accessFreeText': item.accessFreeText,
      'samplingDepth': item.samplingDepth,
      'ph': item.ph,
      'temperature': item.temperature,
      'conductivity': item.conductivity,
      'dissolvedOxygen': item.dissolvedOxygen,
      'turbidity': item.turbidity,
      'apparentColor': item.apparentColor,
      'odor': item.odor,
      'hasSample': item.hasSample,
      'sampleId': item.sampleId,
      'sampleType': item.sampleType,
      'container': item.container,
      'samplingGoal': item.samplingGoal,
      // Faltaba agregar las fotos aquí
      'photos': item.photos.map((p) => {
        'id': p.id, 'filename': p.filename, 'localPath': p.localPath, 'storageUrl': p.storageUrl,
        'photoType': p.photoType, 'recordId': p.recordId, 'recordType': p.recordType, 'syncStatus': p.syncStatus
      }).toList(),
    });
  }

  @override
  Future<void> updateWaterRecord(String id, Map<String, dynamic> data) async {
    await _firestore.collection(_collection).doc(id).update(data);
  }

  @override
  Future<void> deleteWaterRecord(String id) async {
    await _firestore.collection(_collection).doc(id).delete();
  }

  @override
  Future<WaterRecord?> getWaterRecordById(String id) async {
    final doc = await _firestore.collection(_collection).doc(id).get();
    if (!doc.exists) return null;
    return _mapSnapshotToWaterRecord(doc);
  }

  @override
  Future<WaterRecordSearchResult> getWaterRecords({
    int limit = 20,
    DocumentSnapshot? lastDocument,
  }) async {
    Query query = _firestore.collection(_collection).limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    final snapshot = await query.get();

    return WaterRecordSearchResult(
      items: snapshot.docs.map((doc) => _mapSnapshotToWaterRecord(doc)).toList(),
      lastDocument: snapshot.docs.isNotEmpty ? snapshot.docs.last : null,
    );
  }

  @override
  Future<List<WaterRecord>> getWaterRecordsForExport({String? outingId, String? userId}) async {
    Query query = _firestore.collection(_collection);

    if (outingId != null) {
      query = query.where('outingId', isEqualTo: outingId);
    } else if (userId != null) {
      query = query.where('userId', isEqualTo: userId);
    }

    final snapshot = await query.get();
    return snapshot.docs.map((doc) => _mapSnapshotToWaterRecord(doc)).toList();
  }

  WaterRecord _mapSnapshotToWaterRecord(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final coord = data['coordinates'] as Map<String, dynamic>? ?? {};

    return WaterRecord(
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
      weatherConditions: data['weatherConditions'] ?? '',
      visibility: data['visibility'] ?? '',
      access: data['access'] ?? '',
      accessFreeText: data['accessFreeText'],
      samplingDepth: data['samplingDepth'] ?? '',
      ph: data['ph']?.toDouble(),
      temperature: data['temperature']?.toDouble(),
      conductivity: data['conductivity']?.toDouble(),
      dissolvedOxygen: data['dissolvedOxygen']?.toDouble(),
      turbidity: data['turbidity']?.toDouble(),
      apparentColor: data['apparentColor'] ?? '',
      odor: data['odor'] ?? '',
      hasSample: data['hasSample'] ?? false,
      sampleId: data['sampleId'],
      sampleType: data['sampleType'],
      container: data['container'],
      samplingGoal: data['samplingGoal'],
      photos: (data['photos'] as List<dynamic>? ?? []).map((p) => Photo(
        id: p['id'] ?? '', filename: p['filename'] ?? '', localPath: p['localPath'] ?? '',
        storageUrl: p['storageUrl'] ?? '', photoType: p['photoType'] ?? '', recordId: p['recordId'] ?? '',
        recordType: p['recordType'] ?? '', syncStatus: p['syncStatus'] ?? '',
      )).toList(),
    );
  }
}
