import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

/// Persistencia local del conjunto de expediciones marcadas para uso offline.
///
/// Guarda un archivo JSON con la lista de IDs (outingId) pinned.
/// Patrón atómico: write-to-tmp → rename, igual que [AppSettingsStore].
class OfflinePinStore {
  static const String _fileName = 'offline_pins_v1.json';

  Future<File> _pinFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_fileName');
  }

  /// Lee los IDs pinned del disco. Devuelve vacío si no existe.
  Future<Set<String>> load() async {
    try {
      final file = await _pinFile();
      if (!await file.exists()) return {};
      final decoded = jsonDecode(await file.readAsString());
      if (decoded is! List) return {};
      return decoded.cast<String>().toSet();
    } catch (e, st) {
      if (kDebugMode) {
        debugPrint('OfflinePinStore.load: $e');
        debugPrintStack(stackTrace: st);
      }
      return {};
    }
  }

  /// Escribe el conjunto completo de IDs al disco.
  Future<void> save(Set<String> ids) async {
    final file = await _pinFile();
    final tmp = File('${file.path}.tmp');
    final text = const JsonEncoder.withIndent('  ').convert(ids.toList());
    await tmp.writeAsString(text, flush: true);
    await tmp.rename(file.path);
  }

  /// Agrega un ID al conjunto persistido.
  Future<void> addPin(String id) async {
    final ids = await load();
    ids.add(id);
    await save(ids);
  }

  /// Quita un ID del conjunto persistido.
  Future<void> removePin(String id) async {
    final ids = await load();
    ids.remove(id);
    await save(ids);
  }
}
