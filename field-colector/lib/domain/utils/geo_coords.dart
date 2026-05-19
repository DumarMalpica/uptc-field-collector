import 'package:latlong2/latlong.dart';

/// Valida que ambas coordenadas sean números finitos (no NaN ni infinito).
bool isValidLatLng(double lat, double lon) => lat.isFinite && lon.isFinite;

/// Construye un [LatLng] solo si las coordenadas son finitas; `null` si no.
LatLng? tryLatLng(double lat, double lon) =>
    isValidLatLng(lat, lon) ? LatLng(lat, lon) : null;
