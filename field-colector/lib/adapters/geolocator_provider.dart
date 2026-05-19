import 'package:field_colector/domain/entities/app_settings.dart';
import 'package:field_colector/domain/entities/coordinate.dart';
import 'package:field_colector/domain/ports/locator_provider.dart';
import 'package:field_colector/features/settings/providers/settings_provider.dart';
import 'package:geolocator/geolocator.dart';

/// Implementacion del proveedor de localizacion usando Geolocator
class GeolocatorProvider implements LocatorProvider {
  GeolocatorProvider(this._settings);

  final SettingsProvider _settings;

  LocationAccuracy _accuracyForSettings() {
    switch (_settings.gpsAccuracy) {
      case GpsAccuracyLevel.high:
        return LocationAccuracy.best;
      case GpsAccuracyLevel.balanced:
        return LocationAccuracy.medium;
      case GpsAccuracyLevel.low:
        return LocationAccuracy.low;
    }
  }

  @override
  Future<Coordinate> getCurrentLocation() async {
    final locationSettings = LocationSettings(
      accuracy: _accuracyForSettings(),
    );

    //Obtenemos la posicion actual
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );

    //Retornamos la coordenada
    return Coordinate(
      latitude: position.latitude,
      longitude: position.longitude,
      altitude: position.altitude,
      gpsAccuracy: position.accuracy,
      manuallyEdited: false,
    );
  }

  @override
  Future<bool> checkLocationPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();

    //Retorna True solo solo si tenemos permisos mientras se usa la app o siempre
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  @override
  Future<bool> requestLocationPermissions() async {
    //Primero verificamos como esta el permiso actualmente
    LocationPermission permission = await Geolocator.checkPermission();

    //Si esta denegado, lanzamos la ventana nativa del usuario
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    //Si despues de preguntar, el usuario acepto, retornamos true
    //Si bloqueo permanentemente, o dijo que no, retornamos false
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  @override
  Future<bool> isLocationEnabled() async {
    //Le preguta directamente al sistema operativo si esta habilitada la localizacion
    return await Geolocator.isLocationServiceEnabled();
  }
}
