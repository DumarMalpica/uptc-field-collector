import 'base_record.dart';
import 'photo.dart';
import 'plot.dart';

class SoilRecord extends BaseRecord {
  final List<String> soilTypes;
  final String? soilTypeFreeText;
  final String dominantColor;
  final String colorVariability;
  final List<String> texture;
  final String? textureFreeText;
  final String structure;
  final String? structureFreeText;
  final String soilProfile;
  final bool hasSample;
  final String? sampleId;
  final double? sampleDepth;
  final String observations;
  final Plot plot;
  final List<Photo> photos;

  SoilRecord({
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
    required this.soilTypes,
    this.soilTypeFreeText,
    required this.dominantColor,
    required this.colorVariability,
    required this.texture,
    this.textureFreeText,
    required this.structure,
    this.structureFreeText,
    required this.soilProfile,
    required this.hasSample,
    this.sampleId,
    this.sampleDepth,
    required this.observations,
    required this.plot,
    required this.photos,
  });
}
