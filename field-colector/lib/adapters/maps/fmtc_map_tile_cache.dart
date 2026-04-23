import 'package:field_colector/domain/ports/maps/map_tile_cache.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:latlong2/latlong.dart';

/// Adaptador FMTC: descarga circular OSM y sirve teselas vía [FMTCTileProvider].
class FmtcMapTileCache implements MapTileCache {
  static const String _osmUrl =
      'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

  @override
  String get rasterUrlTemplate => _osmUrl;

  @override
  Future<void> ensureStoreExists(String areaId) async {
    final store = FMTCStore(areaId);
    if (!await store.manage.ready) {
      await store.manage.create();
    }
  }

  @override
  Future<void> downloadRegion({
    required double lat,
    required double lon,
    required double radius,
    required String areaId,
    required int minZoom,
    required int maxZoom,
  }) async {
    final store = FMTCStore(areaId);
    if (!await store.manage.ready) {
      await store.manage.create();
    }

    final tileProvider = FMTCTileProvider(
      stores: {areaId: BrowseStoreStrategy.readUpdateCreate},
    );

    final region = CircleRegion(LatLng(lat, lon), radius).toDownloadable(
      minZoom: minZoom,
      maxZoom: maxZoom,
      options: TileLayer(
        urlTemplate: _osmUrl,
        userAgentPackageName: 'com.citesa.field_colector',
        tileProvider: tileProvider,
      ),
    );

    final streams = store.download.startForeground(
      region: region,
      parallelThreads: 3,
      maxBufferLength: 100,
    );

    try {
      await streams.downloadProgress.drain();
    } catch (e, st) {
      Error.throwWithStackTrace(e, st);
    }
  }

  @override
  TileProvider getTileProvider(String areaId, {bool offlineOnly = false}) {
    return FMTCTileProvider(
      stores: {areaId: BrowseStoreStrategy.readUpdateCreate},
      loadingStrategy: offlineOnly
          ? BrowseLoadingStrategy.cacheOnly
          : BrowseLoadingStrategy.cacheFirst,
    );
  }
}
