class Photo {
  final String id;
  final String filename;
  final String localPath;
  final String storageUrl;
  final String photoType;
  final String recordId;
  final String recordType;
  final String syncStatus;

  Photo({
    required this.id,
    required this.filename,
    required this.localPath,
    required this.storageUrl,
    required this.photoType,
    required this.recordId,
    required this.recordType,
    required this.syncStatus,
  });
}
