import 'dart:typed_data';
import '../entities/photo.dart';

abstract class PhotoLocalPort {
  Future<String> savePhotoLocally(Uint8List bytes, String recordId, String photoType);
  Future<List<Photo>> getPhotosByRecord(String recordId);
  Future<void> deletePhoto(String photoId);
  Future<List<Photo>> getPendingSyncPhotos();
  Future<void> updatePhotoSyncStatus(String photoId, String status);
  Future<void> updatePhotoStorageUrl(String photoId, String storageUrl);
}
