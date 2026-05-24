/// Preferencias del prompt del manual de usuario (por cuenta).
class UserManualIntroPrefs {
  const UserManualIntroPrefs({
    this.pendingRegisterPrompt = false,
    this.showOnAppLaunch = false,
  });

  /// Tras registro: mostrar diálogo de consentimiento al entrar al dashboard.
  final bool pendingRegisterPrompt;

  /// Si es true, el diálogo se repite en cada arranque con sesión válida.
  final bool showOnAppLaunch;

  bool get shouldPrompt => pendingRegisterPrompt || showOnAppLaunch;

  UserManualIntroPrefs copyWith({
    bool? pendingRegisterPrompt,
    bool? showOnAppLaunch,
  }) {
    return UserManualIntroPrefs(
      pendingRegisterPrompt:
          pendingRegisterPrompt ?? this.pendingRegisterPrompt,
      showOnAppLaunch: showOnAppLaunch ?? this.showOnAppLaunch,
    );
  }
}
