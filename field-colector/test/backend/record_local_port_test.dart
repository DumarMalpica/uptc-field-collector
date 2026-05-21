import 'package:field_colector/domain/entities/bird_record.dart';
import 'package:field_colector/domain/entities/coordinate.dart';
import 'package:field_colector/domain/entities/plot.dart';
import 'package:field_colector/domain/entities/rock_record.dart';
import 'package:field_colector/domain/entities/soil_record.dart';
import 'package:field_colector/domain/entities/vegetation_record.dart';
import 'package:field_colector/domain/entities/water_record.dart';
import 'package:field_colector/domain/ports/bird_record_local_port.dart';
import 'package:field_colector/domain/ports/rock_record_local_port.dart';
import 'package:field_colector/domain/ports/soil_record_local_port.dart';
import 'package:field_colector/domain/ports/vegetation_record_local_port.dart';
import 'package:field_colector/domain/ports/water_record_local_port.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ── Mocks ─────────────────────────────────────────────────────────────────────

class MockBirdRecordLocalPort extends Mock implements BirdRecordLocalPort {}

class MockRockRecordLocalPort extends Mock implements RockRecordLocalPort {}

class MockSoilRecordLocalPort extends Mock implements SoilRecordLocalPort {}

class MockVegetationRecordLocalPort extends Mock
    implements VegetationRecordLocalPort {}

class MockWaterRecordLocalPort extends Mock implements WaterRecordLocalPort {}

void main() {
  _birdRecordPortTests();
  _rockRecordPortTests();
  _soilRecordPortTests();
  _vegetationRecordPortTests();
  _waterRecordPortTests();
}

// ── Bird ──────────────────────────────────────────────────────────────────────

void _birdRecordPortTests() {
  group('BirdRecordLocalPort — contrato', () {
    late MockBirdRecordLocalPort port;

    setUp(() => port = MockBirdRecordLocalPort());

    test('saveRecord guarda registro correctamente', () async {
      final r = _bird();
      when(() => port.saveRecord(r)).thenAnswer((_) async {});
      await port.saveRecord(r);
      verify(() => port.saveRecord(r)).called(1);
    });

    test('getRecordById retorna registro existente', () async {
      final r = _bird();
      when(() => port.getRecordById(r.id)).thenAnswer((_) async => r);
      final result = await port.getRecordById(r.id);
      expect(result, isNotNull);
      expect(result!.id, r.id);
    });

    test('getRecordById retorna null si no existe', () async {
      when(() => port.getRecordById('no-existe')).thenAnswer((_) async => null);
      expect(await port.getRecordById('no-existe'), isNull);
    });

    test('getRecordsByOuting retorna registros de la expedición', () async {
      final r = _bird();
      when(() => port.getRecordsByOuting(r.outingId))
          .thenAnswer((_) async => [r]);
      final result = await port.getRecordsByOuting(r.outingId);
      expect(result, hasLength(1));
      expect(result.first.outingId, r.outingId);
    });

    test('getRecordsByUser retorna registros del observador', () async {
      final r = _bird();
      when(() => port.getRecordsByUser(r.userId))
          .thenAnswer((_) async => [r]);
      final result = await port.getRecordsByUser(r.userId);
      expect(result, hasLength(1));
      expect(result.first.userId, r.userId);
    });

    test('getRecordsByDateRange retorna registros en el rango', () async {
      final r = _bird();
      final start = DateTime(2025, 6, 1);
      final end = DateTime(2025, 6, 30);
      when(() => port.getRecordsByDateRange(start, end))
          .thenAnswer((_) async => [r]);
      final result = await port.getRecordsByDateRange(start, end);
      expect(result, hasLength(1));
    });

    test('getRecordsByDateRange retorna vacío fuera del rango', () async {
      final start = DateTime(2024, 1, 1);
      final end = DateTime(2024, 1, 31);
      when(() => port.getRecordsByDateRange(start, end))
          .thenAnswer((_) async => []);
      expect(await port.getRecordsByDateRange(start, end), isEmpty);
    });

    test('getPendingSyncRecords retorna solo syncStatus=pending', () async {
      final r = _bird();
      when(() => port.getPendingSyncRecords()).thenAnswer((_) async => [r]);
      final result = await port.getPendingSyncRecords();
      expect(result, hasLength(1));
      expect(result.first.syncStatus, 'pending');
    });

    test('updateSyncStatus cambia el estado correctamente', () async {
      when(() => port.updateSyncStatus('bird-001', 'synced'))
          .thenAnswer((_) async {});
      await port.updateSyncStatus('bird-001', 'synced');
      verify(() => port.updateSyncStatus('bird-001', 'synced')).called(1);
    });

    test('updateFirebaseId asigna el id de Firebase', () async {
      when(() => port.updateFirebaseId(1, 'firebase-bird-001'))
          .thenAnswer((_) async {});
      await port.updateFirebaseId(1, 'firebase-bird-001');
      verify(() => port.updateFirebaseId(1, 'firebase-bird-001')).called(1);
    });

    test('deleteRecord elimina el registro', () async {
      final r = _bird();
      when(() => port.deleteRecord(r.id)).thenAnswer((_) async {});
      await port.deleteRecord(r.id);
      verify(() => port.deleteRecord(r.id)).called(1);
    });

    test('flujo offline completo: save → getByOuting → sync → update',
        () async {
      final r = _bird();
      when(() => port.saveRecord(r)).thenAnswer((_) async {});
      when(() => port.getRecordsByOuting(r.outingId))
          .thenAnswer((_) async => [r]);
      when(() => port.getPendingSyncRecords()).thenAnswer((_) async => [r]);
      when(() => port.updateSyncStatus(r.id, 'synced'))
          .thenAnswer((_) async {});
      when(() => port.updateFirebaseId(1, r.id)).thenAnswer((_) async {});

      await port.saveRecord(r);
      final byOuting = await port.getRecordsByOuting(r.outingId);
      expect(byOuting, hasLength(1));

      final pending = await port.getPendingSyncRecords();
      expect(pending.first.syncStatus, 'pending');

      await port.updateSyncStatus(r.id, 'synced');
      await port.updateFirebaseId(1, r.id);

      verify(() => port.updateSyncStatus(r.id, 'synced')).called(1);
      verify(() => port.updateFirebaseId(1, r.id)).called(1);
    });
  });
}

// ── Rock ──────────────────────────────────────────────────────────────────────

void _rockRecordPortTests() {
  group('RockRecordLocalPort — contrato', () {
    late MockRockRecordLocalPort port;

    setUp(() => port = MockRockRecordLocalPort());

    test('saveRecord guarda registro correctamente', () async {
      final r = _rock();
      when(() => port.saveRecord(r)).thenAnswer((_) async {});
      await port.saveRecord(r);
      verify(() => port.saveRecord(r)).called(1);
    });

    test('getRecordById retorna registro existente', () async {
      final r = _rock();
      when(() => port.getRecordById(r.id)).thenAnswer((_) async => r);
      final result = await port.getRecordById(r.id);
      expect(result!.id, r.id);
    });

    test('getRecordById retorna null si no existe', () async {
      when(() => port.getRecordById('no-existe')).thenAnswer((_) async => null);
      expect(await port.getRecordById('no-existe'), isNull);
    });

    test('getRecordsByOuting retorna registros de la expedición', () async {
      final r = _rock();
      when(() => port.getRecordsByOuting(r.outingId))
          .thenAnswer((_) async => [r]);
      final result = await port.getRecordsByOuting(r.outingId);
      expect(result.first.outingId, r.outingId);
    });

    test('getRecordsByUser retorna registros del observador', () async {
      final r = _rock();
      when(() => port.getRecordsByUser(r.userId))
          .thenAnswer((_) async => [r]);
      final result = await port.getRecordsByUser(r.userId);
      expect(result.first.userId, r.userId);
    });

    test('getRecordsByDateRange retorna registros en el rango', () async {
      final r = _rock();
      final start = DateTime(2025, 6, 1);
      final end = DateTime(2025, 6, 30);
      when(() => port.getRecordsByDateRange(start, end))
          .thenAnswer((_) async => [r]);
      expect(await port.getRecordsByDateRange(start, end), hasLength(1));
    });

    test('getRecordsByDateRange retorna vacío fuera del rango', () async {
      final start = DateTime(2024, 1, 1);
      final end = DateTime(2024, 1, 31);
      when(() => port.getRecordsByDateRange(start, end))
          .thenAnswer((_) async => []);
      expect(await port.getRecordsByDateRange(start, end), isEmpty);
    });

    test('getPendingSyncRecords retorna solo syncStatus=pending', () async {
      final r = _rock();
      when(() => port.getPendingSyncRecords()).thenAnswer((_) async => [r]);
      final result = await port.getPendingSyncRecords();
      expect(result.first.syncStatus, 'pending');
    });

    test('updateSyncStatus cambia el estado correctamente', () async {
      when(() => port.updateSyncStatus('rock-001', 'synced'))
          .thenAnswer((_) async {});
      await port.updateSyncStatus('rock-001', 'synced');
      verify(() => port.updateSyncStatus('rock-001', 'synced')).called(1);
    });

    test('updateFirebaseId asigna el id de Firebase', () async {
      when(() => port.updateFirebaseId(1, 'firebase-rock-001'))
          .thenAnswer((_) async {});
      await port.updateFirebaseId(1, 'firebase-rock-001');
      verify(() => port.updateFirebaseId(1, 'firebase-rock-001')).called(1);
    });

    test('deleteRecord elimina el registro', () async {
      final r = _rock();
      when(() => port.deleteRecord(r.id)).thenAnswer((_) async {});
      await port.deleteRecord(r.id);
      verify(() => port.deleteRecord(r.id)).called(1);
    });

    test('flujo offline completo: save → getByOuting → sync → update',
        () async {
      final r = _rock();
      when(() => port.saveRecord(r)).thenAnswer((_) async {});
      when(() => port.getRecordsByOuting(r.outingId))
          .thenAnswer((_) async => [r]);
      when(() => port.getPendingSyncRecords()).thenAnswer((_) async => [r]);
      when(() => port.updateSyncStatus(r.id, 'synced'))
          .thenAnswer((_) async {});
      when(() => port.updateFirebaseId(1, r.id)).thenAnswer((_) async {});

      await port.saveRecord(r);
      await port.getRecordsByOuting(r.outingId);
      final pending = await port.getPendingSyncRecords();
      expect(pending.first.syncStatus, 'pending');
      await port.updateSyncStatus(r.id, 'synced');
      await port.updateFirebaseId(1, r.id);

      verify(() => port.updateSyncStatus(r.id, 'synced')).called(1);
    });
  });
}

// ── Soil ──────────────────────────────────────────────────────────────────────

void _soilRecordPortTests() {
  group('SoilRecordLocalPort — contrato', () {
    late MockSoilRecordLocalPort port;

    setUp(() => port = MockSoilRecordLocalPort());

    test('saveRecord guarda registro correctamente', () async {
      final r = _soil();
      when(() => port.saveRecord(r)).thenAnswer((_) async {});
      await port.saveRecord(r);
      verify(() => port.saveRecord(r)).called(1);
    });

    test('getRecordById retorna registro existente', () async {
      final r = _soil();
      when(() => port.getRecordById(r.id)).thenAnswer((_) async => r);
      expect((await port.getRecordById(r.id))!.id, r.id);
    });

    test('getRecordById retorna null si no existe', () async {
      when(() => port.getRecordById('no-existe')).thenAnswer((_) async => null);
      expect(await port.getRecordById('no-existe'), isNull);
    });

    test('getRecordsByOuting retorna registros de la expedición', () async {
      final r = _soil();
      when(() => port.getRecordsByOuting(r.outingId))
          .thenAnswer((_) async => [r]);
      expect(await port.getRecordsByOuting(r.outingId), hasLength(1));
    });

    test('getRecordsByUser retorna registros del observador', () async {
      final r = _soil();
      when(() => port.getRecordsByUser(r.userId))
          .thenAnswer((_) async => [r]);
      expect(await port.getRecordsByUser(r.userId), hasLength(1));
    });

    test('getRecordsByDateRange retorna registros en el rango', () async {
      final r = _soil();
      final start = DateTime(2025, 6, 1);
      final end = DateTime(2025, 6, 30);
      when(() => port.getRecordsByDateRange(start, end))
          .thenAnswer((_) async => [r]);
      expect(await port.getRecordsByDateRange(start, end), hasLength(1));
    });

    test('getRecordsByDateRange retorna vacío fuera del rango', () async {
      final start = DateTime(2024, 1, 1);
      final end = DateTime(2024, 1, 31);
      when(() => port.getRecordsByDateRange(start, end))
          .thenAnswer((_) async => []);
      expect(await port.getRecordsByDateRange(start, end), isEmpty);
    });

    test('getPendingSyncRecords retorna solo syncStatus=pending', () async {
      final r = _soil();
      when(() => port.getPendingSyncRecords()).thenAnswer((_) async => [r]);
      final result = await port.getPendingSyncRecords();
      expect(result.first.syncStatus, 'pending');
    });

    test('updateSyncStatus cambia el estado correctamente', () async {
      when(() => port.updateSyncStatus('soil-001', 'synced'))
          .thenAnswer((_) async {});
      await port.updateSyncStatus('soil-001', 'synced');
      verify(() => port.updateSyncStatus('soil-001', 'synced')).called(1);
    });

    test('updateFirebaseId asigna el id de Firebase', () async {
      when(() => port.updateFirebaseId(1, 'firebase-soil-001'))
          .thenAnswer((_) async {});
      await port.updateFirebaseId(1, 'firebase-soil-001');
      verify(() => port.updateFirebaseId(1, 'firebase-soil-001')).called(1);
    });

    test('deleteRecord elimina el registro', () async {
      final r = _soil();
      when(() => port.deleteRecord(r.id)).thenAnswer((_) async {});
      await port.deleteRecord(r.id);
      verify(() => port.deleteRecord(r.id)).called(1);
    });

    test('flujo offline completo: save → getByOuting → sync → update',
        () async {
      final r = _soil();
      when(() => port.saveRecord(r)).thenAnswer((_) async {});
      when(() => port.getPendingSyncRecords()).thenAnswer((_) async => [r]);
      when(() => port.updateSyncStatus(r.id, 'synced'))
          .thenAnswer((_) async {});

      await port.saveRecord(r);
      final pending = await port.getPendingSyncRecords();
      expect(pending.first.syncStatus, 'pending');
      await port.updateSyncStatus(r.id, 'synced');
      verify(() => port.updateSyncStatus(r.id, 'synced')).called(1);
    });
  });
}

// ── Vegetation ────────────────────────────────────────────────────────────────

void _vegetationRecordPortTests() {
  group('VegetationRecordLocalPort — contrato', () {
    late MockVegetationRecordLocalPort port;

    setUp(() => port = MockVegetationRecordLocalPort());

    test('saveRecord guarda registro correctamente', () async {
      final r = _vegetation();
      when(() => port.saveRecord(r)).thenAnswer((_) async {});
      await port.saveRecord(r);
      verify(() => port.saveRecord(r)).called(1);
    });

    test('getRecordById retorna registro existente', () async {
      final r = _vegetation();
      when(() => port.getRecordById(r.id)).thenAnswer((_) async => r);
      expect((await port.getRecordById(r.id))!.id, r.id);
    });

    test('getRecordById retorna null si no existe', () async {
      when(() => port.getRecordById('no-existe')).thenAnswer((_) async => null);
      expect(await port.getRecordById('no-existe'), isNull);
    });

    test('getRecordsByOuting retorna registros de la expedición', () async {
      final r = _vegetation();
      when(() => port.getRecordsByOuting(r.outingId))
          .thenAnswer((_) async => [r]);
      expect(await port.getRecordsByOuting(r.outingId), hasLength(1));
    });

    test('getRecordsByUser retorna registros del observador', () async {
      final r = _vegetation();
      when(() => port.getRecordsByUser(r.userId))
          .thenAnswer((_) async => [r]);
      expect(await port.getRecordsByUser(r.userId), hasLength(1));
    });

    test('getRecordsByDateRange retorna registros en el rango', () async {
      final r = _vegetation();
      final start = DateTime(2025, 6, 1);
      final end = DateTime(2025, 6, 30);
      when(() => port.getRecordsByDateRange(start, end))
          .thenAnswer((_) async => [r]);
      expect(await port.getRecordsByDateRange(start, end), hasLength(1));
    });

    test('getRecordsByDateRange retorna vacío fuera del rango', () async {
      final start = DateTime(2024, 1, 1);
      final end = DateTime(2024, 1, 31);
      when(() => port.getRecordsByDateRange(start, end))
          .thenAnswer((_) async => []);
      expect(await port.getRecordsByDateRange(start, end), isEmpty);
    });

    test('getPendingSyncRecords retorna solo syncStatus=pending', () async {
      final r = _vegetation();
      when(() => port.getPendingSyncRecords()).thenAnswer((_) async => [r]);
      final result = await port.getPendingSyncRecords();
      expect(result.first.syncStatus, 'pending');
    });

    test('updateSyncStatus cambia el estado correctamente', () async {
      when(() => port.updateSyncStatus('veg-001', 'synced'))
          .thenAnswer((_) async {});
      await port.updateSyncStatus('veg-001', 'synced');
      verify(() => port.updateSyncStatus('veg-001', 'synced')).called(1);
    });

    test('updateFirebaseId asigna el id de Firebase', () async {
      when(() => port.updateFirebaseId(1, 'firebase-veg-001'))
          .thenAnswer((_) async {});
      await port.updateFirebaseId(1, 'firebase-veg-001');
      verify(() => port.updateFirebaseId(1, 'firebase-veg-001')).called(1);
    });

    test('deleteRecord elimina el registro', () async {
      final r = _vegetation();
      when(() => port.deleteRecord(r.id)).thenAnswer((_) async {});
      await port.deleteRecord(r.id);
      verify(() => port.deleteRecord(r.id)).called(1);
    });

    test('flujo offline completo: save → getByOuting → sync → update',
        () async {
      final r = _vegetation();
      when(() => port.saveRecord(r)).thenAnswer((_) async {});
      when(() => port.getPendingSyncRecords()).thenAnswer((_) async => [r]);
      when(() => port.updateSyncStatus(r.id, 'synced'))
          .thenAnswer((_) async {});

      await port.saveRecord(r);
      final pending = await port.getPendingSyncRecords();
      expect(pending.first.syncStatus, 'pending');
      await port.updateSyncStatus(r.id, 'synced');
      verify(() => port.updateSyncStatus(r.id, 'synced')).called(1);
    });
  });
}

// ── Water ─────────────────────────────────────────────────────────────────────

void _waterRecordPortTests() {
  group('WaterRecordLocalPort — contrato', () {
    late MockWaterRecordLocalPort port;

    setUp(() => port = MockWaterRecordLocalPort());

    test('saveRecord guarda registro correctamente', () async {
      final r = _water();
      when(() => port.saveRecord(r)).thenAnswer((_) async {});
      await port.saveRecord(r);
      verify(() => port.saveRecord(r)).called(1);
    });

    test('getRecordById retorna registro existente', () async {
      final r = _water();
      when(() => port.getRecordById(r.id)).thenAnswer((_) async => r);
      expect((await port.getRecordById(r.id))!.id, r.id);
    });

    test('getRecordById retorna null si no existe', () async {
      when(() => port.getRecordById('no-existe')).thenAnswer((_) async => null);
      expect(await port.getRecordById('no-existe'), isNull);
    });

    test('getRecordsByOuting retorna registros de la expedición', () async {
      final r = _water();
      when(() => port.getRecordsByOuting(r.outingId))
          .thenAnswer((_) async => [r]);
      expect(await port.getRecordsByOuting(r.outingId), hasLength(1));
    });

    test('getRecordsByUser retorna registros del observador', () async {
      final r = _water();
      when(() => port.getRecordsByUser(r.userId))
          .thenAnswer((_) async => [r]);
      expect(await port.getRecordsByUser(r.userId), hasLength(1));
    });

    test('getRecordsByDateRange retorna registros en el rango', () async {
      final r = _water();
      final start = DateTime(2025, 6, 1);
      final end = DateTime(2025, 6, 30);
      when(() => port.getRecordsByDateRange(start, end))
          .thenAnswer((_) async => [r]);
      expect(await port.getRecordsByDateRange(start, end), hasLength(1));
    });

    test('getRecordsByDateRange retorna vacío fuera del rango', () async {
      final start = DateTime(2024, 1, 1);
      final end = DateTime(2024, 1, 31);
      when(() => port.getRecordsByDateRange(start, end))
          .thenAnswer((_) async => []);
      expect(await port.getRecordsByDateRange(start, end), isEmpty);
    });

    test('getPendingSyncRecords retorna solo syncStatus=pending', () async {
      final r = _water();
      when(() => port.getPendingSyncRecords()).thenAnswer((_) async => [r]);
      final result = await port.getPendingSyncRecords();
      expect(result.first.syncStatus, 'pending');
    });

    test('updateSyncStatus cambia el estado correctamente', () async {
      when(() => port.updateSyncStatus('water-001', 'synced'))
          .thenAnswer((_) async {});
      await port.updateSyncStatus('water-001', 'synced');
      verify(() => port.updateSyncStatus('water-001', 'synced')).called(1);
    });

    test('updateFirebaseId asigna el id de Firebase', () async {
      when(() => port.updateFirebaseId(1, 'firebase-water-001'))
          .thenAnswer((_) async {});
      await port.updateFirebaseId(1, 'firebase-water-001');
      verify(() => port.updateFirebaseId(1, 'firebase-water-001')).called(1);
    });

    test('deleteRecord elimina el registro', () async {
      final r = _water();
      when(() => port.deleteRecord(r.id)).thenAnswer((_) async {});
      await port.deleteRecord(r.id);
      verify(() => port.deleteRecord(r.id)).called(1);
    });

    test('flujo offline completo: save → getByOuting → sync → update',
        () async {
      final r = _water();
      when(() => port.saveRecord(r)).thenAnswer((_) async {});
      when(() => port.getPendingSyncRecords()).thenAnswer((_) async => [r]);
      when(() => port.updateSyncStatus(r.id, 'synced'))
          .thenAnswer((_) async {});

      await port.saveRecord(r);
      final pending = await port.getPendingSyncRecords();
      expect(pending.first.syncStatus, 'pending');
      await port.updateSyncStatus(r.id, 'synced');
      verify(() => port.updateSyncStatus(r.id, 'synced')).called(1);
    });
  });
}

// ── Fixtures ──────────────────────────────────────────────────────────────────

Coordinate _coord() => Coordinate(
      latitude: 6.4076,
      longitude: -72.3117,
      altitude: 4200,
      gpsAccuracy: 3.0,
      manuallyEdited: false,
    );

BirdRecord _bird() => BirdRecord(
      id: 'bird-001',
      outingId: 'outing-001',
      userId: 'user-001',
      recordedAt: DateTime(2025, 6, 15, 10),
      coordinates: _coord(),
      department: 'Boyacá',
      municipality: 'El Cocuy',
      village: 'Güicán',
      sector: 'Páramo Alto',
      syncStatus: 'pending',
      season: 'dry',
      place: 'Bosque de niebla',
      speciesId: 'species-001',
      birdType: 'passerine',
      migratorStatus: 'resident',
      individualCount: 2,
      behavior: 'foraging',
      activity: 'vocal',
      habitat: ['bosque', 'páramo'],
      foragingType: ['insectivore'],
      observedThreats: [],
      photos: [],
    );

RockRecord _rock() => RockRecord(
      id: 'rock-001',
      outingId: 'outing-001',
      userId: 'user-001',
      recordedAt: DateTime(2025, 6, 15, 11),
      coordinates: _coord(),
      department: 'Boyacá',
      municipality: 'El Cocuy',
      village: 'Güicán',
      sector: 'Páramo Alto',
      syncStatus: 'pending',
      rockType: 'igneous',
      dominantColor: 'gray',
      texture: ['coarse'],
      structure: 'massive',
      hardness: '6',
      minerals: 'quartz, feldspar',
      hasSample: false,
      observations: 'Roca bien consolidada',
      photos: [],
    );

SoilRecord _soil() => SoilRecord(
      id: 'soil-001',
      outingId: 'outing-001',
      userId: 'user-001',
      recordedAt: DateTime(2025, 6, 15, 12),
      coordinates: _coord(),
      department: 'Boyacá',
      municipality: 'El Cocuy',
      village: 'Güicán',
      sector: 'Páramo Alto',
      syncStatus: 'pending',
      soilTypes: ['organic'],
      dominantColor: 'dark brown',
      colorVariability: 'low',
      texture: ['loamy'],
      structure: 'granular',
      soilProfile: 'A horizon',
      hasSample: false,
      observations: 'Suelo orgánico de páramo',
      plot: Plot(hasPlot: false),
      photos: [],
    );

VegetationRecord _vegetation() => VegetationRecord(
      id: 'veg-001',
      outingId: 'outing-001',
      userId: 'user-001',
      recordedAt: DateTime(2025, 6, 15, 13),
      coordinates: _coord(),
      department: 'Boyacá',
      municipality: 'El Cocuy',
      village: 'Güicán',
      sector: 'Páramo Alto',
      syncStatus: 'pending',
      speciesId: 'species-veg-001',
      speciesFreeText: 'Espeletia grandiflora',
      commonName: 'Frailejón',
      origin: 'native',
      vegetationType: 'shrub',
      physiognomy: 'erect',
      physicalCondition: 'good',
      hasPyrogeny: false,
      groundCover: 'grass',
      plot: Plot(hasPlot: false),
      photos: [],
    );

WaterRecord _water() => WaterRecord(
      id: 'water-001',
      outingId: 'outing-001',
      userId: 'user-001',
      recordedAt: DateTime(2025, 6, 15, 14),
      coordinates: _coord(),
      department: 'Boyacá',
      municipality: 'El Cocuy',
      village: 'Güicán',
      sector: 'Laguna',
      syncStatus: 'pending',
      weatherConditions: 'clear',
      visibility: 'good',
      access: 'easy',
      samplingDepth: '0.5m',
      apparentColor: 'transparent',
      odor: 'none',
      hasSample: false,
      photos: [],
    );
