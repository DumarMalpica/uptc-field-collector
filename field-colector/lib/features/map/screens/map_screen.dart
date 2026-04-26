import 'dart:async';

import 'package:field_colector/domain/entities/offline_area.dart';
import 'package:field_colector/domain/maps/offline_area_spatial.dart';
import 'package:field_colector/domain/ports/locator_provider.dart';
import 'package:field_colector/features/map/map_services.dart';
import 'package:field_colector/features/map/models/map_record_pin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

/// Vista de mapa: **previsualización** de teselas y **pins** en coordenadas exactas.
///
/// Responsabilidades de esta pantalla:
/// -> Mostrar capa raster según conectividad y zonas ya descargadas (FMTC).
/// -> Opcionalmente seguir GPS con cadencia acotada ([enableLiveGps]).
/// -> Pintar [recordPins] (registros / puntos de interés).
///
/// **Fuera de alcance aquí (ver archivos dedicados):**
/// -> Descarga de teselas: [MapTileDownloadFlow] + UI de expedición.
/// -> Creación/edición de expedición y su coordenada central.
///
/// TODO(expedición): modo selector de sede — sincronizar estrategia de teselas con
///    el centro de cámara (hoy solo GPS o [initialMapCenter] estático).
/// TODO(expedición): pasar [recordPins] desde listados reales de la expedición.
/// TODO(expedición): al cerrar selector, devolver [LatLng] vía [Navigator.pop].
class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    required this.locator,
    this.recordPins = const [],
    this.initialMapCenter,
    this.enableLiveGps = true,
    this.embedded = false,
  });

  /// Misma instancia que el resto de la app (no se recrea al push).
  final LocatorProvider locator;

  /// Registros cuya posición exacta debe verse en el mapa.
  final List<MapRecordPin> recordPins;

  /// Centro inicial si [enableLiveGps] es `false` o hasta llegar el primer fix.
  final LatLng? initialMapCenter;

  /// `true`: permisos, temporizador y marcador de usuario. `false`: mapa estático
  /// (p. ej. borrador de sede de expedición — ver TODO arriba).
  final bool enableLiveGps;

  /// `true`: solo contenido del mapa (sin [Scaffold]/[AppBar]); pensado para incrustar
  /// en [DashboardScreen] u otra cáscara con su propia cromática y chrome.
  final bool embedded;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with WidgetsBindingObserver {
  static const LatLng _fallbackCenter = LatLng(
    5.7042141128497414,
    -72.9415837763055,
  );

  static const String _previewStoreId = 'field_preview';
  static const Duration _gpsInterval = Duration(seconds: 22);
  static const double _minMoveMeters = 35;

  final MapController _mapController = MapController();

  /// Errores de permisos / lectura GPS (no descargas).
  String? _activityLine;

  String? _routingHint;

  LatLng? _userPos;
  LatLng? _lastCameraFollowPos;

  bool _online = true;
  String _fmtcStoreId = _previewStoreId;
  bool _tilesOfflineOnly = false;

  List<OfflineArea> _savedAreas = [];

  Future<void>? _previewFuture;
  StreamSubscription<bool>? _connSub;
  Timer? _gpsTimer;
  bool _gpsAllowed = false;
  bool _gpsStartInFlight = false;

  LatLng get _mapInitialCenter =>
      widget.initialMapCenter ?? _userPos ?? _fallbackCenter;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!widget.enableLiveGps) return;
    if (state == AppLifecycleState.resumed) {
      if (!mounted) return;
      final services = context.read<MapServices>();
      unawaited(_tryStartGps(services));
      if (_gpsAllowed) _startGpsTimer();
    } else {
      _stopGpsTimer();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final services = context.read<MapServices>();
    _previewFuture ??= services.tileCache.ensureStoreExists(_previewStoreId);
    _connSub ??= services.reachability.onConnectivityChanged.listen((online) {
      if (!mounted) return;
      setState(() {
        _online = online;
        _syncStrategyFields(services, explicitZoneId: null);
      });
    });
    unawaited(_initConnectivity(services));
    if (widget.enableLiveGps) {
      unawaited(_tryStartGps(services));
    } else {
      unawaited(_loadSavedAreasOnly(services));
    }
  }

  Future<void> _loadSavedAreasOnly(MapServices services) async {
    final areas = await services.areaRepository.getSavedAreas();
    if (!mounted) return;
    setState(() {
      _savedAreas = areas;
      _syncStrategyFields(services, explicitZoneId: null);
    });
  }

  Future<void> _initConnectivity(MapServices services) async {
    final online = await services.reachability.hasConnectivityNow();
    if (!mounted) return;
    setState(() {
      _online = online;
      _syncStrategyFields(services, explicitZoneId: null);
    });
  }

  Future<void> _tryStartGps(MapServices services) async {
    if (!widget.enableLiveGps) return;
    if (_gpsAllowed || _gpsStartInFlight) return;
    _gpsStartInFlight = true;
    try {
      if (!await widget.locator.isLocationEnabled()) {
        if (mounted) {
          setState(() => _activityLine = 'GPS desactivado en el sistema');
        }
        return;
      }
      final has = await widget.locator.checkLocationPermissions();
      final granted = has || await widget.locator.requestLocationPermissions();
      if (!granted) {
        if (mounted) {
          setState(() => _activityLine = 'Sin permiso de ubicación');
        }
        return;
      }
      if (!mounted) return;
      setState(() {
        _gpsAllowed = true;
        _activityLine = null;
      });
      await _refreshUserPosition(services, moveCamera: true);
      _startGpsTimer();
    } finally {
      _gpsStartInFlight = false;
    }
  }

  void _startGpsTimer() {
    if (!widget.enableLiveGps || !_gpsAllowed) return;
    _gpsTimer?.cancel();
    _gpsTimer = Timer.periodic(_gpsInterval, (_) {
      if (!mounted) return;
      unawaited(_refreshUserPosition(context.read<MapServices>()));
    });
  }

  void _stopGpsTimer() {
    _gpsTimer?.cancel();
    _gpsTimer = null;
  }

  String? _zoneName(String id) {
    for (final a in _savedAreas) {
      if (a.id == id) return a.name;
    }
    return null;
  }

  /// Elige store FMTC, modo solo-caché y texto de ayuda según red + posición GPS.
  void _syncStrategyFields(MapServices services, {String? explicitZoneId}) {
    final String? zone =
        explicitZoneId ??
        (_userPos != null
            ? pickSmallestContainingCompletedArea(
                _savedAreas,
                _userPos!.latitude,
                _userPos!.longitude,
              )?.id
            : null);

    if (zone == null) {
      _fmtcStoreId = _previewStoreId;
      _tilesOfflineOnly = !_online;
      _routingHint = !_online
          ? 'Sin conexión · fuera de zonas descargadas (solo caché local vacío)'
          : null;
      return;
    }

    _fmtcStoreId = zone;
    _tilesOfflineOnly = !_online;
    if (!_online) {
      final n = _zoneName(zone);
      _routingHint = 'Sin conexión · zona: ${n ?? zone}';
    } else {
      _routingHint = null;
    }
  }

  Future<void> _refreshUserPosition(
    MapServices services, {
    bool moveCamera = false,
  }) async {
    if (!widget.enableLiveGps) return;
    try {
      final c = await widget.locator.getCurrentLocation();
      final here = LatLng(c.latitude, c.longitude);
      if (!mounted) return;

      final areas = await services.areaRepository.getSavedAreas();
      final zone = pickSmallestContainingCompletedArea(
        areas,
        c.latitude,
        c.longitude,
      );

      final shouldMove =
          moveCamera ||
          _lastCameraFollowPos == null ||
          const Distance().as(LengthUnit.Meter, _lastCameraFollowPos!, here) >=
              _minMoveMeters;

      if (!mounted) return;
      setState(() {
        _userPos = here;
        _savedAreas = areas;
        _syncStrategyFields(services, explicitZoneId: zone?.id);
      });

      if (shouldMove && mounted) {
        _mapController.move(here, _mapController.camera.zoom);
        _lastCameraFollowPos = here;
      }
    } catch (e) {
      if (mounted) setState(() => _activityLine = e.toString());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopGpsTimer();
    _connSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final services = context.read<MapServices>();
    final initial = _mapInitialCenter;

    return FutureBuilder<void>(
      future: _previewFuture,
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          final loading = const Center(child: CircularProgressIndicator());
          if (widget.embedded) {
            return SizedBox.expand(child: loading);
          }
          return Scaffold(body: loading);
        }

        final lines = <String>[
          if (_activityLine != null && _activityLine!.isNotEmpty)
            _activityLine!,
          if (_routingHint != null && _routingHint!.isNotEmpty) _routingHint!,
        ];

        final mapColumn = Column(
          children: [
            if (lines.isNotEmpty)
              Material(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    lines.join('\n'),
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ),
            Expanded(
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: initial,
                  initialZoom: 15,
                  minZoom: 3,
                  maxZoom: 19,
                ),
                children: [
                  TileLayer(
                    key: ValueKey(
                      '$_fmtcStoreId-$_tilesOfflineOnly-$_online',
                    ),
                    urlTemplate: services.tileCache.rasterUrlTemplate,
                    userAgentPackageName: 'com.citesa.field_colector',
                    tileProvider: services.tileCache.getTileProvider(
                      _fmtcStoreId,
                      offlineOnly: _tilesOfflineOnly,
                    ),
                  ),
                  MarkerLayer(
                    markers: [
                      if (widget.enableLiveGps && _userPos != null)
                        Marker(
                          point: _userPos!,
                          width: 28,
                          height: 28,
                          child: Icon(
                            Icons.navigation,
                            color: Theme.of(context).colorScheme.tertiary,
                            size: 28,
                          ),
                        ),
                      for (final pin in widget.recordPins)
                        Marker(
                          point: pin.toLatLng(),
                          width: 32,
                          height: 32,
                          child: Icon(
                            Icons.place,
                            color: Theme.of(context).colorScheme.primary,
                            size: 32,
                          ),
                        ),
                    ],
                  ),
                  SimpleAttributionWidget(
                    source: const Text('OpenStreetMap'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        );

        if (widget.embedded) {
          return SizedBox.expand(child: mapColumn);
        }

        return Scaffold(
          appBar: AppBar(title: const Text('Mapa')),
          floatingActionButton: widget.enableLiveGps
              ? FloatingActionButton.small(
                  heroTag: 'map_recenter',
                  onPressed: !_gpsAllowed
                      ? null
                      : () => unawaited(
                            _refreshUserPosition(services, moveCamera: true),
                          ),
                  child: const Icon(Icons.my_location),
                )
              : null,
          body: mapColumn,
        );
      },
    );
  }
}
