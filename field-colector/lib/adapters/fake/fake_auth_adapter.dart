import '../../domain/entities/role.dart';
import '../../domain/entities/user.dart';
import '../../domain/ports/auth_port.dart';

/// Adaptador falso de autenticación
/// Credenciales de prueba:
///   admin@citesa.co        / Admin2024!   → Administrador
///   profesional@citesa.co  / Field2024!   → Profesional
///   campo@citesa.co        / Field2024!   → Investigador de campo
///
class FakeAuthAdapter implements AuthPort {
  static final List<_FakeUser> _seed = [
    _FakeUser(
      id: 'fake-uid-001',
      email: 'admin@citesa.co',
      password: 'Admin2024!',
      fullName: 'Administrador Citesa',
      role: Role.admin,
      fieldStudy: 'Administración',
    ),
    _FakeUser(
      id: 'fake-uid-002',
      email: 'profesional@citesa.co',
      password: 'Field2024!',
      fullName: 'Carlos Biólogo',
      role: Role.professional,
      fieldStudy: 'Biología',
    ),
    _FakeUser(
      id: 'fake-uid-003',
      email: 'campo@citesa.co',
      password: 'Field2024!',
      fullName: 'Ana Investigadora',
      role: Role.fieldResearcher,
      fieldStudy: 'Ecología',
    ),
  ];

  /// Usuarios creados en runtime durante la sesión actual.
  final List<_FakeUser> _runtime = [];

  User? _activeUser;

  @override
  Future<User> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 350));

    final normalizedEmail = email.trim().toLowerCase();
    final all = [..._seed, ..._runtime];
    final match = all.where(
          (u) => u.email == normalizedEmail && u.password == password,
    );

    if (match.isEmpty) {
      throw const AuthException(
        message: 'Correo o contraseña incorrectos.',
        type: AuthErrorType.invalidCredentials,
      );
    }

    _activeUser = match.first.toUser(
      token: 'fake-jwt-${match.first.id}-${DateTime.now().millisecondsSinceEpoch}',
      tokenExpiry: DateTime.now().add(const Duration(hours: 8)),
    );
    return _activeUser!;
  }

  @override
  Future<User> register({
    required String email,
    required String password,
    required String fullName,
    String? fieldStudy,
  }) async {
    await Future.delayed(const Duration(milliseconds: 350));

    final normalizedEmail = email.trim().toLowerCase();
    final all = [..._seed, ..._runtime];

    if (all.any((u) => u.email == normalizedEmail)) {
      throw const AuthException(
        message: 'Este correo ya está registrado.',
        type: AuthErrorType.emailAlreadyInUse,
      );
    }

    if (password.length < 6) {
      throw const AuthException(
        message: 'La contraseña debe tener al menos 6 caracteres.',
        type: AuthErrorType.weakPassword,
      );
    }

    final newUser = _FakeUser(
      id: 'fake-uid-rt-${DateTime.now().millisecondsSinceEpoch}',
      email: normalizedEmail,
      password: password,
      fullName: fullName.trim(),
      role: Role.fieldResearcher, // rol por defecto al registrarse, SE PUEDE CAMBIAR SI SE REQUIERE (JOSELUIS)
      fieldStudy: fieldStudy,
    );

    _runtime.add(newUser);
    _activeUser = newUser.toUser(
      token: 'fake-jwt-${newUser.id}',
      tokenExpiry: DateTime.now().add(const Duration(hours: 8)),
    );
    return _activeUser!;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _activeUser = null;
  }

  @override
  Future<User?> getCurrentUser() async => _activeUser;

  @override
  Future<User?> validateOfflineSession() async {
    if (_activeUser == null) return null;
    if (!_activeUser!.hasValidToken) {
      _activeUser = null;
      return null;
    }
    return _activeUser;
  }
}

class _FakeUser {
  final String id;
  final String email;
  final String password;
  final String fullName;
  final Role role;
  final String? fieldStudy;

  const _FakeUser({
    required this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.role,
    this.fieldStudy,
  });

  User toUser({String? token, DateTime? tokenExpiry}) => User(
    id: id,
    email: email,
    fullName: fullName,
    role: role,
    token: token,
    tokenExpiry: tokenExpiry,
    fieldStudy: fieldStudy,
    createdAt: DateTime(2024, 1, 1),
  );
}