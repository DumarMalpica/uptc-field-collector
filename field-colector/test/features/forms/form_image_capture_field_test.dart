import 'package:field_colector/domain/ports/photo_local_port.dart';
import 'package:field_colector/features/forms/models/form_schema.dart';
import 'package:field_colector/features/forms/providers/form_provider.dart';
import 'package:field_colector/features/forms/widgets/form_image_capture_field.dart';
import 'package:field_colector/core/database/form_draft_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockPhotoLocalPort extends Mock implements PhotoLocalPort {}

class MockFormDraftService extends Mock implements FormDraftService {}

void main() {
  late MockPhotoLocalPort photoLocal;
  late FormProvider provider;

  setUp(() {
    photoLocal = MockPhotoLocalPort();
    provider = FormProvider(draftService: MockFormDraftService());
    provider.setValue('fotos_campo', <String>['photo-a', 'photo-b']);
  });

  testWidgets('FormImageCaptureField muestra contador de fotos', (tester) async {
    when(() => photoLocal.getPhotoById(any())).thenAnswer((_) async => null);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MultiProvider(
            providers: [
              Provider<PhotoLocalPort>.value(value: photoLocal),
            ],
            child: FormImageCaptureField(
              field: const FormFieldDef(
                fieldId: 'fotos_campo',
                label: 'Fotos',
                type: 'image_capture',
                formSection: 1,
                order: 1,
                isRequired: true,
                isVisibleByDefault: true,
              ),
              provider: provider,
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('2 / ${FormImageCaptureField.maxPhotos} fotos'), findsOneWidget);
    expect(find.text('Añadir fotos'), findsOneWidget);
  });
}
