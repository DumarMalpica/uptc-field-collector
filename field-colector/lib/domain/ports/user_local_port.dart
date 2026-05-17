import '../entities/user.dart';

abstract class UserLocalPort {
  Future<void> saveUser(User user);

  Future<User?> getLocalUser();

  /// Usuario local activo sin filtrar por vigencia del token.
  Future<User?> getRawLocalUser();

  Future<void> clearLocalUser();
}