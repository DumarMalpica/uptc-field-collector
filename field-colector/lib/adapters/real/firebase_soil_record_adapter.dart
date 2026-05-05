import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/soil_record.dart';
import '../../domain/ports/soil_record_remote_port.dart';
import '../../domain/entities/photo.dart';
import '../../domain/entities/coordinate.dart';
import '../../domain/entities/plot.dart';

class FirebaseSoilRecordAdapter implements SoilRecordRemotePort {
  final FirebaseFirestore _firestore;
  final String _collection = 'soil_records';

  FirebaseSoilRecordAdapter(this._firestore);

  @override
  Future<void> saveSoilRecord(SoilRecord item) async {
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
      'soilTypes': item.soilTypes,
      'soilTypeFreeText': item.soilTypeFreeText,
      'dominantColor': item.dominantColor,
      'colorVariability': item.colorVariability,
      'texture': item.texture,
      'textureFreeText': item.textureFreeText,
      'structure': item.structure,
      'structureFreeText': item.structureFreeText,
      'soilProfile': item.soilProfile,
      'hasSample': item.hasSample,
      'sampleId': item.sampleId,
      'sampleDepth': item.sampleDepth,
      'observations': item.observations,
      'plot': {
        'hasPlot': item.plot.hasPlot,
        'height': item.plot.height,
        'width': item.plot.width,
      },
      'photos': item.photos.map((p) => {
        'id': p.id, 'filename': p.filename, 'localPath': p.localPath, 'storageUrl': p.storageUrl,
        'photoType': p.photoType, 'recordId': p.recordId, 'recordType': p.recordType, 'syncStatus': p.syncStatus
      }).toList(),
    });
  }

  @override
  Future<void> updateSoilRecord(String id, Map<String, dynamic> data) async {
    await _firestore.collection(_collection).doc(id).update(data);
  }

  @override
  Future<void> deleteSoilRecord(String id) async {
    await _firestore.collection(_collection).doc(id).delete();
  }

  @override
  Future<SoilRecord?> getSoilRecordById(String id) async {
    final doc = await _firestore.collection(_collection).doc(id).get();
    if (!doc.exists) return null;
    return _mapSnapshotToSoilRecord(doc);
  }

  @override
  Future<SoilRecordSearchResult> getSoilRecords({
    int limit = 20,
    DocumentSnapshot? lastDocument,
  }) async {
    Query query = _firestore.collection(_collection).limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    final snapshot = await query.get();

    return SoilRecordSearchResult(
      items: snapshot.docs.map((doc) => _mapSnapshotToSoilRecord(doc)).toList(),
      lastDocument: snapshot.docs.isNotEmpty ? snapshot.docs.last : null,
    );
  }

  @override
  Future<List<SoilRecord>> getSoilRecordsForExport({String? outingId, String? userId}) async {
    Query query = _firestore.collection(_collection);

    if (outingId != null) {
      query = query.where('outingId', isEqualTo: outingId);
    } else if (userId != null) {
      query = query.where('userId', isEqualTo: userId);
    }

    final snapshot = await query.get();
    return snapshot.docs.map((doc) => _mapSnapshotToSoilRecord(doc)).toList();
  }

  SoilRecord _mapSnapshotToSoilRecord(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final coord = data['coordinates'] as Map<String, dynamic>? ?? {};
    final plotData = data['plot'] as Map<String, dynamic>? ?? {};

    return SoilRecord(
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
      soilTypes: List<String>.from(data['soilTypes'] ?? []),
      soilTypeFreeText: data['soilTypeFreeText'],
      dominantColor: data['dominantColor'] ?? '',
      colorVariability: data['colorVariability'] ?? '',
      texture: List<String>.from(data['texture'] ?? []),
      textureFreeText: data['textureFreeText'],
      structure: data['structure'] ?? '',
      structureFreeText: data['structureFreeText'],
      soilProfile: data['soilProfile'] ?? '',
      hasSample: data['hasSample'] ?? false,
      sampleId: data['sampleId'],
      sampleDepth: data['sampleDepth']?.toDouble(),
      observations: data['observations'] ?? '',
      plot: Plot(
        hasPlot: plotData['hasPlot'] ?? false,
        height: plotData['height']?.toDouble(),
        width: plotData['width']?.toDouble(),
      ),
      photos: (data['photos'] as List<dynamic>? ?? []).map((p) => Photo(
        id: p['id'] ?? '', filename: p['filename'] ?? '', localPath: p['localPath'] ?? '',
        storageUrl: p['storageUrl'] ?? '', photoType: p['photoType'] ?? '', recordId: p['recordId'] ?? '',
        recordType: p['recordType'] ?? '', syncStatus: p['syncStatus'] ?? '',
      )).toList(),
    );
  }
}
