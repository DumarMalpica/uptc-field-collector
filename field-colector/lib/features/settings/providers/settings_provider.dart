import 'dart:io';

import 'package:field_colector/core/database/app_settings_store.dart';
import 'package:field_colector/core/database/form_draft_service.dart';
import 'package:field_colector/domain/entities/app_settings.dart';
import 'package:field_colector/features/map/map_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

/// Preferencias de la app: carga/guarda en disco y acciones de almacenamiento.
class SettingsProvider extends ChangeNotifier {
  SettingsProvider({
    required AppSettingsStore store,
    required MapServices mapServices,
    required FormDraftService formDrafts,
  }) : _store = store,
       _mapServices = mapServices,
       _formDrafts = formDrafts {
    Future.microtask(_bootstrap);
  }

  static const String previewStoreId = 'field_preview';
  static const String defaultSupportEmail = 'grupo.citesa@uptc.edu.co';

  final AppSettingsStore _store;
  final MapServices _mapServices;
  final FormDraftService _formDrafts;

  AppSettings _settings = const AppSettings();
  bool _isLoading = true;
  bool _isBusy = false;
  String? _storageSummary;
  PackageInfo? _packageInfo;

  bool get isLoading => _isLoading;
  bool get isBusy => _isBusy;
  String? get storageSummary => _storageSummary;
  PackageInfo? get packageInfo => _packageInfo;

  AppSettings get settings => _settings;

  GpsAccuracyLevel get gpsAccuracy => _settings.gpsAccuracy;
  int get locationUpdateIntervalSeconds =>
      _settings.locationUpdateIntervalSeconds;
  CoordinateFormat get coordinateFormat => _settings.coordinateFormat;
  double get defaultZoom => _settings.defaultZoom;
  bool get showLocationMarker => _settings.showLocationMarker;
  MapDisplayType get mapType => _settings.mapType;

  String get supportEmail =>
      dotenv.maybeGet('SUPPORT_EMAIL') ?? defaultSupportEmail;

  Future<void> _bootstrap() async {
    _settings = await _store.load();
    _packageInfo = await PackageInfo.fromPlatform();
    await refreshStorageSummary();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> refreshStorageSummary() async {
    _storageSummary = await _computeStorageSummary();
    notifyListeners();
  }

  Future<String> _computeStorageSummary() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final bytes = await _directorySize(dir);
      final draftCount = _formDrafts.modulePathsWithDrafts.length;
      final areas = await _mapServices.areaRepository.getSavedAreas();
      return '${_formatBytes(bytes)} en datos locales · '
          '$draftCount borrador(es) · ${areas.length} zona(s) de mapa';
    } catch (_) {
      return 'No disponible';
    }
  }

  Future<int> _directorySize(Directory dir) async {
    var total = 0;
    if (!await dir.exists()) return 0;
    await for (final entity in dir.list(recursive: true, followLinks: false)) {
      if (entity is File) {
        total += await entity.length();
      }
    }
    return total;
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  Future<void> _persist(AppSettings next) async {
    _settings = next;
    await _store.save(next);
    notifyListeners();
  }

  Future<void> setGpsAccuracy(GpsAccuracyLevel value) =>
      _persist(_settings.copyWith(gpsAccuracy: value));

  Future<void> setLocationUpdateIntervalSeconds(int value) =>
      _persist(_settings.copyWith(locationUpdateIntervalSeconds: value));

  Future<void> setCoordinateFormat(CoordinateFormat value) =>
      _persist(_settings.copyWith(coordinateFormat: value));

  Future<void> setDefaultZoom(double value) =>
      _persist(_settings.copyWith(defaultZoom: value));

  Future<void> setShowLocationMarker(bool value) =>
      _persist(_settings.copyWith(showLocationMarker: value));

  Future<void> setMapType(MapDisplayType value) =>
      _persist(_settings.copyWith(mapType: value));

  /// IDs de almacenes FMTC a limpiar (zonas descargadas + vista previa).
  Future<List<String>> tileStoreIdsToClear() async {
    final areas = await _mapServices.areaRepository.getSavedAreas();
    return [previewStoreId, ...areas.map((a) => a.id)];
  }

  Future<void> clearMapTileCache() async {
    if (_isBusy) return;
    _isBusy = true;
    notifyListeners();
    try {
      final ids = await tileStoreIdsToClear();
      await _mapServices.tileCache.clearCachedTiles(ids);
      await refreshStorageSummary();
    } finally {
      _isBusy = false;
      notifyListeners();
    }
  }

  Future<void> clearAllFormDrafts() async {
    if (_isBusy) return;
    _isBusy = true;
    notifyListeners();
    try {
      await _formDrafts.clearAllDrafts();
      await refreshStorageSummary();
    } finally {
      _isBusy = false;
      notifyListeners();
    }
  }
}
