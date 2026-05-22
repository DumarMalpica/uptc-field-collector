import '../../domain/entities/user.dart';
import '../../domain/ports/user_remote_port.dart';

/// Resuelve IDs de usuario a [User] con cache en memoria (batch + remoto).
class UserCacheService {
  UserCacheService({required UserRemotePort userRemote}) : _userRemote = userRemote;

  final UserRemotePort _userRemote;
  final Map<String, User> _cache = {};

  /// Devuelve mapa id → [User] para los IDs solicitados (cache + fetch faltantes).
  /// [sessionUser] se incluye sin red (usuario en sesión).
  Future<Map<String, User>> resolveUsers(
    Iterable<String> ids, {
    User? sessionUser,
  }) async {
    final unique = ids.where((id) => id.isNotEmpty).toSet();
    final result = <String, User>{};

    if (sessionUser != null && sessionUser.id.isNotEmpty) {
      _cache[sessionUser.id] = sessionUser;
      result[sessionUser.id] = sessionUser;
    }

    final missing = <String>[];
    for (final id in unique) {
      final cached = _cache[id];
      if (cached != null) {
        result[id] = cached;
      } else {
        missing.add(id);
      }
    }

    for (final id in missing) {
      try {
        final user = await _userRemote.getUserById(id);
        if (user != null) {
          _cache[id] = user;
          result[id] = user;
        }
      } catch (_) {
        // Sin red o usuario inexistente: no se cachea; UI usa fallback.
      }
    }

    return result;
  }

  User? getCached(String id) => _cache[id];

  void seedUser(User user) {
    if (user.id.isNotEmpty) _cache[user.id] = user;
  }
}
