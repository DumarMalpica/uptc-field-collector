import 'package:field_colector/domain/entities/base_record.dart';
import 'package:field_colector/domain/entities/bird_record.dart';
import 'package:field_colector/domain/entities/photo.dart';
import 'package:field_colector/domain/entities/rock_record.dart';
import 'package:field_colector/domain/entities/social_record.dart';
import 'package:field_colector/domain/entities/soil_record.dart';
import 'package:field_colector/domain/entities/vegetation_record.dart';
import 'package:field_colector/domain/entities/water_record.dart';
import 'package:field_colector/domain/mappers/form_mapper_registry.dart';
import 'package:field_colector/features/records/widgets/record_detail_sections/bird_record_section.dart';
import 'package:field_colector/features/records/widgets/record_detail_sections/rock_record_section.dart';
import 'package:field_colector/features/records/widgets/record_detail_sections/social_record_section.dart';
import 'package:field_colector/features/records/widgets/record_detail_sections/soil_record_section.dart';
import 'package:field_colector/features/records/widgets/record_detail_sections/vegetation_record_section.dart';
import 'package:field_colector/features/records/widgets/record_detail_sections/water_record_section.dart';
import 'package:flutter/material.dart';

class RecordModuleSection extends StatelessWidget {
  const RecordModuleSection({
    super.key,
    required this.moduleFormId,
    required this.record,
  });

  final String moduleFormId;
  final BaseRecord record;

  static List<Photo> photosFor(BaseRecord record) {
    return switch (record) {
      BirdRecord r => r.photos,
      RockRecord r => r.photos,
      SoilRecord r => r.photos,
      VegetationRecord r => r.photos,
      WaterRecord r => r.photos,
      SocialRecord r => r.photos,
      _ => const [],
    };
  }

  @override
  Widget build(BuildContext context) {
    return switch (moduleFormId) {
      FormMapperRegistry.moduloRocas =>
        RockRecordDetailSection(record: record as RockRecord),
      FormMapperRegistry.moduloSuelos =>
        SoilRecordDetailSection(record: record as SoilRecord),
      FormMapperRegistry.moduloAgua =>
        WaterRecordDetailSection(record: record as WaterRecord),
      FormMapperRegistry.moduloVegetacion =>
        VegetationRecordDetailSection(record: record as VegetationRecord),
      FormMapperRegistry.moduloAves =>
        BirdRecordDetailSection(record: record as BirdRecord),
      FormMapperRegistry.moduloSocial =>
        SocialRecordDetailSection(record: record as SocialRecord),
      _ => const Text('Módulo no soportado'),
    };
  }
}
