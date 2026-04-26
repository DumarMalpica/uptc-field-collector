import 'package:field_colector/adapters/maps/fmtc_map_tile_cache.dart';
import 'package:field_colector/adapters/maps/in_memory_offline_area_repository.dart';
import 'package:field_colector/adapters/network/connectivity_reachability.dart';
import 'package:field_colector/domain/ports/maps/map_tile_cache.dart';
import 'package:field_colector/domain/ports/maps/offline_area_repository.dart';
import 'package:field_colector/domain/ports/network_reachability.dart';
import 'package:field_colector/domain/usecases/download_map_use_case.dart';

/// Composición de dependencias del mapa para inyección en la app.
///
/// Instancia **única** creada en `main` y expuesta con [Provider]: áreas
/// descargadas (metadatos), almacenes FMTC en disco y política de red
/// sobreviven a abrir/cerrar [MapScreen].
///
/// La descarga interactiva de teselas no vive en [MapScreen]; ver
/// `lib/features/map/download/map_tile_download_flow.dart` (UI de expedición).
class MapServices {
  MapServices._({
    required this.areaRepository,
    required this.tileCache,
    required this.downloadMap,
    required this.reachability,
  });

  final OfflineAreaRepository areaRepository;
  final MapTileCache tileCache;
  final DownloadMapUseCase downloadMap;
  final NetworkReachability reachability;

  factory MapServices.create() {
    final areaRepository = InMemoryOfflineAreaRepository();
    final tileCache = FmtcMapTileCache();
    return MapServices._(
      areaRepository: areaRepository,
      tileCache: tileCache,
      downloadMap: DownloadMapUseCase(areaRepository, tileCache),
      reachability: ConnectivityReachability(),
    );
  }
}
