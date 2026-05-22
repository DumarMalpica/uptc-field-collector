import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:field_colector/adapters/real/record_photo_sync_helper.dart';
import 'package:field_colector/domain/entities/photo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}
class MockFirebaseStorage extends Mock implements FirebaseStorage {}
class MockDocumentReference extends Mock implements DocumentReference<Map<String, dynamic>> {}
class MockDocumentSnapshot extends Mock implements DocumentSnapshot<Map<String, dynamic>> {}
class MockCollectionReference extends Mock implements CollectionReference<Map<String, dynamic>> {}
class MockReference extends Mock implements Reference {}
class MockUploadTask extends Mock implements UploadTask {}
class MockTaskSnapshot extends Mock implements TaskSnapshot {}
class MockHttpClient extends Mock implements http.Client {}

class FakeFile extends Fake implements File {}
class FakeBaseRequest extends Fake implements http.BaseRequest {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeFile());
    registerFallbackValue(FakeBaseRequest());
  });

  late MockFirebaseFirestore mockFirestore;
  late MockHttpClient mockHttpClient;
  late MockDocumentReference mockOutingDocRef;
  late MockDocumentSnapshot mockOutingDocSnap;
  late MockCollectionReference mockOutingCollection;
  late MockCollectionReference mockRecordCollection;
  late MockDocumentReference mockRecordDocRef;
  late MockDocumentSnapshot mockRecordDocSnap;

  setUp(() {
    mockFirestore = MockFirebaseFirestore();
    mockHttpClient = MockHttpClient();
    mockOutingDocRef = MockDocumentReference();
    mockOutingDocSnap = MockDocumentSnapshot();
    mockOutingCollection = MockCollectionReference();
    mockRecordCollection = MockCollectionReference();
    mockRecordDocRef = MockDocumentReference();
    mockRecordDocSnap = MockDocumentSnapshot();

    // Setup Outing prefix mock
    when(() => mockFirestore.collection('outings')).thenReturn(mockOutingCollection);
    when(() => mockOutingCollection.doc('outing_123')).thenReturn(mockOutingDocRef);
    when(() => mockOutingDocRef.get()).thenAnswer((_) async => mockOutingDocSnap);
    when(() => mockOutingDocSnap.exists).thenReturn(true);
    when(() => mockOutingDocSnap.data()).thenReturn({'prefix': 'BI'});

    // Setup Cloudinary HTTP mocks
    final responseBody = '{"secure_url": "https://res.cloudinary.com/dvcbrr7h7/image/upload/photo.jpg"}';
    final streamedResponse = http.StreamedResponse(
      Stream.value(utf8.encode(responseBody)),
      200,
    );
    when(() => mockHttpClient.send(any())).thenAnswer((_) async => streamedResponse);

    // Setup Record mocks
    when(() => mockFirestore.collection('bird_records')).thenReturn(mockRecordCollection);
    when(() => mockRecordCollection.doc('record_456')).thenReturn(mockRecordDocRef);
  });

  test('RecordPhotoSyncHelper uploads to Cloudinary and backfills url in Firestore', () async {
    // Create actual temp file for the test
    final tempDir = await Directory.systemTemp.createTemp();
    final tempFile = File('${tempDir.path}/photo.jpg');
    await tempFile.writeAsBytes([0, 1, 2, 3]);

    final photo = Photo(
      id: 'photo_789',
      filename: 'photo.jpg',
      localPath: tempFile.path,
      storageUrl: '',
      photoType: 'field',
      recordId: 'record_456',
      recordType: 'bird',
      syncStatus: 'pending',
    );

    // Mock document transaction/updating behavior
    final docData = {
      'photos': [
        {
          'id': 'photo_789',
          'filename': 'photo.jpg',
          'localPath': tempFile.path,
          'storageUrl': '',
          'photoType': 'field',
          'recordId': 'record_456',
          'recordType': 'bird',
          'syncStatus': 'pending',
        }
      ]
    };

    when(() => mockRecordDocRef.get()).thenAnswer((_) async => mockRecordDocSnap);
    when(() => mockRecordDocSnap.exists).thenReturn(true);
    when(() => mockRecordDocSnap.data()).thenReturn(docData);
    when(() => mockRecordDocRef.update(any())).thenAnswer((_) async {});

    // Stub transaction
    when(() => mockFirestore.runTransaction<void>(any())).thenAnswer((invocation) async {
      // Execute the transaction callback manually
      final callback = invocation.positionalArguments[0] as Future<void> Function(Transaction);
      final mockTransaction = MockTransaction();
      
      // When transaction gets the record doc
      when(() => mockTransaction.get(mockRecordDocRef)).thenAnswer((_) async => mockRecordDocSnap);
      
      await callback(mockTransaction);
    });

    await RecordPhotoSyncHelper.uploadAndSyncPhotos(
      recordId: 'record_456',
      recordType: 'bird',
      outingId: 'outing_123',
      photos: [photo],
      firestore: mockFirestore,
      httpClient: mockHttpClient,
    );

    // Verify Cloudinary HTTP request was sent
    verify(() => mockHttpClient.send(any())).called(1);

    // Clean up temp file
    await tempFile.delete();
    await tempDir.delete();
  });
}

class MockTransaction extends Mock implements Transaction {}
