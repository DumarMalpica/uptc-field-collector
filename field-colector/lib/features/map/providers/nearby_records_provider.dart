import 'dart:async';

import 'package:field_colector/domain/entities/base_record.dart';
import 'package:field_colector/domain/mappers/form_mapper_registry.dart';
import 'package:field_colector/domain/ports/bird_record_local_port.dart';
import 'package:field_colector/domain/ports/bird_record_remote_port.dart';
import 'package:field_colector/domain/ports/network_reachability.dart';
import 'package:field_colector/domain/ports/rock_record_local_port.dart';
import 'package:field_colector/domain/ports/rock_record_remote_port.dart';
import 'package:field_colector/domain/ports/social_record_local_port.dart';
import 'package:field_colector/domain/ports/social_record_remote_port.dart';
import 'package:field_colector/domain/ports/soil_record_local_port.dart';
import 'package:field_colector/domain/ports/soil_record_remote_port.dart';
import 'package:field_colector/domain/ports/vegetation_record_local_port.dart';
import 'package:field_colector/domain/ports/vegetation_record_remote_port.dart';
import 'package:field_colector/domain/ports/water_record_local_port.dart';
import 'package:field_colector/domain/ports/water_record_remote_port.dart';
import 'package:field_colector/domain/utils/geo_coords.dart';
import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/features/expeditions/providers/field_session_provider.dart';
import 'package:field_colector/features/map/models/map_record_pin.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';

/// Registros cercanos (2 km) en mapa: global (todas expediciones) + vivo en expedición activa.
class NearbyRecordsProvider extends ChangeNotifier {
  NearbyRecordsProvider({
    required BirdRecordLocalPort birdLocal,
    required RockRecordLocalPort rockLocal,
    required SoilRecordLocalPort soilLocal,
    required VegetationRecordLocalPort vegetationLocal,
    required WaterRecordLocalPort waterLocal,
    required SocialRecordLocalPort socialLocal,
    required BirdRecordRemotePort birdRemote,
    required RockRecordRemotePort rockRemote,
    required SoilRecordRemotePort soilRemote,
    required VegetationRecordRemotePort vegetationRemote,
    required WaterRecordRemotePort waterRemote,
    required SocialRecordRemotePort socialRemote,
    required NetworkReachability reachability,
    required FieldSessionProvider fieldSession,
    required Authprovider auth,
  })  : _birdLocal = birdLocal,
        _rockLocal = rockLocal,
        _soilLocal = soilLocal,
        _vegetationLocal = vegetationLocal,
        _waterLocal = waterLocal,
        _socialLocal = socialLocal,
        _birdRemote = birdRemote,
        _rockRemote = rockRemote,
        _soilRemote = soilRemote,
        _vegetationRemote = vegetationRemote,
        _waterRemote = waterRemote,
        _socialRemote = socialRemote,
        _reachability = reachability,
        _fieldSession = fieldSession,
        _auth = auth,
        _activeModuleFilters = Set<String>.from(MapRecordPin.moduleColors.keys);

  static const double radiusMeters = 2000;
  static const double focusRadiusMeters = 1000;
  static const Duration _gpsDebounce = Duration(milliseconds: 500);

  final BirdRecordLocalPort _birdLocal;
  final RockRecordLocalPort _rockLocal;
  final SoilRecordLocalPort _soilLocal;
  final VegetationRecordLocalPort _vegetationLocal;
  final WaterRecordLocalPort _waterLocal;
  final SocialRecordLocalPort _socialLocal;
  final BirdRecordRemotePort _birdRemote;
  final RockRecordRemotePort _rockRemote;
  final SoilRecordRemotePort _soilRemote;
  final VegetationRecordRemotePort _vegetationRemote;
  final WaterRecordRemotePort _waterRemote;
  final SocialRecordRemotePort _socialRemote;
  final NetworkReachability _reachability;
  final FieldSessionProvider _fieldSession;
  final Authprovider _auth;

  final Map<String, BaseRecord> _recordsById = {};
  final Map<String, String> _moduleByRecordId = {};
  Set<String> _activeModuleFilters;

  List<MapRecordPin> _nearbyPins = [];
  LatLng? _position;
  LatLng? _focusCenter;
  bool _online = false;
  String? _currentUserId;
  String? _subscribedOutingId;
  Timer? _gpsDebounceTimer;
  StreamSubscription<bool>? _connSub;
  bool _started = false;
  bool _globalRemoteFetchInFlight = false;

  List<MapRecordPin> get nearbyPins => _nearbyPins;
  bool get isOnline => _online;
  Set<String> get activeModuleFilters => Set.unmodifiable(_activeModuleFilters);

  void start() {
    if (_started) return;
    _started = true;
    _currentUserId = _auth.user?.id;
    _auth.addListener(_onAuthChanged);
    _fieldSession.addListener(_onSessionChanged);
    _connSub = _reachability.onConnectivityChanged.listen(_onConnectivity);
    unawaited(_bootstrap());
  }

  Future<void> _bootstrap() async {
    await _initConnectivity();
    await _reloadLocalAndRebuild();
    if (_online) {
      unawaited(_fetchGlobalRemote());
    }
    _syncOutingSubscription();
  }

  @override
  void dispose() {
    _gpsDebounceTimer?.cancel();
    _connSub?.cancel();
    _cancelOutingSubs();
    _auth.removeListener(_onAuthChanged);
    _fieldSession.removeListener(_onSessionChanged);
    super.dispose();
  }

  void toggleModuleFilter(String moduleFormId) {
    if (_activeModuleFilters.contains(moduleFormId)) {
      _activeModuleFilters.remove(moduleFormId);
    } else {
      _activeModuleFilters.add(moduleFormId);
    }
    notifyListeners();
    unawaited(_applyRadiusFilter());
  }

  void _onAuthChanged() {
    _currentUserId = _auth.user?.id;
    unawaited(_applyRadiusFilter());
  }

  void _onSessionChanged() {
    unawaited(_onSessionChangedAsync());
  }

  Future<void> _onSessionChangedAsync() async {
    _syncOutingSubscription();
    await _reloadLocalAndRebuild();
  }

  Future<void> _initConnectivity() async {
    _online = await _reachability.hasConnectivityNow();
  }

  void _onConnectivity(bool online) {
    _online = online;
    if (online) {
      unawaited(_reloadLocalAndRebuild());
      unawaited(_fetchGlobalRemote());
      _syncOutingSubscription();
    } else {
      _cancelOutingSubs();
      unawaited(_reloadLocalAndRebuild());
    }
  }

  void _syncOutingSubscription() {
    final outingId = _fieldSession.activeOutingId;
    if (outingId == _subscribedOutingId) return;

    _cancelOutingSubs();
    _subscribedOutingId = outingId;
    if (outingId != null && _online) {
      _subscribeOutingRemote(outingId);
    }
  }

  /// Centro de auditoría (p. ej. coordenadas de un registro); pins en 1 km.
  void setFocusCenter(LatLng? center) {
    _focusCenter = center;
    unawaited(_applyRadiusFilter());
  }

  /// Posición GPS desde [MapScreen]; filtro 2 km con debounce.
  void updatePosition(LatLng? position) {
    _gpsDebounceTimer?.cancel();
    _gpsDebounceTimer = Timer(_gpsDebounce, () {
      _position = position;
      unawaited(_applyRadiusFilter());
    });
  }

  void _putRecords(String moduleFormId, List<BaseRecord> records) {
    for (final r in records) {
      _recordsById[r.id] = r;
      _moduleByRecordId[r.id] = moduleFormId;
    }
  }

  void _cancelOutingSubs() {
    for (final s in _outingSubs) {
      unawaited(s.cancel());
    }
    _outingSubs.clear();
  }

  final List<StreamSubscription<dynamic>> _outingSubs = [];

  void _subscribeOutingRemote(String outingId) {
    _outingSubs.add(
      _birdRemote.watchBirdRecordsByOuting(outingId).listen(
        (list) => _onOutingRemoteUpdate(FormMapperRegistry.moduloAves, list),
        onError: (_) {},
      ),
    );
    _outingSubs.add(
      _rockRemote.watchRockRecordsByOuting(outingId).listen(
        (list) => _onOutingRemoteUpdate(FormMapperRegistry.moduloRocas, list),
        onError: (_) {},
      ),
    );
    _outingSubs.add(
      _soilRemote.watchSoilRecordsByOuting(outingId).listen(
        (list) => _onOutingRemoteUpdate(FormMapperRegistry.moduloSuelos, list),
        onError: (_) {},
      ),
    );
    _outingSubs.add(
      _vegetationRemote.watchVegetationRecordsByOuting(outingId).listen(
        (list) =>
            _onOutingRemoteUpdate(FormMapperRegistry.moduloVegetacion, list),
        onError: (_) {},
      ),
    );
    _outingSubs.add(
      _waterRemote.watchWaterRecordsByOuting(outingId).listen(
        (list) => _onOutingRemoteUpdate(FormMapperRegistry.moduloAgua, list),
        onError: (_) {},
      ),
    );
    _outingSubs.add(
      _socialRemote.watchSocialRecordsByOuting(outingId).listen(
        (list) => _onOutingRemoteUpdate(FormMapperRegistry.moduloSocial, list),
        onError: (_) {},
      ),
    );
  }

  void _onOutingRemoteUpdate(String moduleFormId, List<BaseRecord> records) {
    _putRecords(moduleFormId, records);
    unawaited(_applyRadiusFilter());
  }

  Future<void> _fetchGlobalRemote() async {
    if (!_online || _globalRemoteFetchInFlight) return;
    _globalRemoteFetchInFlight = true;
    try {
      final results = await Future.wait([
        _birdRemote.getBirdRecordsForExport(),
        _rockRemote.getRockRecordsForExport(),
        _soilRemote.getSoilRecordsForExport(),
        _vegetationRemote.getVegetationRecordsForExport(),
        _waterRemote.getWaterRecordsForExport(),
        _socialRemote.getSocialRecordsForExport(),
      ]);

      _putRecords(FormMapperRegistry.moduloAves, results[0]);
      _putRecords(FormMapperRegistry.moduloRocas, results[1]);
      _putRecords(FormMapperRegistry.moduloSuelos, results[2]);
      _putRecords(FormMapperRegistry.moduloVegetacion, results[3]);
      _putRecords(FormMapperRegistry.moduloAgua, results[4]);
      _putRecords(FormMapperRegistry.moduloSocial, results[5]);

      await _applyRadiusFilter();
    } finally {
      _globalRemoteFetchInFlight = false;
    }
  }

  /// Tras guardar registro local (mapa sin esperar movimiento GPS).
  Future<void> refreshLocal() => _reloadLocalAndRebuild();

  Future<void> _reloadLocalAndRebuild() async {
    _recordsById.clear();
    _moduleByRecordId.clear();

    _putRecords(
      FormMapperRegistry.moduloAves,
      await _birdLocal.getAllRecords(),
    );
    _putRecords(
      FormMapperRegistry.moduloRocas,
      await _rockLocal.getAllRecords(),
    );
    _putRecords(
      FormMapperRegistry.moduloSuelos,
      await _soilLocal.getAllRecords(),
    );
    _putRecords(
      FormMapperRegistry.moduloVegetacion,
      await _vegetationLocal.getAllRecords(),
    );
    _putRecords(
      FormMapperRegistry.moduloAgua,
      await _waterLocal.getAllRecords(),
    );
    _putRecords(
      FormMapperRegistry.moduloSocial,
      await _socialLocal.getAllRecords(),
    );

    await _applyRadiusFilter();

    if (_online) {
      unawaited(_fetchGlobalRemote());
    }
  }

  Future<void> _applyRadiusFilter() async {
    final gpsCenter = _position;
    final focusCenter = _focusCenter;

    if (gpsCenter == null && focusCenter == null) {
      if (_nearbyPins.isNotEmpty) {
        _nearbyPins = [];
        notifyListeners();
      }
      return;
    }

    final pins = <MapRecordPin>[];
    final addedIds = <String>{};
    const distance = Distance();

    for (final entry in _recordsById.entries) {
      final moduleFormId = _moduleByRecordId[entry.key];
      if (moduleFormId == null) continue;
      if (!_activeModuleFilters.contains(moduleFormId)) continue;

      final record = entry.value;
      final c = record.coordinates;
      if (!isValidLatLng(c.latitude, c.longitude)) continue;

      final recordPoint = LatLng(c.latitude, c.longitude);
      var include = false;

      if (gpsCenter != null) {
        final metersFromGps = distance.as(
          LengthUnit.Meter,
          gpsCenter,
          recordPoint,
        );
        if (metersFromGps <= radiusMeters) include = true;
      }

      if (!include && focusCenter != null) {
        final metersFromFocus = distance.as(
          LengthUnit.Meter,
          focusCenter,
          recordPoint,
        );
        if (metersFromFocus <= focusRadiusMeters) include = true;
      }

      if (!include || addedIds.contains(record.id)) continue;
      addedIds.add(record.id);

      pins.add(
        MapRecordPin(
          id: record.id,
          recordId: record.id,
          moduleFormId: moduleFormId,
          latitude: c.latitude,
          longitude: c.longitude,
          pinColor: MapRecordPin.colorFor(moduleFormId),
          label: MapRecordPin.labelFor(moduleFormId),
          isOwnRecord:
              _currentUserId != null && record.userId == _currentUserId,
        ),
      );
    }

    _nearbyPins = pins;
    notifyListeners();
  }
}
