/// perfil de acceso al sistema
class Role {
  final String id;
  final String name;
  final List<String> permissions;

  /// Cuando true, pasa a admin, tiene acceso a todo
  final bool isAdmin;

  const Role({
    required this.id,
    required this.name,
    required this.permissions,
    this.isAdmin = false,
  });

  bool hasPermission(String permission) {
    if (isAdmin) return true;
    return permissions.contains(permission);
  }

/// ROLES ADMIN / PROFESIONAL / INVESTIGADOR DE CAMPO
  static const Role admin = Role(
    id: 'admin',
    name: 'Administrador',
    permissions: [],
    isAdmin: true,
  );

  static const Role professional = Role(
    id: 'professional',
    name: 'Profesional',
    permissions: ['create_outing', 'close_outing', 'export'],
  );

  static const Role fieldResearcher = Role(
    id: 'field_researcher',
    name: 'Investigador de campo',
    permissions: ['create_record', 'view_outing'],
  );

  /// Retorna un Role predefinido por su id  -PROXIMO PARA LA DB
  static Role fromId(String id) {
    switch (id) {
      case 'admin':
        return admin;
      case 'professional':
        return professional;
      default:
        return fieldResearcher;
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