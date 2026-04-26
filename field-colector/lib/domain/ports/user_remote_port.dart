import '../entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserRemotePort {

  Future<void> saveUser(User user);

  Future<void> updateUser(String id, Map<String, dynamic> data);

  Future<void> deleteUser(String id);

  Future<User?> getUserById(String id);

  Future<User?> getUserByEmail(String email);

  Future<UserSearchResult> searchUsersByName(
      String name, {
        int limit = 10,
        DocumentSnapshot? lastDocument,
      });

  Future<UserSearchResult> getUsersByRole(
      String roleString, {
        int limit = 10,
        DocumentSnapshot? lastDocument,
      });

  Future<UserSearchResult> getAllUsers({
    int limit = 20,
    DocumentSnapshot? lastDocument,
  });
}

class UserSearchResult {
  final List<User> users;
  final DocumentSnapshot? lastDocument;

  UserSearchResult({required this.users, this.lastDocument});
}