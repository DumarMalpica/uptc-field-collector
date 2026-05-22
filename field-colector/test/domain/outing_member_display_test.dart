import 'package:field_colector/domain/entities/outing.dart';
import 'package:field_colector/domain/entities/role.dart';
import 'package:field_colector/domain/entities/user.dart';
import 'package:field_colector/domain/outing_member_display.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('memberDisplayLabel', () {
    test('prefers embedded name', () {
      expect(
        memberDisplayLabel(
          id: 'u1',
          member: const OutingMember(
            id: 'u1',
            name: 'Ana García',
            email: 'ana@test.com',
          ),
        ),
        'Ana García',
      );
    });

    test('falls back to resolved fullName', () {
      expect(
        memberDisplayLabel(
          id: 'u1',
          resolved: const User(
            id: 'u1',
            email: 'ana@test.com',
            fullName: 'Ana Remota',
            role: Role.user,
          ),
        ),
        'Ana Remota',
      );
    });

    test('falls back to embedded email when name empty', () {
      expect(
        memberDisplayLabel(
          id: 'u1',
          member: const OutingMember(id: 'u1', name: '', email: 'ana@test.com'),
        ),
        'ana@test.com',
      );
    });

    test('returns unknown when nothing resolvable', () {
      expect(
        memberDisplayLabel(id: 'firebase-uid-xyz'),
        kUnknownMemberLabel,
      );
    });
  });

  group('memberDisplaySubtitle', () {
    test('returns email when label is name', () {
      expect(
        memberDisplaySubtitle(
          id: 'u1',
          member: const OutingMember(
            id: 'u1',
            name: 'Ana',
            email: 'ana@test.com',
          ),
          label: 'Ana',
        ),
        'ana@test.com',
      );
    });

    test('returns null when label is already email', () {
      expect(
        memberDisplaySubtitle(
          id: 'u1',
          member: const OutingMember(
            id: 'u1',
            name: '',
            email: 'ana@test.com',
          ),
          label: 'ana@test.com',
        ),
        isNull,
      );
    });
  });
}
