import 'role.dart';

/// Entidad pura de dominio que representa a un usuario del sistema.
/// Sin anotaciones de Isar ni dependencias de Flutter.
///
/// El [token] y [tokenExpiry] permiten validar sesión offline sin internet.
/// El [fullName] autocompleta el campo "Observador" en todos los formularios.
class User {
  final String id;           // Firebase UID
  final String email;
  final String fullName;     // Antes: userName — renombrado para alinearse al diseño
  final Role role;

  /// JWT retornado por Firebase Auth. Guardado en Isar para validación offline.
  final String? token;

  /// Expiración del token. Permite saber si la sesión offline sigue vigente.
  final DateTime? tokenExpiry;

  final bool isActive;
  final String? fieldStudy;
  final DateTime? createdAt;

  const User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.role,
    this.token,
    this.tokenExpiry,
    this.isActive = true,
    this.fieldStudy,
    this.createdAt,
  });

  String get userName => fullName;

  /// aqui valido si el token expira o no
  bool get hasValidToken {
    if (token == null || tokenExpiry == null) return false;
    return DateTime.now().isBefore(tokenExpiry!);
  }

  bool hasPermission(String permission) => role.hasPermission(permission);

  User copyWith({
    String? id,
    String? email,
    String? fullName,
    Role? role,
    String? token,
    DateTime? tokenExpiry,
    bool? isActive,
    String? fieldStudy,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      role: role ?? this.role,
      token: token ?? this.token,
      tokenExpiry: tokenExpiry ?? this.tokenExpiry,
      isActive: isActive ?? this.isActive,
      fieldStudy: fieldStudy ?? this.fieldStudy,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is User && other.id == id);

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'User(id: $id, email: $email, role: ${role.id})';
}