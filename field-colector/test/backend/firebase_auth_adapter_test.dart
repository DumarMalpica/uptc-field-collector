import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

import 'package:field_colector/adapters/real/firebase_auth_adapter.dart';
import 'package:field_colector/domain/ports/user_local_port.dart';
import 'package:field_colector/domain/ports/auth_port.dart';
import 'package:field_colector/domain/entities/user.dart';
import 'package:field_colector/domain/entities/role.dart';

class MockFirebaseAuth extends Mock implements fb.FirebaseAuth {}
class MockUserCredential extends Mock implements fb.UserCredential {}
class MockFirebaseUser extends Mock implements fb.User {}
class MockIdTokenResult extends Mock implements fb.IdTokenResult {}
class MockUserMetadata extends Mock implements fb.UserMetadata {}
class MockUserLocalPort extends Mock implements UserLocalPort {}

class FakeUser extends Fake implements User {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeUser());
  });

  group('FirebaseAuthAdapter', () {
    late MockFirebaseAuth mockFirebaseAuth;
    late MockUserLocalPort mockUserLocalPort;
    late FirebaseAuthAdapter adapter;

    late MockFirebaseUser mockFbUser;
    late MockUserCredential mockCredential;
    late MockIdTokenResult mockTokenResult;
    late MockUserMetadata mockMetadata;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      mockUserLocalPort = MockUserLocalPort();
      mockFbUser = MockFirebaseUser();
      mockCredential = MockUserCredential();
      mockTokenResult = MockIdTokenResult();
      mockMetadata = MockUserMetadata();

      adapter = FirebaseAuthAdapter(mockFirebaseAuth, mockUserLocalPort);
    });


    test('login exitoso: Autentica en Firebase y guarda en Isar', () async {
      final expiracion = DateTime.now().add(const Duration(hours: 1));

      when(() => mockTokenResult.token).thenReturn('token_secreto_123');
      when(() => mockTokenResult.expirationTime).thenReturn(expiracion);

      when(() => mockMetadata.creationTime).thenReturn(DateTime.now());

      when(() => mockFbUser.uid).thenReturn('user_firebase_001');
      when(() => mockFbUser.email).thenReturn('nicolas@citesa.co');
      when(() => mockFbUser.displayName).thenReturn('Nicolas Tinjaca');
      when(() => mockFbUser.metadata).thenReturn(mockMetadata);
      when(() => mockFbUser.getIdTokenResult()).thenAnswer((_) async => mockTokenResult);

      when(() => mockCredential.user).thenReturn(mockFbUser);

      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
        email: 'nicolas@citesa.co',
        password: 'Password123!',
      )).thenAnswer((_) async => mockCredential);

      when(() => mockUserLocalPort.saveUser(any())).thenAnswer((_) async => {});

      final user = await adapter.login('nicolas@citesa.co', 'Password123!');

      expect(user.id, 'user_firebase_001');
      expect(user.email, 'nicolas@citesa.co');
      expect(user.token, 'token_secreto_123');

      verify(() => mockUserLocalPort.saveUser(any())).called(1);
    });

    test('login fallido: Lanza AuthException si las credenciales son incorrectas', () async {
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
        email: 'nicolas@citesa.co',
        password: 'clave_mala',
      )).thenThrow(fb.FirebaseAuthException(code: 'wrong-password'));

      expect(
            () => adapter.login('nicolas@citesa.co', 'clave_mala'),
        throwsA(isA<AuthException>().having(
              (e) => e.type,
          'tipo de error',
          AuthErrorType.invalidCredentials,
        )),
      );

      verifyNever(() => mockUserLocalPort.saveUser(any()));
    });


    test('validateOfflineSession: Retorna usuario si hay token local válido', () async {
      final localUser = User(
        id: '1',
        email: 'test@test.com',
        fullName: 'Test',
        role: Role.user,
        token: 'token_viejo',
        tokenExpiry: DateTime.now().add(const Duration(days: 1)), // Válido
      );

      when(() => mockUserLocalPort.getLocalUser()).thenAnswer((_) async => localUser);

      final session = await adapter.validateOfflineSession();

      expect(session, isNotNull);
      expect(session!.hasValidToken, isTrue);
    });

    test('validateOfflineSession: Retorna null si el token expiró o no existe', () async {
      when(() => mockUserLocalPort.getLocalUser()).thenAnswer((_) async => null);

      final session = await adapter.validateOfflineSession();

      expect(session, isNull);
    });
  });
}