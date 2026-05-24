import 'package:field_colector/domain/entities/coordinate.dart';
import 'package:field_colector/domain/entities/rock_record.dart';
import 'package:field_colector/features/records/widgets/record_detail_sections/rock_record_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

RockRecord _sampleRock() => RockRecord(
      id: 'rock-001',
      outingId: 'outing-001',
      userId: 'user-001',
      recordedAt: DateTime(2025, 6, 15, 11),
      coordinates: Coordinate(
        latitude: 6.5,
        longitude: -72.3,
        altitude: 4100,
        gpsAccuracy: 5,
        manuallyEdited: false,
      ),
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

void main() {
  testWidgets('RockRecordDetailSection muestra campos clave de auditoría',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RockRecordDetailSection(record: _sampleRock()),
        ),
      ),
    );

    expect(find.text('Tipo de roca'), findsOneWidget);
    expect(find.text('igneous'), findsOneWidget);
    expect(find.text('Color predominante'), findsOneWidget);
    expect(find.text('gray'), findsOneWidget);
    expect(find.text('Observaciones'), findsOneWidget);
    expect(find.text('Roca bien consolidada'), findsOneWidget);
  });
}
