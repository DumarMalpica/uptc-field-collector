import 'package:field_colector/core/database/user_manual_intro_store.dart';
import 'package:field_colector/domain/entities/user_manual_intro_prefs.dart';
import 'package:flutter/foundation.dart';

/// Elección del diálogo de consentimiento del manual.
enum ManualIntroChoice {
  /// Abre el manual ahora; no volver a preguntar al iniciar.
  onceOnly,

  /// Abre el manual ahora; repetir el diálogo en cada arranque.
  onLaunch,

  /// No abre el manual; no volver a preguntar al iniciar.
  dismiss,
}

/// Estado y persistencia del prompt del manual (aislado de [AppSettings]).
class ManualIntroProvider extends ChangeNotifier {
  ManualIntroProvider({UserManualIntroStore? store})
      : _store = store ?? UserManualIntroStore();

  final UserManualIntroStore _store;

  Map<String, UserManualIntroPrefs> _prefsByUser = {};
  bool _loaded = false;

  bool get isLoaded => _loaded;

  UserManualIntroPrefs prefsFor(String userId) =>
      _prefsByUser[userId] ?? const UserManualIntroPrefs();

  bool shouldPrompt(String userId) => prefsFor(userId).shouldPrompt;

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    _prefsByUser = await _store.loadAll();
    _loaded = true;
    notifyListeners();
  }

  Future<void> markPendingAfterRegistration(String userId) async {
    await ensureLoaded();
    final current = prefsFor(userId);
    await _persist(
      userId,
      current.copyWith(pendingRegisterPrompt: true),
    );
  }

  /// Persiste la elección del usuario. Devuelve si debe abrirse el manual.
  Future<bool> applyChoice(String userId, ManualIntroChoice choice) async {
    await ensureLoaded();
    final showOnLaunch = choice == ManualIntroChoice.onLaunch;
    final openManual = choice != ManualIntroChoice.dismiss;
    await _persist(
      userId,
      UserManualIntroPrefs(
        pendingRegisterPrompt: false,
        showOnAppLaunch: showOnLaunch,
      ),
    );
    return openManual;
  }

  Future<void> _persist(String userId, UserManualIntroPrefs prefs) async {
    _prefsByUser = Map<String, UserManualIntroPrefs>.from(_prefsByUser)
      ..[userId] = prefs;
    await _store.saveForUser(userId, prefs);
    notifyListeners();
  }
}
