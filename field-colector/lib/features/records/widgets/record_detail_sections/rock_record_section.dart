import 'package:field_colector/domain/entities/rock_record.dart';
import 'package:field_colector/features/records/utils/record_display_format.dart';
import 'package:field_colector/features/utilities/widgets/detail_field.dart';
import 'package:flutter/material.dart';

class RockRecordDetailSection extends StatelessWidget {
  const RockRecordDetailSection({super.key, required this.record});

  final RockRecord record;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailField(
          label: 'Tipo de roca',
          value: RecordDisplayFormat.formatWithFreeText(
            record.rockType,
            record.rockTypeFreeText,
          ),
        ),
        DetailField(label: 'Color predominante', value: record.dominantColor),
        DetailField(
          label: 'Textura',
          value: RecordDisplayFormat.formatList(record.texture),
        ),
        DetailField(label: 'Estructura', value: record.structure),
        DetailField(label: 'Dureza', value: record.hardness),
        DetailField(label: 'Minerales', value: record.minerals),
        DetailField(
          label: 'Muestra',
          value: record.hasSample
              ? 'Sí${record.sampleDepth != null ? ' · ${record.sampleDepth!.toStringAsFixed(1)} cm' : ''}'
              : 'No',
        ),
        if (record.sampleId != null && record.sampleId!.isNotEmpty)
          DetailField(label: 'ID muestra', value: record.sampleId!),
        DetailField(label: 'Observaciones', value: record.observations),
      ],
    );
  }
}
