import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/role.dart';
import '../../domain/ports/user_remote_port.dart';

class FirebaseUserAdapter implements UserRemotePort {
  final FirebaseFirestore _firestore;
  final String _collection = 'users';

  FirebaseUserAdapter(this._firestore);

  @override
  Future<void> saveUser(User user) async {
    await _firestore.collection(_collection).doc(user.id).set({
      'email': user.email,
      'fullName': user.fullName,
      'fieldStudy': user.fieldStudy,
      'role': user.role.id,
      'createdAt': user.createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
    });
  }

  @override
  Future<void> updateUser(String id, Map<String, dynamic> data) async {
    await _firestore.collection(_collection).doc(id).update(data);
  }

  @override
  Future<void> deleteUser(String id) async {
    await _firestore.collection(_collection).doc(id).delete();
  }

  @override
  Future<User?> getUserById(String id) async {
    final doc = await _firestore.collection(_collection).doc(id).get();
    if (!doc.exists) return null;
    return _mapSnapshotToUser(doc);
  }

  @override
  Future<User?> getUserByEmail(String email) async {
    final snapshot = await _firestore.collection(_collection)
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) return null;
    return _mapSnapshotToUser(snapshot.docs.first);
  }

  @override
  Future<UserSearchResult> searchUsersByName(
      String name, {
        int limit = 10,
        DocumentSnapshot? lastDocument,
      }) async {
    Query query = _firestore.collection(_collection)
        .where('fullName', isGreaterThanOrEqualTo: name)
        .where('fullName', isLessThanOrEqualTo: '$name\uf8ff')
        .orderBy('fullName')
        .limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    final snapshot = await query.get();

    return UserSearchResult(
      users: snapshot.docs.map((doc) => _mapSnapshotToUser(doc)).toList(),
      lastDocument: snapshot.docs.isNotEmpty ? snapshot.docs.last : null,
    );
  }

  @override
  Future<UserSearchResult> getUsersByRole(
      String roleString, {
        int limit = 10,
        DocumentSnapshot? lastDocument,
      }) async {
    Query query = _firestore.collection(_collection)
        .where('role', isEqualTo: roleString)
        .orderBy('createdAt', descending: true)
        .limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    final snapshot = await query.get();

    return UserSearchResult(
      users: snapshot.docs.map((doc) => _mapSnapshotToUser(doc)).toList(),
      lastDocument: snapshot.docs.isNotEmpty ? snapshot.docs.last : null,
    );
  }

  @override
  Future<UserSearchResult> getAllUsers({
    int limit = 20,
    DocumentSnapshot? lastDocument,
  }) async {
    Query query = _firestore.collection(_collection)
        .orderBy('createdAt', descending: true)
        .limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    final snapshot = await query.get();

    return UserSearchResult(
      users: snapshot.docs.map((doc) => _mapSnapshotToUser(doc)).toList(),
      lastDocument: snapshot.docs.isNotEmpty ? snapshot.docs.last : null,
    );
  }


  User _mapSnapshotToUser(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return User(
      id: doc.id,
      email: data['email'] ?? '',
      fullName: data['fullName'] ?? '',
      fieldStudy: data['fieldStudy'],
      role: Role.fromId(data['role'] ?? 'user'),
      createdAt: data['createdAt'] != null ? DateTime.parse(data['createdAt']) : null,
    );
  }
}