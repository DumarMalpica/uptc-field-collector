import 'package:flutter_map/flutter_map.dart';

/// Acceso a caché/descarga de teselas para mapas offline (implementación típica: FMTC).
abstract class MapTileCache {
  /// Plantilla URL del raster usado en descarga y visualización (debe coincidir).
  String get rasterUrlTemplate;

  /// Garantiza que exista el almacén de teselas para un área (p. ej. vista previa).
  Future<void> ensureStoreExists(String areaId);

  Future<void> downloadRegion({
    required double lat,
    required double lon,
    required double radius,
    required String areaId,
    required int minZoom,
    required int maxZoom,
  });

  /// Si [offlineOnly], no intenta red (solo teselas ya en el store).
  TileProvider getTileProvider(String areaId, {bool offlineOnly = false});
}
