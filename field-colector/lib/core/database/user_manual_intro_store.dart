import 'dart:convert';
import 'dart:io';

import 'package:field_colector/domain/entities/user_manual_intro_prefs.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

/// Persistencia local del prompt del manual (mapa userId → prefs).
class UserManualIntroStore {
  static const String _fileName = 'user_manual_intro_v1.json';

  Future<File> _prefsFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_fileName');
  }

  Future<Map<String, UserManualIntroPrefs>> loadAll() async {
    try {
      final file = await _prefsFile();
      if (!await file.exists()) return {};
      final decoded = jsonDecode(await file.readAsString());
      if (decoded is! Map) return {};
      final result = <String, UserManualIntroPrefs>{};
      for (final entry in decoded.entries) {
        if (entry.key is! String || entry.value is! Map) continue;
        result[entry.key as String] = _fromJson(
          Map<String, dynamic>.from(entry.value as Map),
        );
      }
      return result;
    } catch (e, st) {
      if (kDebugMode) {
        debugPrint('UserManualIntroStore.loadAll: $e');
        debugPrintStack(stackTrace: st);
      }
      return {};
    }
  }

  Future<UserManualIntroPrefs> loadForUser(String userId) async {
    final all = await loadAll();
    return all[userId] ?? const UserManualIntroPrefs();
  }

  Future<void> saveForUser(
    String userId,
    UserManualIntroPrefs prefs,
  ) async {
    final all = await loadAll();
    all[userId] = prefs;
    await _saveAll(all);
  }

  Future<void> _saveAll(Map<String, UserManualIntroPrefs> all) async {
    final file = await _prefsFile();
    final tmp = File('${file.path}.tmp');
    final jsonMap = <String, dynamic>{};
    for (final entry in all.entries) {
      jsonMap[entry.key] = _toJson(entry.value);
    }
    final text = const JsonEncoder.withIndent('  ').convert(jsonMap);
    await tmp.writeAsString(text, flush: true);
    await tmp.rename(file.path);
  }

  Map<String, dynamic> _toJson(UserManualIntroPrefs p) => {
        'pendingRegisterPrompt': p.pendingRegisterPrompt,
        'showOnAppLaunch': p.showOnAppLaunch,
      };

  UserManualIntroPrefs _fromJson(Map<String, dynamic> json) {
    return UserManualIntroPrefs(
      pendingRegisterPrompt: json['pendingRegisterPrompt'] as bool? ?? false,
      showOnAppLaunch: json['showOnAppLaunch'] as bool? ?? false,
    );
  }
}
