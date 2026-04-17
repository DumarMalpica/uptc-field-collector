class Role {
  final String id;
  final String name;
  final List<String> permissions;

  const Role({
    required this.id,
    required this.name,
    required this.permissions,
  });

  /// Verifica si este rol tiene un permiso específico.
  bool hasPermission(String permission) {
    return permissions.contains(permission);
  }

  // ── Roles predefinidos del sistema ──────────────────────────────────────────

  /// Profesional — puede crear expediciones, cerrarlas y exportar datos.
  static const Role professional = Role(
    id: 'professional',
    name: 'Profesional',
    permissions: ['create_outing', 'close_outing', 'export'],
  );

  /// Usuario base — sus permisos de registro dependen de su membresía
  /// a una expedición
  static const Role user = Role(
    id: 'user',
    name: 'Usuario',
    permissions: [],
  );

  /// Retorna un Role por su id. Si no existe retorna [user] por defecto.
  static Role fromId(String id) {
    switch (id) {
      case 'professional':
        return professional;
      default:
        return user;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Role && other.id == id);

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Role($id)';
}