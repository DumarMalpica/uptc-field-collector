import 'package:field_colector/domain/entities/bird_record.dart';
import 'package:field_colector/features/records/utils/record_display_format.dart';
import 'package:field_colector/features/utilities/widgets/detail_field.dart';
import 'package:flutter/material.dart';

class BirdRecordDetailSection extends StatelessWidget {
  const BirdRecordDetailSection({super.key, required this.record});

  final BirdRecord record;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailField(label: 'Época del año', value: record.season),
        DetailField(label: 'Lugar avistamiento', value: record.place),
        DetailField(label: 'Especie', value: record.speciesId),
        DetailField(label: 'Tipo de ave', value: record.birdType),
        DetailField(label: 'Estatus', value: record.migratorStatus),
        DetailField(
          label: 'Nº individuos',
          value: record.individualCount.toString(),
        ),
        DetailField(label: 'Organización social', value: record.behavior),
        DetailField(label: 'Actividad', value: record.activity),
        DetailField(
          label: 'Hábitat',
          value: RecordDisplayFormat.formatList(record.habitat),
        ),
        DetailField(
          label: 'Tipo forrajeo',
          value: RecordDisplayFormat.formatList(record.foragingType),
        ),
        DetailField(
          label: 'Amenazas',
          value: RecordDisplayFormat.formatList(record.observedThreats),
        ),
      ],
    );
  }
}
