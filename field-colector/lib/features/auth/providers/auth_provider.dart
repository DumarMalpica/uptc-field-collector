import 'package:field_colector/domain/entities/user.dart';
import 'package:flutter/material.dart';

const _mockUsers = [
  {
    'id': '1',
    'userName': 'pepito',
    'password': 'pepito123',
    'email': 'pepito@citesa.com',
    'role': 'admin',
  },
  {
    'id': '2',
    'userName': 'juanito',
    'password': 'juanito123',
    'email': 'juanito@citesa.com',
    'role': 'user',
  },
];

class Authprovider extends ChangeNotifier {
  User? _user;
  bool _isLoggedIn = false;
  bool _isLoading = true;
  String? _token;
  String? _errorMessage;

  bool get isAdmin => _user?.role == 'admin';
  bool get isCollector => _user?.role == 'user';
  bool get isLoading => _isLoading;

  User? get user => _user;

  bool get isLoggedIn => _isLoggedIn;

  String? get token => _token;

  String? get errorMessage => _errorMessage;

  void _setUser(User user) {
    _user = user;
  }

  void setIsLoggedIn(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
  }

  void _setToken(String token) {
    _token = token;
  }

  void _setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  Future<void> logout() async {
    _user = null;
    _isLoggedIn = false;
    _token = null;
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> login(String token, User user) async {
    _setToken(token);
    _setUser(user);
    setIsLoggedIn(true);
    _setErrorMessage('');
    notifyListeners();
  }

  Future<bool> loginMock(String userName, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 800));

    final match = _mockUsers.where(
          (u) => u['userName'] == userName && u['password'] == password,
    );

    if (match.isEmpty) {
      _isLoading = false;
      _errorMessage = 'Usuario o contraseña incorrectos';
      notifyListeners();
      return false;
    }

    final data = match.first;
    _setToken('mock-token-${data['id']}');
    _setUser(User(
      id: data['id']!,
      userName: data['userName']!,
      email: data['email']!,
      role: data['role']!,
    ));
    setIsLoggedIn(true);
    _isLoading = false;
    notifyListeners();
    return true;
  }

  Future<bool> registerMock({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required String role,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 800));

    if (userName.isEmpty || email.isEmpty || password.isEmpty) {
      _isLoading = false;
      _errorMessage = 'Todos los campos son obligatorios';
      notifyListeners();
      return false;
    }

    if (password != confirmPassword) {
      _isLoading = false;
      _errorMessage = 'Las contraseñas no coinciden';
      notifyListeners();
      return false;
    }

    if (password.length < 6) {
      _isLoading = false;
      _errorMessage = 'La contraseña debe tener al menos 6 caracteres';
      notifyListeners();
      return false;
    }

    final newId = DateTime.now().millisecondsSinceEpoch.toString();
    _setToken('mock-token-$newId');
    _setUser(User(
      id: newId,
      userName: userName,
      email: email,
      role: role,
    ));
    setIsLoggedIn(true);
    _isLoading = false;
    notifyListeners();
    return true;
  }



  Future<void> refreshToken() async {
    // TODO: usar el repository para refrescar el token
    notifyListeners();
  }

  Future<void> restoreSession() async {
    _isLoading = true;
    notifyListeners();
    //  TODO: usar el repository para restaurar la sesión
    _isLoading = false;
    notifyListeners();
  }

  bool get isAuthenticated => _token != null && _user != null;
}
