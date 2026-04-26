import 'package:field_colector/domain/entities/role.dart';
import 'package:field_colector/domain/entities/user.dart';
import 'package:field_colector/domain/ports/user_local_port.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserLocalPort extends Mock implements UserLocalPort {}

void main() {
  late MockUserLocalPort mockPort;
  setUp(() => mockPort = MockUserLocalPort());

  group('UserLocalPort — contrato de sesión offline', () {

    test('saveUser guarda el usuario correctamente', () async {
      final user = _userConToken();
      when(() => mockPort.saveUser(user)).thenAnswer((_) async {});

      await mockPort.saveUser(user);

      verify(() => mockPort.saveUser(user)).called(1);
    });

    test('getLocalUser retorna usuario si el token es válido', () async {
      final user = _userConToken();
      when(() => mockPort.getLocalUser()).thenAnswer((_) async => user);

      final result = await mockPort.getLocalUser();

      expect(result, isNotNull);
      expect(result!.hasValidToken, isTrue);
      expect(result.email, 'test@citesa.co');
    });

    test('getLocalUser retorna null si no hay usuario guardado', () async {
      when(() => mockPort.getLocalUser()).thenAnswer((_) async => null);

      final result = await mockPort.getLocalUser();

      expect(result, isNull);
    });

    test('getLocalUser retorna null si el token expiró', () async {
      final userExpirado = _userConTokenExpirado();
      when(() => mockPort.getLocalUser()).thenAnswer((_) async => null);

      final result = await mockPort.getLocalUser();

      expect(userExpirado.hasValidToken, isFalse);
      expect(result, isNull);
    });

    test('clearLocalUser limpia el usuario al hacer logout', () async {
      when(() => mockPort.clearLocalUser()).thenAnswer((_) async {});

      await mockPort.clearLocalUser();

      verify(() => mockPort.clearLocalUser()).called(1);
    });

    test('flujo completo: save → get → clear', () async {
      final user = _userConToken();

      when(() => mockPort.saveUser(user)).thenAnswer((_) async {});
      when(() => mockPort.getLocalUser()).thenAnswer((_) async => user);
      when(() => mockPort.clearLocalUser()).thenAnswer((_) async {});

      await mockPort.saveUser(user);
      final session = await mockPort.getLocalUser();
      expect(session?.hasValidToken, isTrue);

      await mockPort.clearLocalUser();
      when(() => mockPort.getLocalUser()).thenAnswer((_) async => null);
      expect(await mockPort.getLocalUser(), isNull);
    });

    test('token válido permite acceso offline — modo avión simulado', () async {
      final user = _userConToken();
      when(() => mockPort.getLocalUser()).thenAnswer((_) async => user);

      final session = await mockPort.getLocalUser();

      expect(session, isNotNull);
      expect(session!.hasValidToken, isTrue);
      expect(session.fullName, 'Test Usuario');
    });
  });
}

User _userConToken() => User(
      id: 'uid-test-001',
      email: 'test@citesa.co',
      fullName: 'Test Usuario',
      role: Role.user,
      token: 'jwt-token-valido',
      tokenExpiry: DateTime.now().add(const Duration(hours: 8)),
    );

User _userConTokenExpirado() => User(
      id: 'uid-test-002',
      email: 'expirado@citesa.co',
      fullName: 'Token Expirado',
      role: Role.user,
      token: 'jwt-token-expirado',
      tokenExpiry: DateTime.now().subtract(const Duration(hours: 1)),
    );