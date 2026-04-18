import '../entities/user.dart';

/// Puerto de autenticación.
abstract class AuthPort {
  /// Autentica con email y contraseña.
  /// Lanza [AuthException] si las credenciales son incorrectas.
  Future<User> login(String email, String password);

  /// Registra un nuevo usuario. [fullName] es obligatorio (autocompleta Observador).
  Future<User> register({
    required String email,
    required String password,
    required String fullName,
    String? fieldStudy,
  });

  /// Cierra sesión y limpia el token local.
  Future<void> logout();

  /// Retorna el usuario activo, o null si no hay sesión.
  Future<User?> getCurrentUser();

  /// Valida sesión offline usando el token guardado (sin internet).
  /// Retorna null si no hay token válido.
  Future<User?> validateOfflineSession();
}

/// Excepción de dominio — aísla la UI de excepciones de Firebase
class AuthException implements Exception {
  final String message;
  final AuthErrorType type;

  const AuthException({required this.message, required this.type});

  @override
  String toString() => 'AuthException(${type.name}): $message';
}

enum AuthErrorType {
  invalidCredentials,
  emailAlreadyInUse,
  weakPassword,
  networkError,
  sessionExpired,
  unknown,
}