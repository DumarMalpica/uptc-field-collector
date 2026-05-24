import 'package:field_colector/domain/entities/base_record.dart';
import 'package:field_colector/domain/entities/bird_record.dart';
import 'package:field_colector/domain/entities/rock_record.dart';
import 'package:field_colector/domain/entities/social_record.dart';
import 'package:field_colector/domain/entities/soil_record.dart';
import 'package:field_colector/domain/entities/vegetation_record.dart';
import 'package:field_colector/domain/entities/water_record.dart';
import 'package:field_colector/domain/mappers/form_mapper_registry.dart';
import 'package:flutter/material.dart';

/// Entrada unificada para listar y abrir detalle de registros de campo.
class RecordListItem {
  const RecordListItem({
    required this.moduleFormId,
    required this.typeLabel,
    required this.typeIcon,
    required this.record,
  });

  final String moduleFormId;
  final String typeLabel;
  final IconData typeIcon;
  final BaseRecord record;

  static RecordListItem bird(BaseRecord record) => RecordListItem(
        moduleFormId: FormMapperRegistry.moduloAves,
        typeLabel: 'Aves',
        typeIcon: Icons.flutter_dash,
        record: record,
      );

  static RecordListItem rock(BaseRecord record) => RecordListItem(
        moduleFormId: FormMapperRegistry.moduloRocas,
        typeLabel: 'Rocas',
        typeIcon: Icons.landscape,
        record: record,
      );

  static RecordListItem soil(BaseRecord record) => RecordListItem(
        moduleFormId: FormMapperRegistry.moduloSuelos,
        typeLabel: 'Suelos',
        typeIcon: Icons.grass,
        record: record,
      );

  static RecordListItem vegetation(BaseRecord record) => RecordListItem(
        moduleFormId: FormMapperRegistry.moduloVegetacion,
        typeLabel: 'Vegetación',
        typeIcon: Icons.forest,
        record: record,
      );

  static RecordListItem water(BaseRecord record) => RecordListItem(
        moduleFormId: FormMapperRegistry.moduloAgua,
        typeLabel: 'Agua',
        typeIcon: Icons.water_drop,
        record: record,
      );

  static RecordListItem social(BaseRecord record) => RecordListItem(
        moduleFormId: FormMapperRegistry.moduloSocial,
        typeLabel: 'Social',
        typeIcon: Icons.groups,
        record: record,
      );

  /// Construye entrada de lista/detalle desde registro + módulo.
  static RecordListItem? fromModule(BaseRecord record, String moduleFormId) {
    return switch (moduleFormId) {
      FormMapperRegistry.moduloAves when record is BirdRecord =>
        RecordListItem.bird(record),
      FormMapperRegistry.moduloRocas when record is RockRecord =>
        RecordListItem.rock(record),
      FormMapperRegistry.moduloSuelos when record is SoilRecord =>
        RecordListItem.soil(record),
      FormMapperRegistry.moduloVegetacion when record is VegetationRecord =>
        RecordListItem.vegetation(record),
      FormMapperRegistry.moduloAgua when record is WaterRecord =>
        RecordListItem.water(record),
      FormMapperRegistry.moduloSocial when record is SocialRecord =>
        RecordListItem.social(record),
      _ => null,
    };
  }
}
