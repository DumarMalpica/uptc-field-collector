import '../entities/photo.dart';
import '../entities/rock_record.dart';
import 'form_mapper_helpers.dart';
import 'form_record_mapper.dart';

class RockFormMapper implements FormRecordMapper<RockRecord> {
  @override
  RockRecord fromFormValues(
    Map<String, dynamic> values, {
    required String recordId,
    required String outingId,
    required String userId,
    List<Photo> photos = const [],
  }) {
    final rockTypeSelect = FormMapperHelpers.stringValue(values, 'tipo_roca');
    final sampleDepth =
        FormMapperHelpers.optionalDouble(values, 'profundidad_cm');

    return RockRecord(
      id: recordId,
      outingId: outingId,
      userId: userId,
      recordedAt: DateTime.now(),
      coordinates: FormMapperHelpers.parseCoordinate(values),
      department: FormMapperHelpers.stringValue(values, 'departamento'),
      municipality: FormMapperHelpers.stringValue(values, 'municipio'),
      village: FormMapperHelpers.stringValue(values, 'vereda'),
      sector: FormMapperHelpers.stringValue(values, 'sector'),
      syncStatus: 'pending',
      rockType: rockTypeSelect,
      rockTypeFreeText: rockTypeSelect == 'otro'
          ? FormMapperHelpers.optionalString(values, 'tipo_roca_otro')
          : null,
      dominantColor:
          FormMapperHelpers.stringValue(values, 'color_predominante'),
      texture: FormMapperHelpers.stringListValue(values, 'textura_roca'),
      structure: FormMapperHelpers.stringValue(values, 'estructura_roca'),
      hardness: FormMapperHelpers.stringValue(values, 'dureza_roca'),
      minerals: FormMapperHelpers.stringValue(values, 'minerales_presentes'),
      hasSample: sampleDepth != null,
      sampleId: null,
      sampleDepth: sampleDepth,
      observations:
          FormMapperHelpers.stringValue(values, 'observaciones_adicionales'),
      photos: photos,
    );
  }
}
