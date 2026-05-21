import 'package:isar/isar.dart';
import '../../domain/entities/photo.dart';

part 'photo_record_model.g.dart';

@embedded
class PhotoRecord {
  String id = '';
  String filename = '';
  String localPath = '';
  String storageUrl = '';
  String photoType = '';
  String recordId = '';
  String recordType = '';
  String syncStatus = '';

  Photo toDomain() => Photo(
        id: id,
        filename: filename,
        localPath: localPath,
        storageUrl: storageUrl,
        photoType: photoType,
        recordId: recordId,
        recordType: recordType,
        syncStatus: syncStatus,
      );

  static PhotoRecord fromDomain(Photo p) => PhotoRecord()
    ..id = p.id
    ..filename = p.filename
    ..localPath = p.localPath
    ..storageUrl = p.storageUrl
    ..photoType = p.photoType
    ..recordId = p.recordId
    ..recordType = p.recordType
    ..syncStatus = p.syncStatus;
}
