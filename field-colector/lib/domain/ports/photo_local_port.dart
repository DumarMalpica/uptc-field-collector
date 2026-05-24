import 'dart:typed_data';
import '../entities/photo.dart';

abstract class PhotoLocalPort {
  /// Guarda foto comprimida localmente. Retorna el [photoId] generado.
  Future<String> savePhotoLocally(
    Uint8List bytes,
    String recordId,
    String photoType, {
    required String recordType,
  });

  Future<List<Photo>> getPhotosByRecord(String recordId);

  Future<Photo?> getPhotoById(String photoId);

  Future<void> deletePhoto(String photoId);

  Future<List<Photo>> getPendingSyncPhotos();

  Future<void> updatePhotoSyncStatus(String photoId, String status);

  Future<void> updatePhotoStorageUrl(String photoId, String storageUrl);

  /// Reasigna fotos de un borrador temporal al id definitivo del registro.
  Future<void> relinkPhotosToRecord(
    String fromRecordId,
    String toRecordId, {
    required String recordType,
  });
}
