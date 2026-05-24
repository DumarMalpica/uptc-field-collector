import 'package:field_colector/domain/entities/water_record.dart';
import 'package:field_colector/features/records/utils/record_display_format.dart';
import 'package:field_colector/features/utilities/widgets/detail_field.dart';
import 'package:flutter/material.dart';

class WaterRecordDetailSection extends StatelessWidget {
  const WaterRecordDetailSection({super.key, required this.record});

  final WaterRecord record;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailField(label: 'Condiciones climáticas', value: record.weatherConditions),
        DetailField(
          label: 'Visibilidad / acceso',
          value: RecordDisplayFormat.formatWithFreeText(record.visibility, record.accessFreeText),
        ),
        DetailField(label: 'Profundidad muestreo', value: record.samplingDepth),
        DetailField(label: 'pH', value: RecordDisplayFormat.formatOptionalNum(record.ph)),
        DetailField(
          label: 'Temperatura',
          value: RecordDisplayFormat.formatOptionalNum(record.temperature),
        ),
        DetailField(
          label: 'Conductividad',
          value: RecordDisplayFormat.formatOptionalNum(record.conductivity),
        ),
        DetailField(
          label: 'Oxígeno disuelto',
          value: RecordDisplayFormat.formatOptionalNum(record.dissolvedOxygen),
        ),
        DetailField(
          label: 'Turbidez',
          value: RecordDisplayFormat.formatOptionalNum(record.turbidity),
        ),
        DetailField(label: 'Color aparente', value: record.apparentColor),
        DetailField(label: 'Olor', value: record.odor),
        DetailField(label: 'Toma de muestras', value: RecordDisplayFormat.formatBool(record.hasSample)),
        if (record.sampleType != null)
          DetailField(label: 'Tipo de muestra', value: record.sampleType!),
        if (record.container != null)
          DetailField(label: 'Recipiente', value: record.container!),
        if (record.samplingGoal != null)
          DetailField(label: 'Objetivo muestreo', value: record.samplingGoal!),
        if (record.sampleId != null && record.sampleId!.isNotEmpty)
          DetailField(label: 'ID muestra', value: record.sampleId!),
      ],
    );
  }
}
