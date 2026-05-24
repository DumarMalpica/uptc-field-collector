import 'package:field_colector/domain/entities/soil_record.dart';
import 'package:field_colector/features/records/utils/record_display_format.dart';
import 'package:field_colector/features/utilities/widgets/detail_field.dart';
import 'package:flutter/material.dart';

class SoilRecordDetailSection extends StatelessWidget {
  const SoilRecordDetailSection({super.key, required this.record});

  final SoilRecord record;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailField(
          label: 'Tipo de suelo',
          value: RecordDisplayFormat.formatWithFreeText(
            RecordDisplayFormat.formatList(record.soilTypes),
            record.soilTypeFreeText,
          ),
        ),
        DetailField(label: 'Color predominante', value: record.dominantColor),
        DetailField(label: 'Variabilidad colores', value: record.colorVariability),
        DetailField(
          label: 'Textura',
          value: RecordDisplayFormat.formatWithFreeText(
            RecordDisplayFormat.formatList(record.texture),
            record.textureFreeText,
          ),
        ),
        DetailField(label: 'Estructura', value: record.structure),
        DetailField(label: 'Perfil de suelo', value: record.soilProfile),
        DetailField(
          label: 'Parcela',
          value: RecordDisplayFormat.formatPlot(record.plot),
        ),
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
