import 'package:latlong2/latlong.dart';

/// Punto en el mapa asociado a un registro de campo (misma coordenada exacta).
///
/// TODO(expedición): enlazar [id] con entidad persistida (muestra, trazas, etc.).
class MapRecordPin {
  const MapRecordPin({
    required this.id,
    required this.latitude,
    required this.longitude,
    this.label,
  });

  final String id;
  final double latitude;
  final double longitude;
  final String? label;

  LatLng toLatLng() => LatLng(latitude, longitude);
}
