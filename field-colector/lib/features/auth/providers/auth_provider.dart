import 'package:field_colector/core/services/session_validation_service.dart';
import 'package:field_colector/domain/entities/session_status.dart';
import 'package:field_colector/domain/entities/user.dart';
import 'package:field_colector/domain/mappers/login_user.dart';
import 'package:field_colector/domain/mappers/register_user_dto_builder.dart';
import 'package:field_colector/domain/ports/auth_port.dart';
import 'package:flutter/material.dart';

/// Estado de autenticación de la app: orquesta [AuthPort] (login, sesión, cierre).
///
/// **Responsabilidad:** mantener [user] y notificar a la UI. [register]
/// delega en [AuthPort.register]. Persistencia de token
/// y validación offline quedan en el **adaptador** inyectado, no en este
/// provider.
///
/// **Flujo de arranque:** [HomeScreen] llama [restoreSession] en `initState`;
/// mientras [isLoading] es true, no asumir autenticado. [isAuthenticated] exige
/// [User.hasValidToken] (token + `tokenExpiry` no vencido).
class Authprovider extends ChangeNotifier {
  Authprovider({
    required AuthPort authPort,
    required SessionValidationService sessionValidation,
  }) : _authPort = authPort,
        _sessionValidation = sessionValidation;

  final AuthPort _authPort;
  final SessionValidationService _sessionValidation;

  User? _user;

  bool _isLoading = true;
  String? _errorMessage;
  AuthErrorType? _lastAuthError;
  SessionStatus? _lastSessionStatus;

  bool get isLoading => _isLoading;

  User? get user => _user;

  String? get token => _user?.token;

  /// Mensaje tras fallo en [login] / [register]. Null si no hubo error reciente de auth.
  String? get errorMessage => _errorMessage;

  /// Tipo del último [AuthException] en [login] / [register]. Null si no hubo fallo reciente.
  AuthErrorType? get lastAuthError => _lastAuthError;

  /// Último resultado de [restoreSession] (validación local). Null hasta primer restore.
  SessionStatus? get lastSessionStatus => _lastSessionStatus;

  void _setUser(User user) {
    _user = user;
  }

  void _setAuthFailure(AuthException e) {
    _errorMessage = e.message;
    _lastAuthError = e.type;
    notifyListeners();
  }

  /// Limpia [errorMessage] / [lastAuthError] tras edición en formularios (evita mensaje obsoleto).
  void clearAuthFormError() {
    if (_errorMessage == null && _lastAuthError == null) return;
    _errorMessage = null;
    _lastAuthError = null;
    notifyListeners();
  }

  /// Aplica usuario restaurado desde el puerto (token válido) o limpia sesión.
  void _applySessionUser(User? restored) {
    if (restored != null && restored.hasValidToken) {
      _setUser(restored);
      _errorMessage = null;
      _lastAuthError = null;
    } else {
      _user = null;
    }
  }

  /// Prioridad: primero sesión offline válida ([AuthPort.validateOfflineSession]),
  /// si no hay, usuario activo ([AuthPort.getCurrentUser]).
  Future<void> _loadSessionFromPort() async {
    User? restored = await _authPort.validateOfflineSession();
    restored ??= await _authPort.getCurrentUser();
    _applySessionUser(restored);
  }

  Future<void> logout() async {
    await _authPort.logout();
    _user = null;
    _lastSessionStatus = null;
    _errorMessage = null;
    _lastAuthError = null;
    notifyListeners();
  }

  Future<void> login(LoginUser credentials) async {
    try {
      final domainUser = await _authPort.login(
        credentials.email,
        credentials.password,
      );
      _setUser(domainUser);
      _lastSessionStatus = null;
      _errorMessage = null;
      _lastAuthError = null;
      notifyListeners();
    } on AuthException catch (e) {
      _user = null;
      _setAuthFailure(e);
    }
  }

  /// Registro vía [AuthPort]; en éxito deja sesión como [login].
  Future<void> register(RegisterUserDto dto) async {
    try {
      final domainUser = await _authPort.register(
        email: dto.email,
        password: dto.password,
        fullName: dto.fullName,
        fieldStudy: dto.fieldOfStudy,
      );
      _setUser(domainUser);
      _lastSessionStatus = null;
      _errorMessage = null;
      _lastAuthError = null;
      notifyListeners();
    } on AuthException catch (e) {
      _user = null;
      _setAuthFailure(e);
    }
  }

  /// Vuelve a leer sesión desde el puerto sin overlay de carga.
  ///
  /// [AuthPort] no define renovación JWT explícita aún; esto solo re-hidrata.
  // TODO: cuando exista renovación real (Firebase / refresh endpoint), llamarla
  // desde aquí o desde el adaptador y luego actualizar [_user].
  Future<void> refreshToken() async {
    await _loadSessionFromPort();
    notifyListeners();
  }

  /// Arranque en frío: validación local con códigos; si token vencido, intenta refresco vía red.
  Future<void> restoreSession() async {
    _isLoading = true;
    notifyListeners();
    try {
      final session = await _sessionValidation.validate();
      _lastSessionStatus = session.status;

      switch (session.status) {
        case SessionStatus.valid:
          if (session.user != null) {
            _setUser(session.user!);
            _errorMessage = null;
            _lastAuthError = null;
          } else {
            _user = null;
          }
          break;
        case SessionStatus.expired:
          final refreshed = await _authPort.getCurrentUser();
          _applySessionUser(refreshed);
          if (_user == null) {
            _errorMessage = 'Sesión expirada. Inicie sesión de nuevo.';
            _lastAuthError = null;
          }
          break;
        case SessionStatus.notFound:
        case SessionStatus.corrupted:
          _user = null;
          _errorMessage = null;
          _lastAuthError = null;
          break;
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  bool get isAuthenticated => _user?.hasValidToken ?? false;
}
