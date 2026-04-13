import 'package:field_colector/domain/entities/coordinate.dart';

/// Interface para el proveedor de localización.
abstract class LocatorProvider {
  /// Obtiene la ubicación actual del dispositivo.
  Future<Coordinate> getCurrentLocation();

  /// Verifica si el dispositivo tiene permisos para acceder a la localización.
  Future<bool> checkLocationPermissions();

  /// Solicita permisos para acceder a la localización.
  Future<bool> requestLocationPermissions();

  /// Verifica si el dispositivo tiene habilitada la localización.
  Future<bool> isLocationEnabled();
}
