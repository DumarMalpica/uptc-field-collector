import 'package:field_colector/domain/entities/user.dart';
import 'package:field_colector/domain/ports/auth_port.dart';
import 'package:flutter/material.dart';

class AuthProviderLocal extends ChangeNotifier {
  final AuthPort _authPort;

  AuthProviderLocal(this._authPort);

  User? _user;
  bool _isLoading = true;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null && _user!.token != null;
  String? get errorMessage => _errorMessage;
  String get observerName => _user?.fullName ?? '';
  bool get isAdmin => _user?.role.isAdmin ?? false;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      _user = await _authPort.login(email, password);
    } on AuthException catch (e) {
      _user = null;
      _errorMessage = e.message;
    } catch (_) {
      _errorMessage = 'Error inesperado. Intenta de nuevo.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String fullName,
    String? fieldStudy,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      _user = await _authPort.register(
        email: email,
        password: password,
        fullName: fullName,
        fieldStudy: fieldStudy,
      );
    } on AuthException catch (e) {
      _user = null;
      _errorMessage = e.message;
    } catch (_) {
      _errorMessage = 'No se pudo crear la cuenta.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _authPort.logout();
    _user = null;
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> restoreSession() async {
    _isLoading = true;
    notifyListeners();
    try {
      _user = await _authPort.validateOfflineSession();
      if (_user != null) {
        print('✅ Sesión restaurada: ${_user!.email}'); // ← agrega esto
      } else {
        print('❌ No hay sesión válida — redirigir a login'); // ← y esto
      }
    } catch (_) {
      _user = null;
      print('❌ Error al restaurar sesión'); // ← y esto
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}