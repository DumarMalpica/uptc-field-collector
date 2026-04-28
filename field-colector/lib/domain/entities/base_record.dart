import 'coordinate.dart';

abstract class BaseRecord {
  final String id;
  final String outingId;
  final String userId;
  final DateTime recordedAt;
  final Coordinate coordinates;
  final String department;
  final String municipality;
  final String village;
  final String sector;
  final String syncStatus;

  BaseRecord({
    required this.id,
    required this.outingId,
    required this.userId,
    required this.recordedAt,
    required this.coordinates,
    required this.department,
    required this.municipality,
    required this.village,
    required this.sector,
    required this.syncStatus,
  });
}
