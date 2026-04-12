class Coordinate {
  final double latitude;
  final double longitude;
  final double altitude;
  final double gpsAccuracy;
  final bool manuallyEdited;

  Coordinate({
    required this.latitude,
    required this.longitude,
    required this.altitude,
    required this.gpsAccuracy,
    required this.manuallyEdited,
  });
}
