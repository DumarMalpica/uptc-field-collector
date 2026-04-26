import 'base_record.dart';
import 'photo.dart';

class WaterRecord extends BaseRecord {
  final String weatherConditions;
  final String visibility;
  final String access;
  final String? accessFreeText;
  final String samplingDepth;
  final double? ph;
  final double? temperature;
  final double? conductivity;
  final double? dissolvedOxygen;
  final double? turbidity;
  final String apparentColor;
  final String odor;
  final bool hasSample;
  final String? sampleId;
  final String? sampleType;
  final String? container;
  final String? samplingGoal;
  final List<Photo> photos;

  WaterRecord({
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
    required this.weatherConditions,
    required this.visibility,
    required this.access,
    this.accessFreeText,
    required this.samplingDepth,
    this.ph,
    this.temperature,
    this.conductivity,
    this.dissolvedOxygen,
    this.turbidity,
    required this.apparentColor,
    required this.odor,
    required this.hasSample,
    this.sampleId,
    this.sampleType,
    this.container,
    this.samplingGoal,
    required this.photos,
  });
}
