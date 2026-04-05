import 'package:field_colector/domain/entities/user.dart';
import 'package:flutter/material.dart';

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
