import 'base_record.dart';
import 'photo.dart';

class RockRecord extends BaseRecord {
  final String rockType;
  final String? rockTypeFreeText;
  final String dominantColor;
  final List<String> texture;
  final String structure;
  final String hardness;
  final String minerals;
  final bool hasSample;
  final String? sampleId;
  final double? sampleDepth;
  final String observations;
  final List<Photo> photos;

  RockRecord({
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
    required this.rockType,
    this.rockTypeFreeText,
    required this.dominantColor,
    required this.texture,
    required this.structure,
    required this.hardness,
    required this.minerals,
    required this.hasSample,
    this.sampleId,
    this.sampleDepth,
    required this.observations,
    required this.photos,
  });
}
