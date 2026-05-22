import '../entities/vegetation_record.dart';
import 'form_mapper_helpers.dart';
import 'form_record_mapper.dart';

class VegetationFormMapper implements FormRecordMapper<VegetationRecord> {
  @override
  VegetationRecord fromFormValues(
    Map<String, dynamic> values, {
    required String recordId,
    required String outingId,
    required String userId,
  }) {
    final speciesSelect =
        FormMapperHelpers.stringValue(values, 'especie_principal');
    final speciesId = speciesSelect == 'otra'
        ? FormMapperHelpers.stringValue(values, 'especie_otra')
        : speciesSelect;

    final dap = FormMapperHelpers.optionalDouble(values, 'medida_diametro_dap');
    final basal =
        FormMapperHelpers.optionalDouble(values, 'medida_diametro_basal');
    String? diameterType;
    double? diameter;
    if (dap != null) {
      diameterType = 'dap';
      diameter = dap;
    } else if (basal != null) {
      diameterType = 'basal';
      diameter = basal;
    }

    final pyrogeny =
        FormMapperHelpers.stringValue(values, 'pirogenia') == 'si';

    return VegetationRecord(
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
      speciesId: speciesId,
      speciesFreeText: FormMapperHelpers.stringValue(values, 'especie_otra'),
      commonName: FormMapperHelpers.stringValue(values, 'nombre_comun'),
      origin: FormMapperHelpers.stringValue(values, 'origen_biogeografico'),
      vegetationType: FormMapperHelpers.stringValue(values, 'tipo_vegetacion'),
      height: FormMapperHelpers.optionalDouble(values, 'medida_altura'),
      diameter: diameter,
      diameterType: diameterType,
      canopyLength:
          FormMapperHelpers.optionalDouble(values, 'medida_copa_largo'),
      physiognomy: FormMapperHelpers.stringValue(values, 'fisionomia'),
      coveragePercent:
          FormMapperHelpers.optionalInt(values, 'cobertura_porcentaje'),
      coverageDistribution:
          FormMapperHelpers.optionalString(values, 'cobertura_distribucion'),
      physicalCondition: FormMapperHelpers.stringValue(values, 'estado_fisico'),
      hasPyrogeny: pyrogeny,
      pyrogenyDescription: pyrogeny
          ? FormMapperHelpers.optionalString(values, 'pirogenia_descripcion')
          : null,
      groundCover:
          FormMapperHelpers.stringValue(values, 'cobertura_suelo_aparente'),
      plot: FormMapperHelpers.parsePlot(values),
      photos: const [],
    );
  }
}
