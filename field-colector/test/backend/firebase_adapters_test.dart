import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:field_colector/adapters/real/firebase_bird_record_adapter.dart';
import 'package:field_colector/adapters/real/firebase_outing_adapter.dart';
import 'package:field_colector/adapters/real/firebase_rock_record_adapter.dart';
import 'package:field_colector/adapters/real/firebase_soil_record_adapter.dart';
import 'package:field_colector/adapters/real/firebase_species_adapter.dart';
import 'package:field_colector/adapters/real/firebase_user_adapter.dart';
import 'package:field_colector/adapters/real/firebase_vegetation_record_adapter.dart';
import 'package:field_colector/adapters/real/firebase_water_record_adapter.dart';
import 'package:field_colector/domain/ports/bird_record_remote_port.dart';
import 'package:field_colector/domain/ports/outing_remote_port.dart';
import 'package:field_colector/domain/ports/rock_record_remote_port.dart';
import 'package:field_colector/domain/ports/soil_record_remote_port.dart';
import 'package:field_colector/domain/ports/species_remote_port.dart';
import 'package:field_colector/domain/ports/user_remote_port.dart';
import 'package:field_colector/domain/ports/vegetation_record_remote_port.dart';
import 'package:field_colector/domain/ports/water_record_remote_port.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

void main() {
  group('Firebase adapters — port compliance', () {
    late MockFirebaseFirestore mockFirestore;

    setUp(() {
      mockFirestore = MockFirebaseFirestore();
    });

    test('FirebaseBirdRecordAdapter implements BirdRecordRemotePort', () {
      final adapter = FirebaseBirdRecordAdapter(mockFirestore);
      expect(adapter, isA<BirdRecordRemotePort>());
    });

    test('FirebaseOutingAdapter implements OutingRemotePort', () {
      final adapter = FirebaseOutingAdapter(mockFirestore);
      expect(adapter, isA<OutingRemotePort>());
    });

    test('FirebaseRockRecordAdapter implements RockRecordRemotePort', () {
      final adapter = FirebaseRockRecordAdapter(mockFirestore);
      expect(adapter, isA<RockRecordRemotePort>());
    });

    test('FirebaseSoilRecordAdapter implements SoilRecordRemotePort', () {
      final adapter = FirebaseSoilRecordAdapter(mockFirestore);
      expect(adapter, isA<SoilRecordRemotePort>());
    });

    test('FirebaseSpeciesAdapter implements SpeciesRemotePort', () {
      final adapter = FirebaseSpeciesAdapter(mockFirestore);
      expect(adapter, isA<SpeciesRemotePort>());
    });

    test('FirebaseUserAdapter implements UserRemotePort', () {
      final adapter = FirebaseUserAdapter(mockFirestore);
      expect(adapter, isA<UserRemotePort>());
    });

    test(
      'FirebaseVegetationRecordAdapter implements VegetationRecordRemotePort',
      () {
        final adapter = FirebaseVegetationRecordAdapter(mockFirestore);
        expect(adapter, isA<VegetationRecordRemotePort>());
      },
    );

    test('FirebaseWaterRecordAdapter implements WaterRecordRemotePort', () {
      final adapter = FirebaseWaterRecordAdapter(mockFirestore);
      expect(adapter, isA<WaterRecordRemotePort>());
    });
  });
}
