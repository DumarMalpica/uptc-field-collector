import 'package:field_colector/adapters/fake/fake_auth_adapter.dart';
import 'package:field_colector/domain/ports/auth_port.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FakeAuthAdapter', () {
    late FakeAuthAdapter adapter;
    setUp(() => adapter = FakeAuthAdapter());

    // ── Login ──────────────────────────────────────────────────────────────

    test('login exitoso — admin', () async {
      final user = await adapter.login('admin@citesa.co', 'Admin2024!');
      expect(user.email, 'admin@citesa.co');
      expect(user.role.id, 'admin');
      expect(user.role.isAdmin, isTrue);
      expect(user.hasValidToken, isTrue);
    });

    test('login exitoso — usuario base', () async {
      final user = await adapter.login('usuario@citesa.co', 'Field2024!');
      expect(user.email, 'usuario@citesa.co');
      expect(user.role.id, 'user');
      expect(user.role.isAdmin, isFalse);
      expect(user.hasValidToken, isTrue);
    });

    test('admin bypasea cualquier permiso por isAdmin = true', () async {
      final user = await adapter.login('admin@citesa.co', 'Admin2024!');
      expect(user.hasPermission('create_outing'), isTrue);
      expect(user.hasPermission('export'), isTrue);
      expect(user.hasPermission('permiso_inventado'), isTrue);
    });

    test('usuario base no tiene permisos por rol', () async {
      final user = await adapter.login('usuario@citesa.co', 'Field2024!');
      expect(user.hasPermission('create_outing'), isFalse);
      expect(user.hasPermission('export'), isFalse);
    });

    test('login normaliza email a minúsculas', () async {
      final user = await adapter.login('ADMIN@CITESA.CO', 'Admin2024!');
      expect(user.email, 'admin@citesa.co');
    });

    test('contraseña incorrecta lanza AuthException.invalidCredentials', () {
      expect(
            () => adapter.login('admin@citesa.co', 'mala'),
        throwsA(isA<AuthException>().having(
              (e) => e.type, 'type', AuthErrorType.invalidCredentials,
        )),
      );
    });

    test('email inexistente lanza AuthException', () {
      expect(
            () => adapter.login('noexiste@citesa.co', 'Field2024!'),
        throwsA(isA<AuthException>()),
      );
    });

    // ── Register ───────────────────────────────────────────────────────────

    test('registro exitoso asigna rol user por defecto', () async {
      final user = await adapter.register(
        email: 'nuevo@citesa.co',
        password: 'Nuevo2024!',
        fullName: 'Nuevo Usuario',
        fieldStudy: 'Geología',
      );
      expect(user.role.id, 'user');
      expect(user.fieldStudy, 'Geología');
      expect(user.graduated, isFalse);
      expect(user.hasValidToken, isTrue);
    });

    test('email duplicado lanza AuthException.emailAlreadyInUse', () {
      expect(
            () => adapter.register(
          email: 'admin@citesa.co',
          password: 'Otro2024!',
          fullName: 'Duplicado',
        ),
        throwsA(isA<AuthException>().having(
              (e) => e.type, 'type', AuthErrorType.emailAlreadyInUse,
        )),
      );
    });

    test('contraseña débil lanza AuthException.weakPassword', () {
      expect(
            () => adapter.register(
          email: 'debil@citesa.co',
          password: '123',
          fullName: 'Débil',
        ),
        throwsA(isA<AuthException>().having(
              (e) => e.type, 'type', AuthErrorType.weakPassword,
        )),
      );
    });

    test('usuario registrado en runtime puede hacer login', () async {
      await adapter.register(
        email: 'runtime@citesa.co',
        password: 'Runtime2024!',
        fullName: 'Runtime User',
      );
      final user = await adapter.login('runtime@citesa.co', 'Runtime2024!');
      expect(user.fullName, 'Runtime User');
    });

    // ── Sesión ─────────────────────────────────────────────────────────────

    test('getCurrentUser retorna usuario activo tras login', () async {
      await adapter.login('usuario@citesa.co', 'Field2024!');
      final current = await adapter.getCurrentUser();
      expect(current?.email, 'usuario@citesa.co');
    });

    test('logout limpia usuario activo', () async {
      await adapter.login('admin@citesa.co', 'Admin2024!');
      await adapter.logout();
      expect(await adapter.getCurrentUser(), isNull);
    });

    test('validateOfflineSession retorna usuario con token válido', () async {
      await adapter.login('admin@citesa.co', 'Admin2024!');
      final session = await adapter.validateOfflineSession();
      expect(session?.email, 'admin@citesa.co');
    });

    test('validateOfflineSession retorna null sin sesión', () async {
      expect(await adapter.validateOfflineSession(), isNull);
    });

    // ── Campos de User ─────────────────────────────────────────────────────

    test('admin tiene graduated = true', () async {
      final user = await adapter.login('admin@citesa.co', 'Admin2024!');
      expect(user.graduated, isTrue);
    });

    test('usuario base tiene graduated = false por defecto', () async {
      final user = await adapter.login('usuario@citesa.co', 'Field2024!');
      expect(user.graduated, isFalse);
    });
  });
}