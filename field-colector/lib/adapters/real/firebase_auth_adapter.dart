import 'package:firebase_auth/firebase_auth.dart' as fb;
import '../../domain/entities/user.dart';
import '../../domain/entities/role.dart';
import '../../domain/ports/auth_port.dart';
import '../../domain/ports/user_local_port.dart';

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
        tokenExpiry: tokenResult.expirationTime,
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

      await credential.user?.updateDisplayName(fullName);

      final user = User(
        id: credential.user!.uid,
        email: email,
        fullName: fullName,
        fieldStudy: fieldStudy,
        role: Role.user,
        createdAt: DateTime.now(),
      );

      await _userLocalPort.saveUser(user);
      return user;
    } on fb.FirebaseAuthException catch (e) {
      throw _handleFirebaseError(e);
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

    return User(
      id: fbUser.uid,
      email: fbUser.email ?? '',
      fullName: fbUser.displayName ?? '',
      role: Role.user,
    );
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
      default:
        return AuthException(
          message: e.message ?? 'Ocurrió un error en la autenticación.',
          type: AuthErrorType.unknown,
        );
    }
  }
}