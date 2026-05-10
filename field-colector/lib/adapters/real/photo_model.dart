import 'package:isar/isar.dart';
import '../../domain/entities/photo.dart';

part 'photo_model.g.dart';

@Collection()
class PhotoModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String photoId;

  late String filename;
  late String localPath;
  late String storageUrl;
  late String photoType;

  @Index()
  late String recordId;

  late String recordType;
  late String syncStatus;
  late DateTime createdAt;

  Photo toDomain() => Photo(
        id: photoId,
        filename: filename,
        localPath: localPath,
        storageUrl: storageUrl,
        photoType: photoType,
        recordId: recordId,
        recordType: recordType,
        syncStatus: syncStatus,
      );

  static PhotoModel fromDomain(Photo p) => PhotoModel()
    ..photoId = p.id
    ..filename = p.filename
    ..localPath = p.localPath
    ..storageUrl = p.storageUrl
    ..photoType = p.photoType
    ..recordId = p.recordId
    ..recordType = p.recordType
    ..syncStatus = p.syncStatus
    ..createdAt = DateTime.now();
}
