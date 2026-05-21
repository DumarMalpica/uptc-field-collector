import 'package:isar/isar.dart';
import '../../domain/entities/soil_record.dart';
import '../../domain/entities/coordinate.dart';
import '../../domain/entities/plot.dart';
import 'coordinate_model.dart';
import 'plot_model.dart';
import 'photo_record_model.dart';

part 'soil_record_model.g.dart';

@Collection()
class SoilRecordModel {
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

  late List<String> soilTypes;
  String? soilTypeFreeText;
  late String dominantColor;
  late String colorVariability;
  late List<String> texture;
  String? textureFreeText;
  late String structure;
  String? structureFreeText;
  late String soilProfile;
  late bool hasSample;
  String? sampleId;
  double? sampleDepth;
  late String observations;
  late List<PhotoRecord> photos;

  SoilRecord toDomain() => SoilRecord(
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
        soilTypes: List<String>.from(soilTypes),
        soilTypeFreeText: soilTypeFreeText,
        dominantColor: dominantColor,
        colorVariability: colorVariability,
        texture: List<String>.from(texture),
        textureFreeText: textureFreeText,
        structure: structure,
        structureFreeText: structureFreeText,
        soilProfile: soilProfile,
        hasSample: hasSample,
        sampleId: sampleId,
        sampleDepth: sampleDepth,
        observations: observations,
        plot: plot?.toDomain() ?? Plot(hasPlot: false),
        photos: photos.map((p) => p.toDomain()).toList(),
      );

  static SoilRecordModel fromDomain(SoilRecord r) => SoilRecordModel()
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
    ..soilTypes = List<String>.from(r.soilTypes)
    ..soilTypeFreeText = r.soilTypeFreeText
    ..dominantColor = r.dominantColor
    ..colorVariability = r.colorVariability
    ..texture = List<String>.from(r.texture)
    ..textureFreeText = r.textureFreeText
    ..structure = r.structure
    ..structureFreeText = r.structureFreeText
    ..soilProfile = r.soilProfile
    ..hasSample = r.hasSample
    ..sampleId = r.sampleId
    ..sampleDepth = r.sampleDepth
    ..observations = r.observations
    ..plot = PlotModel.fromDomain(r.plot)
    ..photos = r.photos.map(PhotoRecord.fromDomain).toList();
}
