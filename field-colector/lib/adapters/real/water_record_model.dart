import 'package:isar/isar.dart';
import '../../domain/entities/water_record.dart';
import '../../domain/entities/coordinate.dart';
import 'coordinate_model.dart';
import 'photo_record_model.dart';

part 'water_record_model.g.dart';

@Collection()
class WaterRecordModel {
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

  late String weatherConditions;
  late String visibility;
  late String access;
  String? accessFreeText;
  late String samplingDepth;
  double? ph;
  double? temperature;
  double? conductivity;
  double? dissolvedOxygen;
  double? turbidity;
  late String apparentColor;
  late String odor;
  late bool hasSample;
  String? sampleId;
  String? sampleType;
  String? container;
  String? samplingGoal;
  late List<PhotoRecord> photos;

  WaterRecord toDomain() => WaterRecord(
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
        weatherConditions: weatherConditions,
        visibility: visibility,
        access: access,
        accessFreeText: accessFreeText,
        samplingDepth: samplingDepth,
        ph: ph,
        temperature: temperature,
        conductivity: conductivity,
        dissolvedOxygen: dissolvedOxygen,
        turbidity: turbidity,
        apparentColor: apparentColor,
        odor: odor,
        hasSample: hasSample,
        sampleId: sampleId,
        sampleType: sampleType,
        container: container,
        samplingGoal: samplingGoal,
        photos: photos.map((p) => p.toDomain()).toList(),
      );

  static WaterRecordModel fromDomain(WaterRecord r) => WaterRecordModel()
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
    ..weatherConditions = r.weatherConditions
    ..visibility = r.visibility
    ..access = r.access
    ..accessFreeText = r.accessFreeText
    ..samplingDepth = r.samplingDepth
    ..ph = r.ph
    ..temperature = r.temperature
    ..conductivity = r.conductivity
    ..dissolvedOxygen = r.dissolvedOxygen
    ..turbidity = r.turbidity
    ..apparentColor = r.apparentColor
    ..odor = r.odor
    ..hasSample = r.hasSample
    ..sampleId = r.sampleId
    ..sampleType = r.sampleType
    ..container = r.container
    ..samplingGoal = r.samplingGoal
    ..photos = r.photos.map(PhotoRecord.fromDomain).toList();
}
