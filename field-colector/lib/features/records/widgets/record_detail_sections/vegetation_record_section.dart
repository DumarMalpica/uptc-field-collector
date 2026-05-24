import 'package:field_colector/domain/entities/vegetation_record.dart';
import 'package:field_colector/features/records/utils/record_display_format.dart';
import 'package:field_colector/features/utilities/widgets/detail_field.dart';
import 'package:flutter/material.dart';

class VegetationRecordDetailSection extends StatelessWidget {
  const VegetationRecordDetailSection({super.key, required this.record});

  final VegetationRecord record;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailField(
          label: 'Especie',
          value: RecordDisplayFormat.formatWithFreeText(record.speciesId, record.speciesFreeText),
        ),
        DetailField(label: 'Nombre común', value: record.commonName),
        DetailField(label: 'Origen biogeográfico', value: record.origin),
        DetailField(label: 'Tipo vegetación', value: record.vegetationType),
        DetailField(
          label: 'Altura',
          value: RecordDisplayFormat.formatOptionalNum(record.height),
        ),
        if (record.diameter != null)
          DetailField(
            label: 'Diámetro (${record.diameterType ?? '—'})',
            value: RecordDisplayFormat.formatOptionalNum(record.diameter),
          ),
        DetailField(
          label: 'Copa (largo)',
          value: RecordDisplayFormat.formatOptionalNum(record.canopyLength),
        ),
        DetailField(label: 'Fisionomía', value: record.physiognomy),
        DetailField(
          label: 'Cobertura %',
          value: RecordDisplayFormat.formatOptionalInt(record.coveragePercent),
        ),
        if (record.coverageDistribution != null)
          DetailField(
            label: 'Distribución cobertura',
            value: record.coverageDistribution!,
          ),
        DetailField(label: 'Estado físico', value: record.physicalCondition),
        DetailField(
          label: 'Pirogenia',
          value: record.hasPyrogeny
              ? (record.pyrogenyDescription ?? 'Sí')
              : 'No',
        ),
        DetailField(label: 'Cobertura suelo', value: record.groundCover),
        DetailField(label: 'Parcela', value: RecordDisplayFormat.formatPlot(record.plot)),
      ],
    );
  }
}
