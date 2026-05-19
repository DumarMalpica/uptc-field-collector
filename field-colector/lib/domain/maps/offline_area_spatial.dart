import 'package:field_colector/domain/entities/offline_area.dart';
import 'package:field_colector/domain/utils/geo_coords.dart';
import 'package:latlong2/latlong.dart';

bool completedAreaContainsCoordinate(
  OfflineArea area,
  double lat,
  double lon,
) {
  if (area.status != AreaDownloadStatus.completed) return false;
  final center = tryLatLng(area.centerLat, area.centerLon);
  final point = tryLatLng(lat, lon);
  if (center == null || point == null) return false;
  const dist = Distance();
  final meters = dist.as(LengthUnit.Meter, center, point);
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
