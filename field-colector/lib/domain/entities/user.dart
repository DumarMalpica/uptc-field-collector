import 'role.dart';

/// Entidad pura de dominio que representa a un usuario del sistema.
/// Sin anotaciones de Isar ni dependencias de Flutter.
///
/// El [token] y [tokenExpiry] permiten validar sesión offline sin internet.
/// El [fullName] autocompleta el campo "Observador" en todos los formularios.
class User {
  final String id;          // Firebase UID
  final String email;
  final String fullName;
  final String? fieldStudy;
  final bool graduated;
  final Role role;

  /// JWT retornado por Firebase Auth. Guardado en Isar para validación offline.
  final String? token;

  /// Expiración del token. Permite saber si la sesión offline sigue vigente.
  final DateTime? tokenExpiry;

  final bool isActive;
  final DateTime? createdAt;

  const User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.role,
    this.fieldStudy,
    this.graduated = false,
    this.token,
    this.tokenExpiry,
    this.isActive = true,
    this.createdAt,
  });

  /// Alias para compatibilidad con código existente que use .userName
  String get userName => fullName;

  /// Retorna true si el token existe y no ha expirado.
  bool get hasValidToken {
    if (token == null || tokenExpiry == null) return false;
    return DateTime.now().isBefore(tokenExpiry!);
  }

  bool hasPermission(String permission) => role.hasPermission(permission);

  User copyWith({
    String? id,
    String? email,
    String? fullName,
    String? fieldStudy,
    bool? graduated,
    Role? role,
    String? token,
    DateTime? tokenExpiry,
    bool? isActive,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      fieldStudy: fieldStudy ?? this.fieldStudy,
      graduated: graduated ?? this.graduated,
      role: role ?? this.role,
      token: token ?? this.token,
      tokenExpiry: tokenExpiry ?? this.tokenExpiry,
      isActive: isActive ?? this.isActive,
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