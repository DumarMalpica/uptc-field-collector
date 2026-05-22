import '../entities/bird_record.dart';
import 'form_mapper_helpers.dart';
import 'form_record_mapper.dart';

class BirdFormMapper implements FormRecordMapper<BirdRecord> {
  @override
  BirdRecord fromFormValues(
    Map<String, dynamic> values, {
    required String recordId,
    required String outingId,
    required String userId,
  }) {
    final speciesSelect = FormMapperHelpers.stringValue(values, 'especie_ave');
    final speciesId = speciesSelect == 'otra_especie'
        ? FormMapperHelpers.stringValue(values, 'especie_otra')
        : speciesSelect;

    final threatsText =
        FormMapperHelpers.stringValue(values, 'amenazas_observadas');
    final observedThreats =
        threatsText.isEmpty ? <String>[] : [threatsText];

    return BirdRecord(
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
      season: FormMapperHelpers.stringValue(values, 'epoca_ano'),
      place: FormMapperHelpers.selectOrChildText(
        values,
        selectKey: 'lugar_avistamiento',
        childKey: 'lugar_otro',
      ),
      speciesId: speciesId,
      birdType: FormMapperHelpers.stringValue(values, 'tipo_ave'),
      migratorStatus: FormMapperHelpers.stringValue(values, 'estatus_ave'),
      individualCount: FormMapperHelpers.intValue(values, 'numero_individuos'),
      behavior: FormMapperHelpers.stringValue(values, 'organizacion_social'),
      activity: FormMapperHelpers.selectOrChildText(
        values,
        selectKey: 'actividad_comportamiento',
        childKey: 'actividad_otra',
      ),
      habitat: FormMapperHelpers.stringListValue(values, 'habitat_vegetacion'),
      foragingType: FormMapperHelpers.stringListValue(values, 'tipo_forrajeo'),
      observedThreats: observedThreats,
      photos: const [],
    );
  }
}
