import '../../domain/entities/session_status.dart';
import '../../domain/ports/user_local_port.dart';

/// Valida sesión persistida localmente sin depender de Firebase.
class SessionValidationService {
  SessionValidationService(this._localPort);

  final UserLocalPort _localPort;

  /// Lee usuario crudo en Isar y clasifica estado para UI y arranque.
  Future<SessionResult> validate() async {
    final user = await _localPort.getRawLocalUser();
    if (user == null) {
      return const SessionResult(status: SessionStatus.notFound);
    }
    if (user.token == null || user.tokenExpiry == null) {
      return SessionResult(status: SessionStatus.corrupted, user: user);
    }
    if (DateTime.now().isAfter(user.tokenExpiry!)) {
      return SessionResult(status: SessionStatus.expired, user: user);
    }
    return SessionResult(status: SessionStatus.valid, user: user);
  }
}
