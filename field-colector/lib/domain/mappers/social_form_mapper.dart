import '../entities/social_record.dart';
import 'form_mapper_helpers.dart';
import 'form_record_mapper.dart';

class SocialFormMapper implements FormRecordMapper<SocialRecord> {
  @override
  SocialRecord fromFormValues(
    Map<String, dynamic> values, {
    required String recordId,
    required String outingId,
    required String userId,
  }) {
    final orgParticipation = FormMapperHelpers.stringValue(
      values,
      'participacion_organizaciones',
    );
    final practiceChanges = FormMapperHelpers.stringValue(
      values,
      'cambios_practicas_productivas',
    );

    return SocialRecord(
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
      respondentId: FormMapperHelpers.stringValue(values, 'id_encuestado'),
      actorName: FormMapperHelpers.stringValue(values, 'nombre_actor'),
      actorType: FormMapperHelpers.stringValue(values, 'tipo_actor'),
      age: FormMapperHelpers.doubleValue(values, 'edad'),
      gender: FormMapperHelpers.stringValue(values, 'genero'),
      educationLevel: FormMapperHelpers.stringValue(values, 'nivel_educativo'),
      mainActivity: FormMapperHelpers.stringValue(values, 'actividad_principal'),
      timeInTerritory:
          FormMapperHelpers.doubleValue(values, 'tiempo_en_territorio'),
      locationMunicipality:
          FormMapperHelpers.optionalString(values, 'ubicacion_municipio'),
      locationVillage:
          FormMapperHelpers.optionalString(values, 'ubicacion_vereda'),
      naturalResourceDependency: FormMapperHelpers.stringValue(
        values,
        'dependencia_recursos_naturales',
      ),
      coverageChangePerception: FormMapperHelpers.stringValue(
        values,
        'percepcion_cambio_cobertura',
      ),
      observedChangeType:
          FormMapperHelpers.optionalString(values, 'tipo_cambio_observado'),
      organizationParticipation: orgParticipation,
      organizationName: orgParticipation == 'si'
          ? FormMapperHelpers.optionalString(values, 'nombre_organizacion')
          : null,
      actorInteractionFrequency: FormMapperHelpers.stringValue(
        values,
        'frecuencia_interaccion_actores',
      ),
      connectedKeyActors:
          FormMapperHelpers.optionalString(values, 'actores_clave_conectados'),
      relationshipType: FormMapperHelpers.stringValue(values, 'tipo_relacion'),
      trustLevel: FormMapperHelpers.stringValue(values, 'nivel_confianza'),
      environmentalInfoAccess: FormMapperHelpers.stringValue(
        values,
        'acceso_informacion_ambiental',
      ),
      technologyUse: FormMapperHelpers.optionalString(values, 'uso_tecnologias'),
      territorialConnectivity: FormMapperHelpers.stringValue(
        values,
        'percepcion_conectividad_territorial',
      ),
      fragmentationPerception: FormMapperHelpers.stringValue(
        values,
        'percepcion_fragmentacion',
      ),
      productivePracticeChanges: practiceChanges,
      practiceType: practiceChanges == 'si'
          ? FormMapperHelpers.optionalString(values, 'tipo_practica')
          : null,
      perceivedLandscapeImpact: FormMapperHelpers.stringValue(
        values,
        'impacto_percibido_paisaje',
      ),
      observations: FormMapperHelpers.optionalString(values, 'observaciones'),
    );
  }
}
