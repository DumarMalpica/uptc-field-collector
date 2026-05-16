import 'package:field_colector/core/services/session_validation_service.dart';
import 'package:field_colector/domain/entities/role.dart';
import 'package:field_colector/domain/entities/session_status.dart';
import 'package:field_colector/domain/entities/user.dart';
import 'package:field_colector/domain/ports/user_local_port.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockUserLocalPort extends Mock implements UserLocalPort {}

void main() {
  late _MockUserLocalPort port;
  late SessionValidationService service;

  setUp(() {
    port = _MockUserLocalPort();
    service = SessionValidationService(port);
  });

  test('valid cuando token y expiración vigentes', () async {
    final u = User(
      id: '1',
      email: 'a@b.co',
      fullName: 'A',
      role: Role.user,
      token: 't',
      tokenExpiry: DateTime.now().add(const Duration(hours: 1)),
    );
    when(() => port.getRawLocalUser()).thenAnswer((_) async => u);

    final r = await service.validate();
    expect(r.status, SessionStatus.valid);
    expect(r.user, u);
  });

  test('expired cuando expiración pasada', () async {
    final u = User(
      id: '1',
      email: 'a@b.co',
      fullName: 'A',
      role: Role.user,
      token: 't',
      tokenExpiry: DateTime.now().subtract(const Duration(minutes: 1)),
    );
    when(() => port.getRawLocalUser()).thenAnswer((_) async => u);

    final r = await service.validate();
    expect(r.status, SessionStatus.expired);
  });

  test('corrupted cuando falta token o expiración', () async {
    final u = User(
      id: '1',
      email: 'a@b.co',
      fullName: 'A',
      role: Role.user,
      token: 't',
    );
    when(() => port.getRawLocalUser()).thenAnswer((_) async => u);

    final r = await service.validate();
    expect(r.status, SessionStatus.corrupted);
  });

  test('notFound sin fila local', () async {
    when(() => port.getRawLocalUser()).thenAnswer((_) async => null);

    final r = await service.validate();
    expect(r.status, SessionStatus.notFound);
    expect(r.user, isNull);
  });
}
