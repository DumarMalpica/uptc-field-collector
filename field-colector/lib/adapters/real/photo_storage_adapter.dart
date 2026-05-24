// ignore_for_file: experimental_member_use
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../domain/entities/photo.dart';
import '../../domain/ports/photo_local_port.dart';
import '../../core/database/isar_service.dart';
import 'photo_model.dart';

class PhotoStorageAdapter implements PhotoLocalPort {
  final FirebaseStorage? _storage;
  final http.Client _httpClient;

  PhotoStorageAdapter({FirebaseStorage? storage, http.Client? httpClient})
      : _storage = storage,
        _httpClient = httpClient ?? http.Client();

  // ── PhotoLocalPort ────────────────────────────────────────────────────────

  @override
  Future<String> savePhotoLocally(
    Uint8List bytes,
    String recordId,
    String photoType, {
    required String recordType,
  }) async {
    final compressed = await _compress(bytes);

    final dir = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final fileName = '${photoType}_$timestamp.jpg';
    final path = '${dir.path}/citesa_photos/$recordId/$fileName';

    final file = File(path);
    await file.parent.create(recursive: true);
    await file.writeAsBytes(compressed);

    final photoId = '$recordId-$timestamp';
    final model = PhotoModel()
      ..photoId = photoId
      ..filename = fileName
      ..localPath = path
      ..storageUrl = ''
      ..photoType = photoType
      ..recordId = recordId
      ..recordType = recordType
      ..syncStatus = 'pending'
      ..createdAt = DateTime.now();

    final isar = await IsarService.getInstance();
    await isar.writeTxn(() async {
      await isar.photoModels.putByPhotoId(model);
    });

    return photoId;
  }

  @override
  Future<Photo?> getPhotoById(String photoId) async {
    final isar = await IsarService.getInstance();
    final query = isar.photoModels.buildQuery<PhotoModel>(
      filter: FilterCondition.equalTo(property: 'photoId', value: photoId),
      limit: 1,
    );
    final results = await query.findAll();
    if (results.isEmpty) return null;
    return results.first.toDomain();
  }

  @override
  Future<void> relinkPhotosToRecord(
    String fromRecordId,
    String toRecordId, {
    required String recordType,
  }) async {
    if (fromRecordId == toRecordId) return;

    final isar = await IsarService.getInstance();
    final query = isar.photoModels.buildQuery<PhotoModel>(
      filter: FilterCondition.equalTo(property: 'recordId', value: fromRecordId),
    );
    final results = await query.findAll();
    if (results.isEmpty) return;

    for (final model in results) {
      model.recordId = toRecordId;
      model.recordType = recordType;
    }

    await isar.writeTxn(() async {
      for (final model in results) {
        await isar.photoModels.put(model);
      }
    });
  }

  @override
  Future<List<Photo>> getPhotosByRecord(String recordId) async {
    final isar = await IsarService.getInstance();
    final query = isar.photoModels.buildQuery<PhotoModel>(
      filter: FilterCondition.equalTo(property: 'recordId', value: recordId),
    );
    final results = await query.findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<void> deletePhoto(String photoId) async {
    final isar = await IsarService.getInstance();
    final query = isar.photoModels.buildQuery<PhotoModel>(
      filter: FilterCondition.equalTo(property: 'photoId', value: photoId),
      limit: 1,
    );
    final results = await query.findAll();
    if (results.isEmpty) return;
    final model = results.first;

    final file = File(model.localPath);
    if (await file.exists()) await file.delete();

    await isar.writeTxn(() async {
      await isar.photoModels.deleteByPhotoId(photoId);
    });
  }

  @override
  Future<List<Photo>> getPendingSyncPhotos() async {
    final isar = await IsarService.getInstance();
    final query = isar.photoModels.buildQuery<PhotoModel>(
      filter: FilterCondition.equalTo(property: 'syncStatus', value: 'pending'),
    );
    final results = await query.findAll();
    return results.map((m) => m.toDomain()).toList();
  }

  @override
  Future<void> updatePhotoSyncStatus(String photoId, String status) async {
    final isar = await IsarService.getInstance();
    final query = isar.photoModels.buildQuery<PhotoModel>(
      filter: FilterCondition.equalTo(property: 'photoId', value: photoId),
      limit: 1,
    );
    final results = await query.findAll();
    if (results.isEmpty) return;
    final model = results.first..syncStatus = status;
    await isar.writeTxn(() async {
      await isar.photoModels.put(model);
    });
  }

  @override
  Future<void> updatePhotoStorageUrl(
      String photoId, String storageUrl) async {
    final isar = await IsarService.getInstance();
    final query = isar.photoModels.buildQuery<PhotoModel>(
      filter: FilterCondition.equalTo(property: 'photoId', value: photoId),
      limit: 1,
    );
    final results = await query.findAll();
    if (results.isEmpty) return;
    final model = results.first
      ..storageUrl = storageUrl
      ..syncStatus = 'synced';
    await isar.writeTxn(() async {
      await isar.photoModels.put(model);
    });
  }

  // ── Cloudinary Storage upload ──────────────────────────────────────────────

  Future<void> uploadToFirebase(String photoId, String outingPrefix) async {
    final isar = await IsarService.getInstance();
    final query = isar.photoModels.buildQuery<PhotoModel>(
      filter: FilterCondition.equalTo(property: 'photoId', value: photoId),
      limit: 1,
    );
    final results = await query.findAll();
    if (results.isEmpty) return;
    final model = results.first;

    if (model.syncStatus == 'synced') return;

    try {
      final file = File(model.localPath);
      if (!await file.exists()) {
        model.syncStatus = 'error';
      } else {
        final url = Uri.parse('https://api.cloudinary.com/v1_1/dvcbrr7h7/image/upload');
        final request = http.MultipartRequest('POST', url)
          ..fields['upload_preset'] = 'proyectoApp'
          ..files.add(await http.MultipartFile.fromPath('file', model.localPath));

        final streamedResponse = await _httpClient.send(request);
        final response = await http.Response.fromStream(streamedResponse);

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body) as Map<String, dynamic>;
          final secureUrl = responseData['secure_url'] as String;

          model
            ..storageUrl = secureUrl
            ..syncStatus = 'synced';

          final collection = _collectionFromRecordType(model.recordType);
          if (collection != null) {
            final docRef = FirebaseFirestore.instance.collection(collection).doc(model.recordId);
            final doc = await docRef.get();
            if (doc.exists) {
              final data = doc.data();
              if (data != null) {
                final photosList = List<dynamic>.from(data['photos'] ?? []);
                var updated = false;
                for (var i = 0; i < photosList.length; i++) {
                  final p = Map<String, dynamic>.from(photosList[i]);
                  if (p['id'] == photoId) {
                    p['storageUrl'] = secureUrl;
                    p['syncStatus'] = 'synced';
                    photosList[i] = p;
                    updated = true;
                  }
                }
                if (updated) {
                  await docRef.update({'photos': photosList});
                }
              }
            }
          }
        } else {
          model.syncStatus = 'error';
        }
      }
    } catch (_) {
      model.syncStatus = 'error';
    }

    await isar.writeTxn(() async {
      await isar.photoModels.put(model);
    });
  }

  String? _collectionFromRecordType(String recordType) {
    switch (recordType.toLowerCase()) {
      case 'bird':
        return 'bird_records';
      case 'rock':
        return 'rock_records';
      case 'soil':
        return 'soil_records';
      case 'water':
        return 'water_records';
      case 'vegetation':
        return 'vegetation_records';
      case 'social':
        return 'social_records';
      default:
        return null;
    }
  }

  // ── Helpers privados ──────────────────────────────────────────────────────

  Future<Uint8List> _compress(Uint8List bytes) async {
    final result = await FlutterImageCompress.compressWithList(
      bytes,
      minWidth: 1920,
      minHeight: 1920,
      quality: 95,
      format: CompressFormat.jpeg,
    );
    return result;
  }

  String _recordTypeFromId(String recordId) {
    if (recordId.contains('bird')) return 'bird';
    if (recordId.contains('rock')) return 'rock';
    if (recordId.contains('soil')) return 'soil';
    if (recordId.contains('water')) return 'water';
    if (recordId.contains('vegetation')) return 'vegetation';
    return 'unknown';
  }
}
