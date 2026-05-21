import 'package:isar/isar.dart';
import '../../domain/entities/bird_record.dart';
import '../../domain/entities/coordinate.dart';
import 'coordinate_model.dart';
import 'photo_record_model.dart';

part 'bird_record_model.g.dart';

@Collection()
class BirdRecordModel {
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

  late String season;
  late String place;
  late String speciesId;
  late String birdType;
  late String migratorStatus;
  late int individualCount;
  late String behavior;
  late String activity;
  late List<String> habitat;
  late List<String> foragingType;
  late List<String> observedThreats;
  late List<PhotoRecord> photos;

  BirdRecord toDomain() => BirdRecord(
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
        season: season,
        place: place,
        speciesId: speciesId,
        birdType: birdType,
        migratorStatus: migratorStatus,
        individualCount: individualCount,
        behavior: behavior,
        activity: activity,
        habitat: List<String>.from(habitat),
        foragingType: List<String>.from(foragingType),
        observedThreats: List<String>.from(observedThreats),
        photos: photos.map((p) => p.toDomain()).toList(),
      );

  static BirdRecordModel fromDomain(BirdRecord r) => BirdRecordModel()
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
    ..season = r.season
    ..place = r.place
    ..speciesId = r.speciesId
    ..birdType = r.birdType
    ..migratorStatus = r.migratorStatus
    ..individualCount = r.individualCount
    ..behavior = r.behavior
    ..activity = r.activity
    ..habitat = List<String>.from(r.habitat)
    ..foragingType = List<String>.from(r.foragingType)
    ..observedThreats = List<String>.from(r.observedThreats)
    ..photos = r.photos.map(PhotoRecord.fromDomain).toList();
}
