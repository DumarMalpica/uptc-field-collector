import 'package:field_colector/domain/entities/social_record.dart';
import 'package:field_colector/features/records/utils/record_display_format.dart';
import 'package:field_colector/features/utilities/widgets/detail_field.dart';
import 'package:flutter/material.dart';

class SocialRecordDetailSection extends StatelessWidget {
  const SocialRecordDetailSection({super.key, required this.record});

  final SocialRecord record;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailField(label: 'ID encuestado', value: record.respondentId),
        DetailField(label: 'Nombre actor', value: record.actorName),
        DetailField(label: 'Tipo actor', value: record.actorType),
        DetailField(label: 'Edad', value: record.age.toStringAsFixed(0)),
        DetailField(label: 'Género', value: record.gender),
        DetailField(label: 'Nivel educativo', value: record.educationLevel),
        DetailField(label: 'Actividad principal', value: record.mainActivity),
        DetailField(
          label: 'Tiempo en territorio',
          value: record.timeInTerritory.toStringAsFixed(1),
        ),
        if (record.locationMunicipality != null)
          DetailField(
            label: 'Ubicación municipio',
            value: record.locationMunicipality!,
          ),
        if (record.locationVillage != null)
          DetailField(label: 'Ubicación vereda', value: record.locationVillage!),
        DetailField(
          label: 'Dependencia recursos',
          value: record.naturalResourceDependency,
        ),
        DetailField(
          label: 'Percepción cambio cobertura',
          value: record.coverageChangePerception,
        ),
        if (record.observedChangeType != null)
          DetailField(
            label: 'Tipo cambio observado',
            value: record.observedChangeType!,
          ),
        DetailField(
          label: 'Participación organizaciones',
          value: RecordDisplayFormat.formatWithFreeText(
            record.organizationParticipation,
            record.organizationName,
          ),
        ),
        DetailField(
          label: 'Frecuencia interacción',
          value: record.actorInteractionFrequency,
        ),
        if (record.connectedKeyActors != null)
          DetailField(
            label: 'Actores clave',
            value: record.connectedKeyActors!,
          ),
        DetailField(label: 'Tipo relación', value: record.relationshipType),
        DetailField(label: 'Nivel confianza', value: record.trustLevel),
        DetailField(
          label: 'Acceso info ambiental',
          value: record.environmentalInfoAccess,
        ),
        if (record.technologyUse != null)
          DetailField(label: 'Uso tecnologías', value: record.technologyUse!),
        DetailField(
          label: 'Conectividad territorial',
          value: record.territorialConnectivity,
        ),
        DetailField(
          label: 'Percepción fragmentación',
          value: record.fragmentationPerception,
        ),
        DetailField(
          label: 'Cambios prácticas',
          value: RecordDisplayFormat.formatWithFreeText(
            record.productivePracticeChanges,
            record.practiceType,
          ),
        ),
        DetailField(
          label: 'Impacto paisaje',
          value: record.perceivedLandscapeImpact,
        ),
        if (record.observations != null)
          DetailField(label: 'Observaciones', value: record.observations!),
      ],
    );
  }
}
