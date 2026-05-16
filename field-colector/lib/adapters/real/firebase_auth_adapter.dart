import 'package:firebase_auth/firebase_auth.dart' as fb;
import '../../domain/entities/user.dart';
import '../../domain/entities/role.dart';
import '../../domain/ports/auth_port.dart';
import '../../domain/ports/user_local_port.dart';

/// Ventana de sesión offline persistida (no cambia TTL del JWT de Firebase).
const Duration _persistedSessionValidity = Duration(days: 30);

class FirebaseAuthAdapter implements AuthPort {
  final fb.FirebaseAuth _firebaseAuth;
  final UserLocalPort _userLocalPort;

  FirebaseAuthAdapter(this._firebaseAuth, this._userLocalPort);

  @override
  Future<User> login(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final fbUser = credential.user;
      if (fbUser == null) {
        throw const AuthException(
          message: 'No se pudo obtener la información del usuario.',
          type: AuthErrorType.unknown,
        );
      }

      final tokenResult = await fbUser.getIdTokenResult();

      final user = User(
        id: fbUser.uid,
        email: fbUser.email ?? email,
        fullName: fbUser.displayName ?? 'Investigador',
        role: Role.user,
        token: tokenResult.token,
        tokenExpiry: DateTime.now().add(_persistedSessionValidity),
        createdAt: fbUser.metadata.creationTime,
      );

      await _userLocalPort.saveUser(user);

      return user;
    } on fb.FirebaseAuthException catch (e) {
      throw _handleFirebaseError(e);
    } catch (e) {
      throw AuthException(
        message: 'Error inesperado: $e',
        type: AuthErrorType.unknown,
      );
    }
  }

  @override
  Future<User> register({
    required String email,
    required String password,
    required String fullName,
    String? fieldStudy,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final fbUser = credential.user!;
      await fbUser.updateDisplayName(fullName);

      final tokenResult = await fbUser.getIdTokenResult();

      final user = User(
        id: fbUser.uid,
        email: email,
        fullName: fullName,
        fieldStudy: fieldStudy,
        role: Role.user,
        token: tokenResult.token,
        tokenExpiry: DateTime.now().add(_persistedSessionValidity),
        createdAt: fbUser.metadata.creationTime ?? DateTime.now(),
      );

      await _userLocalPort.saveUser(user);
      return user;
    } on fb.FirebaseAuthException catch (e) {
      throw _handleFirebaseError(e);
    } catch (e) {
      throw AuthException(
        message: 'Error inesperado: $e',
        type: AuthErrorType.unknown,
      );
    }
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
    await _userLocalPort.clearLocalUser();
  }

  @override
  Future<User?> getCurrentUser() async {
    final fbUser = _firebaseAuth.currentUser;
    if (fbUser == null) return null;

    try {
      final tokenResult = await fbUser.getIdTokenResult();
      final user = User(
        id: fbUser.uid,
        email: fbUser.email ?? '',
        fullName: fbUser.displayName ?? 'Investigador',
        role: Role.user,
        token: tokenResult.token,
        tokenExpiry: DateTime.now().add(_persistedSessionValidity),
        createdAt: fbUser.metadata.creationTime,
      );
      await _userLocalPort.saveUser(user);
      return user;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<User?> validateOfflineSession() async {
    final localUser = await _userLocalPort.getLocalUser();

    if (localUser != null && localUser.hasValidToken) {
      return localUser;
    }
    return null;
  }

  AuthException _handleFirebaseError(fb.FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return AuthException(
          message: 'Correo o contraseña incorrectos.',
          type: AuthErrorType.invalidCredentials,
        );
      case 'invalid-email':
        return AuthException(
          message: 'El formato del correo no es válido.',
          type: AuthErrorType.invalidEmail,
        );
      case 'weak-password':
        return AuthException(
          message:
              'La contraseña es demasiado débil. Use al menos 6 caracteres y combine letras y números.',
          type: AuthErrorType.weakPassword,
        );
      case 'email-already-in-use':
        return AuthException(
          message: 'El correo electrónico ya está registrado.',
          type: AuthErrorType.emailAlreadyInUse,
        );
      case 'network-request-failed':
        return AuthException(
          message: 'Error de red. Verifique su conexión.',
          type: AuthErrorType.networkError,
        );
      case 'too-many-requests':
        return AuthException(
          message:
              'Demasiados intentos. Espere unos minutos e intente de nuevo.',
          type: AuthErrorType.tooManyRequests,
        );
      case 'operation-not-allowed':
        return AuthException(
          message:
              'Esta operación no está habilitada. Contacte al administrador.',
          type: AuthErrorType.unknown,
        );
      default:
        return AuthException(
          message: e.message ?? 'Ocurrió un error en la autenticación.',
          type: AuthErrorType.unknown,
        );
    }
  }
}