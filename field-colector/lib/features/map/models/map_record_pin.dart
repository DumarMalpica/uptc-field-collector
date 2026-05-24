import 'package:field_colector/domain/mappers/form_mapper_registry.dart';
import 'package:field_colector/domain/utils/geo_coords.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

/// Punto en el mapa asociado a un registro de campo (misma coordenada exacta).
class MapRecordPin {
  const MapRecordPin({
    required this.id,
    required this.recordId,
    required this.moduleFormId,
    required this.latitude,
    required this.longitude,
    required this.pinColor,
    this.label,
    this.isOwnRecord = false,
  });

  final String id;
  final String recordId;
  final String moduleFormId;
  final double latitude;
  final double longitude;
  final Color pinColor;
  final String? label;

  /// `true` si el registro pertenece al usuario actual (borde distinto en mapa).
  final bool isOwnRecord;

  static const Map<String, Color> moduleColors = {
    FormMapperRegistry.moduloAgua: Color(0xFF2196F3),
    FormMapperRegistry.moduloAves: Color(0xFFFF9800),
    FormMapperRegistry.moduloRocas: Color(0xFF795548),
    FormMapperRegistry.moduloSuelos: Color(0xFF8D6E63),
    FormMapperRegistry.moduloVegetacion: Color(0xFF4CAF50),
    FormMapperRegistry.moduloSocial: Color(0xFF9C27B0),
  };

  static const Map<String, String> moduleLabels = {
    FormMapperRegistry.moduloAgua: 'Agua',
    FormMapperRegistry.moduloAves: 'Aves',
    FormMapperRegistry.moduloRocas: 'Rocas',
    FormMapperRegistry.moduloSuelos: 'Suelos',
    FormMapperRegistry.moduloVegetacion: 'Vegetación',
    FormMapperRegistry.moduloSocial: 'Social',
  };

  static Color colorFor(String moduleFormId) =>
      moduleColors[moduleFormId] ?? const Color(0xFF607D8B);

  static String labelFor(String moduleFormId) =>
      moduleLabels[moduleFormId] ?? 'Registro';

  LatLng? toLatLng() => tryLatLng(latitude, longitude);
}
