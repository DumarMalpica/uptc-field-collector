import 'user.dart';

/// Resultado de validar sesión local (offline).
enum SessionStatus {
  /// Token presente y vigente.
  valid,

  /// Token presente pero vencido.
  expired,

  /// No hay usuario local activo.
  notFound,

  /// Usuario local pero token o expiración ausentes o inconsistentes.
  corrupted,
}

class SessionResult {
  const SessionResult({required this.status, this.user});

  final SessionStatus status;
  final User? user;
}
