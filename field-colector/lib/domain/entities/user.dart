class User {
  final String id;
  final String userName;
  final String email;
  final String role;

  User({
    required this.id,
    required this.userName,
    this.email = '',
    required this.role,
  });
}
