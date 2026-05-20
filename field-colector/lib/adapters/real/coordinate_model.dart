import 'package:isar/isar.dart';
import '../../domain/entities/coordinate.dart';

part 'coordinate_model.g.dart';

@embedded
class CoordinateModel {
  double latitude = 0;
  double longitude = 0;
  double altitude = 0;
  double gpsAccuracy = 0;
  bool manuallyEdited = false;

  Coordinate toDomain() => Coordinate(
        latitude: latitude,
        longitude: longitude,
        altitude: altitude,
        gpsAccuracy: gpsAccuracy,
        manuallyEdited: manuallyEdited,
      );

  static CoordinateModel fromDomain(Coordinate c) => CoordinateModel()
    ..latitude = c.latitude
    ..longitude = c.longitude
    ..altitude = c.altitude
    ..gpsAccuracy = c.gpsAccuracy
    ..manuallyEdited = c.manuallyEdited;
}
