import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import '../../domain/entities/photo.dart';
import '../../domain/ports/photo_local_port.dart';

class PhotoStorageAdapter implements PhotoLocalPort {
  final Map<String, Photo> _metadata = {};

  @override
  Future<String> savePhotoLocally(
    Uint8List bytes,
    String recordId,
    String photoType,
  ) async {
    final dir = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final fileName = '${photoType}_$timestamp.jpg';
    final path =
        '${dir.path}/citesa_photos/$recordId/$fileName';

    final file = File(path);
    await file.parent.create(recursive: true);
    await file.writeAsBytes(bytes);

    final photoId = '$recordId-$timestamp';
    _metadata[photoId] = Photo(
      id: photoId,
      filename: fileName,
      localPath: path,
      storageUrl: '',
      photoType: photoType,
      recordId: recordId,
      recordType: _recordTypeFromId(recordId),
      syncStatus: 'pending',
    );

    return path;
  }

  @override
  Future<List<Photo>> getPhotosByRecord(String recordId) async =>
      _metadata.values.where((p) => p.recordId == recordId).toList();

  @override
  Future<void> deletePhoto(String photoId) async {
    final photo = _metadata[photoId];
    if (photo == null) return;
    final file = File(photo.localPath);
    if (await file.exists()) await file.delete();
    _metadata.remove(photoId);
  }

  @override
  Future<List<Photo>> getPendingSyncPhotos() async =>
      _metadata.values.where((p) => p.syncStatus == 'pending').toList();

  @override
  Future<void> updatePhotoSyncStatus(String photoId, String status) async {
    final p = _metadata[photoId];
    if (p == null) return;
    _metadata[photoId] = _rebuildPhoto(p, syncStatus: status);
  }

  @override
  Future<void> updatePhotoStorageUrl(
      String photoId, String storageUrl) async {
    final p = _metadata[photoId];
    if (p == null) return;
    _metadata[photoId] =
        _rebuildPhoto(p, storageUrl: storageUrl, syncStatus: 'synced');
  }

  String _recordTypeFromId(String recordId) {
    if (recordId.contains('bird')) return 'bird';
    if (recordId.contains('rock')) return 'rock';
    if (recordId.contains('soil')) return 'soil';
    if (recordId.contains('water')) return 'water';
    if (recordId.contains('vegetation')) return 'vegetation';
    return 'unknown';
  }

  Photo _rebuildPhoto(
    Photo p, {
    String? syncStatus,
    String? storageUrl,
  }) =>
      Photo(
        id: p.id,
        filename: p.filename,
        localPath: p.localPath,
        storageUrl: storageUrl ?? p.storageUrl,
        photoType: p.photoType,
        recordId: p.recordId,
        recordType: p.recordType,
        syncStatus: syncStatus ?? p.syncStatus,
      );
}
