import 'package:isar/isar.dart';
import '../../domain/entities/vegetation_record.dart';
import '../../domain/entities/coordinate.dart';
import '../../domain/entities/plot.dart';
import 'coordinate_model.dart';
import 'plot_model.dart';
import 'photo_record_model.dart';

part 'vegetation_record_model.g.dart';

@Collection()
class VegetationRecordModel {
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
  PlotModel? plot;

  late String speciesId;
  late String speciesFreeText;
  late String commonName;
  late String origin;
  late String vegetationType;
  double? height;
  double? diameter;
  String? diameterType;
  double? canopyLength;
  late String physiognomy;
  int? coveragePercent;
  String? coverageDistribution;
  late String physicalCondition;
  late bool hasPyrogeny;
  String? pyrogenyDescription;
  late String groundCover;
  late List<PhotoRecord> photos;

  VegetationRecord toDomain() => VegetationRecord(
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
        speciesId: speciesId,
        speciesFreeText: speciesFreeText,
        commonName: commonName,
        origin: origin,
        vegetationType: vegetationType,
        height: height,
        diameter: diameter,
        diameterType: diameterType,
        canopyLength: canopyLength,
        physiognomy: physiognomy,
        coveragePercent: coveragePercent,
        coverageDistribution: coverageDistribution,
        physicalCondition: physicalCondition,
        hasPyrogeny: hasPyrogeny,
        pyrogenyDescription: pyrogenyDescription,
        groundCover: groundCover,
        plot: plot?.toDomain() ?? Plot(hasPlot: false),
        photos: photos.map((p) => p.toDomain()).toList(),
      );

  static VegetationRecordModel fromDomain(VegetationRecord r) =>
      VegetationRecordModel()
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
        ..speciesId = r.speciesId
        ..speciesFreeText = r.speciesFreeText
        ..commonName = r.commonName
        ..origin = r.origin
        ..vegetationType = r.vegetationType
        ..height = r.height
        ..diameter = r.diameter
        ..diameterType = r.diameterType
        ..canopyLength = r.canopyLength
        ..physiognomy = r.physiognomy
        ..coveragePercent = r.coveragePercent
        ..coverageDistribution = r.coverageDistribution
        ..physicalCondition = r.physicalCondition
        ..hasPyrogeny = r.hasPyrogeny
        ..pyrogenyDescription = r.pyrogenyDescription
        ..groundCover = r.groundCover
        ..plot = PlotModel.fromDomain(r.plot)
        ..photos = r.photos.map(PhotoRecord.fromDomain).toList();
}
