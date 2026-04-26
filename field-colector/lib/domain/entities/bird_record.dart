import 'base_record.dart';
import 'photo.dart';

class BirdRecord extends BaseRecord {
  final String season;
  final String place;
  final String speciesId;
  final String birdType;
  final String migratorStatus;
  final int individualCount;
  final String behavior;
  final String activity;
  final List<String> habitat;
  final List<String> foragingType;
  final List<String> observedThreats;
  final List<Photo> photos;

  BirdRecord({
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
    required this.season,
    required this.place,
    required this.speciesId,
    required this.birdType,
    required this.migratorStatus,
    required this.individualCount,
    required this.behavior,
    required this.activity,
    required this.habitat,
    required this.foragingType,
    required this.observedThreats,
    required this.photos,
  });
}
