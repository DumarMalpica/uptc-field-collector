import 'package:isar/isar.dart';
import '../../domain/entities/rock_record.dart';
import '../../domain/entities/coordinate.dart';
import 'coordinate_model.dart';
import 'photo_record_model.dart';

part 'rock_record_model.g.dart';

@Collection()
class RockRecordModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String recordId;

  late String outingId;
  late String userId;
  late String syncStatus;
  String? firebaseId;
  late DateTime recordedAt;
  late String department;
  late String municipality;
  late String village;
  late String sector;

  CoordinateModel? coordinates;

  late String rockType;
  String? rockTypeFreeText;
  late String dominantColor;
  late List<String> texture;
  late String structure;
  late String hardness;
  late String minerals;
  late bool hasSample;
  String? sampleId;
  double? sampleDepth;
  late String observations;
  late List<PhotoRecord> photos;

  RockRecord toDomain() => RockRecord(
        id: recordId,
        outingId: outingId,
        userId: userId,
        recordedAt: recordedAt,
        coordinates: coordinates?.toDomain() ??
            Coordinate(
              latitude: 0,
              longitude: 0,
              altitude: 0,
              gpsAccuracy: 0,
              manuallyEdited: false,
            ),
        department: department,
        municipality: municipality,
        village: village,
        sector: sector,
        syncStatus: syncStatus,
        rockType: rockType,
        rockTypeFreeText: rockTypeFreeText,
        dominantColor: dominantColor,
        texture: List<String>.from(texture),
        structure: structure,
        hardness: hardness,
        minerals: minerals,
        hasSample: hasSample,
        sampleId: sampleId,
        sampleDepth: sampleDepth,
        observations: observations,
        photos: photos.map((p) => p.toDomain()).toList(),
      );

  static RockRecordModel fromDomain(RockRecord r) => RockRecordModel()
    ..recordId = r.id
    ..outingId = r.outingId
    ..userId = r.userId
    ..recordedAt = r.recordedAt
    ..coordinates = CoordinateModel.fromDomain(r.coordinates)
    ..department = r.department
    ..municipality = r.municipality
    ..village = r.village
    ..sector = r.sector
    ..syncStatus = r.syncStatus
    ..rockType = r.rockType
    ..rockTypeFreeText = r.rockTypeFreeText
    ..dominantColor = r.dominantColor
    ..texture = List<String>.from(r.texture)
    ..structure = r.structure
    ..hardness = r.hardness
    ..minerals = r.minerals
    ..hasSample = r.hasSample
    ..sampleId = r.sampleId
    ..sampleDepth = r.sampleDepth
    ..observations = r.observations
    ..photos = r.photos.map(PhotoRecord.fromDomain).toList();
}
