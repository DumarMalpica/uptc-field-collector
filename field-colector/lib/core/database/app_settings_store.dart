import 'dart:convert';
import 'dart:io';

import 'package:field_colector/domain/entities/app_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

/// Persistencia local de preferencias (JSON en documentos).
///
/// Patrón singleton: un único documento en disco, equivalente al registro
/// fijo id=1 del plan Isar.
class AppSettingsStore {
  static const String _fileName = 'app_settings_v1.json';

  Future<File> _settingsFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_fileName');
  }

  Future<AppSettings> load() async {
    try {
      final file = await _settingsFile();
      if (!await file.exists()) return const AppSettings();
      final decoded = jsonDecode(await file.readAsString());
      if (decoded is! Map) return const AppSettings();
      return _fromJson(Map<String, dynamic>.from(decoded));
    } catch (e, st) {
      if (kDebugMode) {
        debugPrint('AppSettingsStore.load: $e');
        debugPrintStack(stackTrace: st);
      }
      return const AppSettings();
    }
  }

  Future<void> save(AppSettings settings) async {
    final file = await _settingsFile();
    final tmp = File('${file.path}.tmp');
    final text = const JsonEncoder.withIndent('  ').convert(_toJson(settings));
    await tmp.writeAsString(text, flush: true);
    await tmp.rename(file.path);
  }

  Map<String, dynamic> _toJson(AppSettings s) => {
        'gpsAccuracyId': s.gpsAccuracy.id,
        'locationUpdateIntervalSeconds': s.locationUpdateIntervalSeconds,
        'coordinateFormatId': s.coordinateFormat.id,
        'defaultZoom': s.defaultZoom,
        'showLocationMarker': s.showLocationMarker,
        'mapTypeId': s.mapType.id,
      };

  AppSettings _fromJson(Map<String, dynamic> json) {
    return AppSettings(
      gpsAccuracy: GpsAccuracyLevel.fromId(
        json['gpsAccuracyId'] as String? ?? GpsAccuracyLevel.balanced.id,
      ),
      locationUpdateIntervalSeconds:
          (json['locationUpdateIntervalSeconds'] as num?)?.toInt() ?? 22,
      coordinateFormat: CoordinateFormat.fromId(
        json['coordinateFormatId'] as String? ?? CoordinateFormat.decimal.id,
      ),
      defaultZoom: (json['defaultZoom'] as num?)?.toDouble() ?? 15,
      showLocationMarker: json['showLocationMarker'] as bool? ?? true,
      mapType: MapDisplayType.fromId(
        json['mapTypeId'] as String? ?? MapDisplayType.standard.id,
      ),
    );
  }
}
