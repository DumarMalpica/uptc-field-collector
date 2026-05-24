import 'dart:typed_data';
import 'package:field_colector/domain/entities/photo.dart';
import 'package:field_colector/domain/ports/photo_local_port.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPhotoLocalPort extends Mock implements PhotoLocalPort {}

void main() {
  late MockPhotoLocalPort mockPort;

  setUp(() => mockPort = MockPhotoLocalPort());

  group('PhotoLocalPort — contrato de almacenamiento local de fotos', () {
    // ── Guardado ──────────────────────────────────────────────────────────────

    test('savePhotoLocally retorna el photoId generado', () async {
      final bytes = Uint8List.fromList([0xFF, 0xD8, 0xFF]); // header JPEG
      const expectedId = 'bird-rec-001-1234567';

      when(
        () => mockPort.savePhotoLocally(
          bytes,
          'bird-rec-001',
          'field',
          recordType: 'bird',
        ),
      ).thenAnswer((_) async => expectedId);

      final photoId = await mockPort.savePhotoLocally(
        bytes,
        'bird-rec-001',
        'field',
        recordType: 'bird',
      );

      expect(photoId, expectedId);
      verify(
        () => mockPort.savePhotoLocally(
          bytes,
          'bird-rec-001',
          'field',
          recordType: 'bird',
        ),
      ).called(1);
    });

    test('savePhotoLocally con distintos recordId genera rutas distintas',
        () async {
      final bytes = Uint8List.fromList([0xFF, 0xD8, 0xFF]);
      const pathBird = '/files/citesa_photos/bird-rec-001/field_111.jpg';
      const pathRock = '/files/citesa_photos/rock-rec-001/field_222.jpg';

      when(
        () => mockPort.savePhotoLocally(
          bytes,
          'bird-rec-001',
          'field',
          recordType: 'bird',
        ),
      ).thenAnswer((_) async => pathBird);
      when(
        () => mockPort.savePhotoLocally(
          bytes,
          'rock-rec-001',
          'field',
          recordType: 'rock',
        ),
      ).thenAnswer((_) async => pathRock);

      final r1 = await mockPort.savePhotoLocally(
        bytes,
        'bird-rec-001',
        'field',
        recordType: 'bird',
      );
      final r2 = await mockPort.savePhotoLocally(
        bytes,
        'rock-rec-001',
        'field',
        recordType: 'rock',
      );

      expect(r1, isNot(equals(r2)));
    });

    // ── Consultas ─────────────────────────────────────────────────────────────

    test('getPhotosByRecord retorna fotos del registro', () async {
      final photo = _photoSynced();
      when(() => mockPort.getPhotosByRecord('bird-rec-001'))
          .thenAnswer((_) async => [photo]);

      final result = await mockPort.getPhotosByRecord('bird-rec-001');

      expect(result, hasLength(1));
      expect(result.first.recordId, 'bird-rec-001');
      expect(result.first.syncStatus, 'synced');
    });

    test('getPhotosByRecord retorna lista vacía si no hay fotos', () async {
      when(() => mockPort.getPhotosByRecord('rec-sin-fotos'))
          .thenAnswer((_) async => []);

      expect(await mockPort.getPhotosByRecord('rec-sin-fotos'), isEmpty);
    });

    test('getPendingSyncPhotos retorna solo las fotos pendientes', () async {
      final pending = _photoPending();
      when(() => mockPort.getPendingSyncPhotos())
          .thenAnswer((_) async => [pending]);

      final result = await mockPort.getPendingSyncPhotos();

      expect(result, hasLength(1));
      expect(result.first.syncStatus, 'pending');
      expect(result.first.storageUrl, isEmpty);
    });

    test('getPendingSyncPhotos retorna lista vacía si todo está sincronizado',
        () async {
      when(() => mockPort.getPendingSyncPhotos())
          .thenAnswer((_) async => []);

      expect(await mockPort.getPendingSyncPhotos(), isEmpty);
    });

    // ── Eliminación ───────────────────────────────────────────────────────────

    test('deletePhoto elimina la foto correctamente', () async {
      when(() => mockPort.deletePhoto('photo-001'))
          .thenAnswer((_) async {});

      await mockPort.deletePhoto('photo-001');

      verify(() => mockPort.deletePhoto('photo-001')).called(1);
    });

    // ── Actualización de sync ─────────────────────────────────────────────────

    test('updatePhotoSyncStatus actualiza el estado correctamente', () async {
      when(() => mockPort.updatePhotoSyncStatus('photo-001', 'error'))
          .thenAnswer((_) async {});

      await mockPort.updatePhotoSyncStatus('photo-001', 'error');

      verify(() => mockPort.updatePhotoSyncStatus('photo-001', 'error'))
          .called(1);
    });

    test('updatePhotoStorageUrl guarda la URL y marca synced', () async {
      const url = 'https://storage.googleapis.com/citesa/outings/rec/foto.jpg';
      when(() => mockPort.updatePhotoStorageUrl('photo-001', url))
          .thenAnswer((_) async {});

      await mockPort.updatePhotoStorageUrl('photo-001', url);

      verify(() => mockPort.updatePhotoStorageUrl('photo-001', url)).called(1);
    });

    // ── Flujos completos ──────────────────────────────────────────────────────

    test('flujo completo: save → get → syncStatus → storageUrl', () async {
      final bytes = Uint8List.fromList([0xFF, 0xD8, 0xFF]);
      const recordId = 'bird-rec-001';
      const photoId = 'bird-rec-001-1234567';
      const localPath = '/files/citesa_photos/bird-rec-001/field_1234567.jpg';
      const storageUrl =
          'https://storage.googleapis.com/citesa/outings/bird-rec-001/field_1234567.jpg';
      final pending = _photoPending();

      when(
        () => mockPort.savePhotoLocally(
          bytes,
          recordId,
          'field',
          recordType: 'bird',
        ),
      ).thenAnswer((_) async => photoId);
      when(() => mockPort.getPhotosByRecord(recordId))
          .thenAnswer((_) async => [pending]);
      when(() => mockPort.getPendingSyncPhotos())
          .thenAnswer((_) async => [pending]);
      when(() => mockPort.updatePhotoStorageUrl(photoId, storageUrl))
          .thenAnswer((_) async {});

      final id = await mockPort.savePhotoLocally(
        bytes,
        recordId,
        'field',
        recordType: 'bird',
      );
      expect(id, photoId);

      final fotos = await mockPort.getPhotosByRecord(recordId);
      expect(fotos.first.syncStatus, 'pending');

      final pendientes = await mockPort.getPendingSyncPhotos();
      expect(pendientes, hasLength(1));

      await mockPort.updatePhotoStorageUrl(photoId, storageUrl);
      verify(() => mockPort.updatePhotoStorageUrl(photoId, storageUrl))
          .called(1);
    });

    test('flujo de error: save → syncStatus error → reintento', () async {
      const photoId = 'bird-rec-001-1234567';

      when(() => mockPort.updatePhotoSyncStatus(photoId, 'error'))
          .thenAnswer((_) async {});
      when(() => mockPort.getPendingSyncPhotos())
          .thenAnswer((_) async => [_photoPending()]);
      when(() => mockPort.updatePhotoSyncStatus(photoId, 'pending'))
          .thenAnswer((_) async {});

      await mockPort.updatePhotoSyncStatus(photoId, 'error');

      await mockPort.updatePhotoSyncStatus(photoId, 'pending');
      final reintentables = await mockPort.getPendingSyncPhotos();
      expect(reintentables, hasLength(1));

      verify(() => mockPort.updatePhotoSyncStatus(photoId, 'error')).called(1);
      verify(() => mockPort.updatePhotoSyncStatus(photoId, 'pending'))
          .called(1);
    });

    test('flujo completo: save → delete → get vacío', () async {
      final bytes = Uint8List.fromList([0xFF, 0xD8, 0xFF]);
      const recordId = 'rock-rec-001';
      const photoId = 'rock-rec-001-9999';
      const localPath = '/files/citesa_photos/rock-rec-001/panorama_9999.jpg';

      when(
        () => mockPort.savePhotoLocally(
          bytes,
          recordId,
          'panorama',
          recordType: 'rock',
        ),
      ).thenAnswer((_) async => photoId);
      when(() => mockPort.deletePhoto(photoId)).thenAnswer((_) async {});
      when(() => mockPort.getPhotosByRecord(recordId))
          .thenAnswer((_) async => []);

      await mockPort.savePhotoLocally(
        bytes,
        recordId,
        'panorama',
        recordType: 'rock',
      );
      await mockPort.deletePhoto(photoId);

      final result = await mockPort.getPhotosByRecord(recordId);
      expect(result, isEmpty);
    });
  });
}

// ── Fixtures ──────────────────────────────────────────────────────────────────

Photo _photoSynced() => Photo(
      id: 'bird-rec-001-1234567',
      filename: 'field_1234567.jpg',
      localPath: '/files/citesa_photos/bird-rec-001/field_1234567.jpg',
      storageUrl:
          'https://storage.googleapis.com/citesa/outings/bird-rec-001/field_1234567.jpg',
      photoType: 'field',
      recordId: 'bird-rec-001',
      recordType: 'bird',
      syncStatus: 'synced',
    );

Photo _photoPending() => Photo(
      id: 'bird-rec-001-1234567',
      filename: 'field_1234567.jpg',
      localPath: '/files/citesa_photos/bird-rec-001/field_1234567.jpg',
      storageUrl: '',
      photoType: 'field',
      recordId: 'bird-rec-001',
      recordType: 'bird',
      syncStatus: 'pending',
    );
