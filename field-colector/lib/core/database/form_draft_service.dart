import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

/// Persistencia local de borradores de formularios dinámicos (JSON en documentos).
///
/// Equivalente funcional al almacén Isar del plan; evita codegen cuando no hay
/// `build_runner` disponible. Notifica a los oyentes tras guardar o borrar.
class FormDraftService extends ChangeNotifier {
  static const String _fileName = 'dynamic_form_drafts_v1.json';

  final Set<String> _pathsWithDrafts = {};

  FormDraftService() {
    Future.microtask(_warmCache);
  }

  Set<String> get modulePathsWithDrafts =>
      Set<String>.unmodifiable(_pathsWithDrafts);

  Future<File> _draftsFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_fileName');
  }

  Future<Map<String, dynamic>> _readRoot() async {
    try {
      final file = await _draftsFile();
      if (!await file.exists()) return {'modules': <String, dynamic>{}};
      final decoded = jsonDecode(await file.readAsString());
      if (decoded is! Map) return {'modules': <String, dynamic>{}};
      final map = Map<String, dynamic>.from(decoded);
      map.putIfAbsent('modules', () => <String, dynamic>{});
      if (map['modules'] is! Map) map['modules'] = <String, dynamic>{};
      return map;
    } catch (e, st) {
      if (kDebugMode) {
        debugPrint('FormDraftService._readRoot: $e');
        debugPrintStack(stackTrace: st);
      }
      return {'modules': <String, dynamic>{}};
    }
  }

  Future<void> _writeRoot(Map<String, dynamic> root) async {
    final file = await _draftsFile();
    final tmp = File('${file.path}.tmp');
    final text = const JsonEncoder.withIndent('  ').convert(root);
    await tmp.writeAsString(text, flush: true);
    await tmp.rename(file.path);
  }

  Future<void> _warmCache() async {
    final paths = await getModulePathsWithDrafts();
    _pathsWithDrafts
      ..clear()
      ..addAll(paths);
    notifyListeners();
  }

  void _syncCacheFromModules(Map<String, dynamic> modules) {
    _pathsWithDrafts.clear();
    for (final entry in modules.entries) {
      if (entry.value is Map<String, dynamic>) {
        final inner = entry.value as Map<String, dynamic>;
        final values = inner['values'];
        if (values is Map && values.isNotEmpty) {
          _pathsWithDrafts.add(entry.key);
        }
      }
    }
  }

  /// Rutas de módulo (`assetPath`) que tienen al menos un borrador guardado.
  Future<Set<String>> getModulePathsWithDrafts() async {
    final root = await _readRoot();
    final modules = Map<String, dynamic>.from(
      root['modules'] as Map? ?? {},
    );
    final out = <String>{};
    for (final entry in modules.entries) {
      final wrap = entry.value;
      if (wrap is! Map) continue;
      final values = wrap['values'];
      if (values is Map && values.isNotEmpty) {
        out.add(entry.key);
      }
    }
    return out;
  }

  Future<bool> hasDraft(String moduleAssetPath) async {
    if (_pathsWithDrafts.contains(moduleAssetPath)) return true;
    return (await getModulePathsWithDrafts()).contains(moduleAssetPath);
  }

  Future<Map<String, dynamic>?> loadDraft(String moduleAssetPath) async {
    final root = await _readRoot();
    final modules = Map<String, dynamic>.from(
      root['modules'] as Map? ?? {},
    );
    final wrap = modules[moduleAssetPath];
    if (wrap is! Map) return null;
    final raw = wrap['values'];
    if (raw is! Map) return null;
    return raw.map(
      (k, v) => MapEntry(k.toString(), _decodeValue(v)),
    );
  }

  dynamic _decodeValue(dynamic v) {
    if (v is Map) {
      return v.map((k, val) => MapEntry(k.toString(), _decodeValue(val)));
    }
    if (v is List) {
      return v.map(_decodeValue).toList();
    }
    return v;
  }

  Future<void> saveDraft(
    String moduleAssetPath,
    Map<String, dynamic> values,
  ) async {
    final root = await _readRoot();
    final modules = Map<String, dynamic>.from(
      root['modules'] as Map? ?? {},
    );
    modules[moduleAssetPath] = {
      'updatedAt': DateTime.now().toIso8601String(),
      'values': Map<String, dynamic>.from(values),
    };
    root['modules'] = modules;
    await _writeRoot(root);
    _syncCacheFromModules(modules);
    notifyListeners();
  }

  Future<void> clearDraft(String moduleAssetPath) async {
    final root = await _readRoot();
    final modules = Map<String, dynamic>.from(
      root['modules'] as Map? ?? {},
    );
    modules.remove(moduleAssetPath);
    root['modules'] = modules;
    await _writeRoot(root);
    _pathsWithDrafts.remove(moduleAssetPath);
    notifyListeners();
  }

  Future<void> clearAllDrafts() async {
    await _writeRoot({'modules': <String, dynamic>{}});
    _pathsWithDrafts.clear();
    notifyListeners();
  }
}
