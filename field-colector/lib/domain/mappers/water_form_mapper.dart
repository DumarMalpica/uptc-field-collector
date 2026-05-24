import '../entities/photo.dart';
import '../entities/water_record.dart';
import 'form_mapper_helpers.dart';
import 'form_record_mapper.dart';

class WaterFormMapper implements FormRecordMapper<WaterRecord> {
  @override
  WaterRecord fromFormValues(
    Map<String, dynamic> values, {
    required String recordId,
    required String outingId,
    required String userId,
    List<Photo> photos = const [],
  }) {
    final accessSelect =
        FormMapperHelpers.stringValue(values, 'visibilidad_acceso');
    final hasSample =
        FormMapperHelpers.stringValue(values, 'toma_muestras') == 'si';

    return WaterRecord(
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
      weatherConditions: FormMapperHelpers.selectOrChildText(
        values,
        selectKey: 'condiciones_climaticas',
        childKey: 'clima_otro',
      ),
      visibility: accessSelect,
      access: accessSelect,
      accessFreeText: accessSelect == 'otro'
          ? FormMapperHelpers.optionalString(values, 'acceso_otro')
          : null,
      samplingDepth:
          FormMapperHelpers.stringValue(values, 'profundidad_muestreo'),
      ph: FormMapperHelpers.optionalDouble(values, 'param_ph'),
      temperature: FormMapperHelpers.optionalDouble(values, 'param_temperatura'),
      conductivity:
          FormMapperHelpers.optionalDouble(values, 'param_conductividad'),
      dissolvedOxygen:
          FormMapperHelpers.optionalDouble(values, 'param_oxigeno_disuelto'),
      turbidity: FormMapperHelpers.optionalDouble(values, 'param_turbidez'),
      apparentColor: FormMapperHelpers.selectOrChildText(
        values,
        selectKey: 'color_aparente',
        childKey: 'color_otro',
      ),
      odor: FormMapperHelpers.selectOrChildText(
        values,
        selectKey: 'olor_agua',
        childKey: 'olor_otro',
      ),
      hasSample: hasSample,
      sampleId: null,
      sampleType: hasSample
          ? FormMapperHelpers.selectOrChildText(
              values,
              selectKey: 'tipo_muestra',
              childKey: 'tipo_muestra_otro',
            )
          : null,
      container: hasSample
          ? FormMapperHelpers.selectOrChildText(
              values,
              selectKey: 'recipiente_muestra',
              childKey: 'recipiente_otro',
            )
          : null,
      samplingGoal: hasSample
          ? FormMapperHelpers.selectOrChildText(
              values,
              selectKey: 'objetivo_muestreo',
              childKey: 'objetivo_otro',
            )
          : null,
      photos: photos,
    );
  }
}
