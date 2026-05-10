// ignore_for_file: experimental_member_use
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../domain/entities/photo.dart';
import '../../domain/ports/photo_local_port.dart';
import '../../core/database/isar_service.dart';
import 'photo_model.dart';

class PhotoStorageAdapter implements PhotoLocalPort {
  final FirebaseStorage _storage;

  PhotoStorageAdapter({FirebaseStorage? storage})
      : _storage = storage ?? FirebaseStorage.instance;

  // ── PhotoLocalPort ────────────────────────────────────────────────────────

  @override
  Future<String> savePhotoLocally(
    Uint8List bytes,
    String recordId,
    String photoType,
  ) async {
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
      ..recordType = _recordTypeFromId(recordId)
      ..syncStatus = 'pending'
      ..createdAt = DateTime.now();

    final isar = await IsarService.getInstance();
    await isar.writeTxn(() async {
      await isar.photoModels.putByPhotoId(model);
    });

    return path;
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

  // ── Firebase Storage upload ───────────────────────────────────────────────
  // No forma parte de PhotoLocalPort — lo llama el servicio de sincronización.

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
      final ref = _storage
          .ref('$outingPrefix/${model.recordId}/${model.filename}');
      await ref.putFile(File(model.localPath));
      final url = await ref.getDownloadURL();

      model
        ..storageUrl = url
        ..syncStatus = 'synced';
    } catch (_) {
      model.syncStatus = 'error';
    }

    await isar.writeTxn(() async {
      await isar.photoModels.put(model);
    });
  }

  // ── Helpers privados ──────────────────────────────────────────────────────

  Future<Uint8List> _compress(Uint8List bytes) async {
    final result = await FlutterImageCompress.compressWithList(
      bytes,
      minWidth: 1280,
      minHeight: 1280,
      quality: 85,
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
