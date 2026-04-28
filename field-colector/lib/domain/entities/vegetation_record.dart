import 'base_record.dart';
import 'plot.dart';
import 'photo.dart';

class VegetationRecord extends BaseRecord {
  final String speciesId;
  final String speciesFreeText;
  final String commonName;
  final String origin;
  final String vegetationType;
  final double? height;
  final double? diameter;
  final String? diameterType;
  final double? canopyLength;
  final String physiognomy;
  final int? coveragePercent;
  final String? coverageDistribution;
  final String physicalCondition;
  final bool hasPyrogeny;
  final String? pyrogenyDescription;
  final String groundCover;
  final Plot plot;
  final List<Photo> photos;

  VegetationRecord({
    required super.id,
    required super.outingId,
    required super.userId,
    required super.recordedAt,
    required super.coordinates,
    required super.department,
    required super.municipality,
    required super.village,
    required super.sector,
    required super.syncStatus,
    required this.speciesId,
    required this.speciesFreeText,
    required this.commonName,
    required this.origin,
    required this.vegetationType,
    this.height,
    this.diameter,
    this.diameterType,
    this.canopyLength,
    required this.physiognomy,
    this.coveragePercent,
    this.coverageDistribution,
    required this.physicalCondition,
    required this.hasPyrogeny,
    this.pyrogenyDescription,
    required this.groundCover,
    required this.plot,
    required this.photos,
  });
}
