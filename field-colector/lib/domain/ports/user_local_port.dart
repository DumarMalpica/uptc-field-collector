import '../entities/user.dart';

abstract class UserLocalPort {
  Future<void> saveUser(User user);

  Future<User?> getLocalUser();

  Future<void> clearLocalUser();
}