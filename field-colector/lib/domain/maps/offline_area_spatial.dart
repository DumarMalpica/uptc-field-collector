import 'package:field_colector/domain/entities/offline_area.dart';
import 'package:latlong2/latlong.dart';

bool completedAreaContainsCoordinate(
  OfflineArea area,
  double lat,
  double lon,
) {
  if (area.status != AreaDownloadStatus.completed) return false;
  const dist = Distance();
  final meters = dist.as(
    LengthUnit.Meter,
    LatLng(area.centerLat, area.centerLon),
    LatLng(lat, lon),
  );
  return meters <= area.radiusInKilometers * 1000;
}

/// Si hay solape, elige el radio más pequeño (zona más específica).
OfflineArea? pickSmallestContainingCompletedArea(
  Iterable<OfflineArea> areas,
  double lat,
  double lon,
) {
  final matches = areas
      .where((a) => completedAreaContainsCoordinate(a, lat, lon))
      .toList()
    ..sort(
      (a, b) => a.radiusInKilometers.compareTo(b.radiusInKilometers),
    );
  return matches.isEmpty ? null : matches.first;
}
