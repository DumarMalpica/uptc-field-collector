import '../entities/photo.dart';
import '../entities/soil_record.dart';
import 'form_mapper_helpers.dart';
import 'form_record_mapper.dart';

class SoilFormMapper implements FormRecordMapper<SoilRecord> {
  @override
  SoilRecord fromFormValues(
    Map<String, dynamic> values, {
    required String recordId,
    required String outingId,
    required String userId,
    List<Photo> photos = const [],
  }) {
    final soilTypes = FormMapperHelpers.stringListValue(values, 'tipo_suelo');
    final sampleDepth =
        FormMapperHelpers.optionalDouble(values, 'profundidad_cm');

    return SoilRecord(
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
      soilTypes: soilTypes,
      soilTypeFreeText: soilTypes.contains('otro')
          ? FormMapperHelpers.optionalString(values, 'tipo_suelo_otro')
          : null,
      dominantColor:
          FormMapperHelpers.stringValue(values, 'color_predominante'),
      colorVariability:
          FormMapperHelpers.stringValue(values, 'variabilidad_colores'),
      texture: FormMapperHelpers.stringListValue(values, 'textura_suelo'),
      textureFreeText:
          FormMapperHelpers.optionalString(values, 'textura_suelo_otro'),
      structure: FormMapperHelpers.selectOrChildText(
        values,
        selectKey: 'estructura_suelo',
        childKey: 'estructura_suelo_otro',
      ),
      structureFreeText:
          FormMapperHelpers.optionalString(values, 'estructura_suelo_otro'),
      soilProfile: FormMapperHelpers.stringValue(values, 'perfil_suelo'),
      hasSample: sampleDepth != null,
      sampleId: null,
      sampleDepth: sampleDepth,
      observations:
          FormMapperHelpers.stringValue(values, 'observaciones_adicionales'),
      plot: FormMapperHelpers.parsePlot(values),
      photos: photos,
    );
  }
}
