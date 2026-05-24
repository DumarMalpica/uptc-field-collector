import 'package:field_colector/domain/entities/base_record.dart';
import 'package:field_colector/domain/entities/social_record.dart';
import 'package:field_colector/domain/mappers/form_mapper_registry.dart';
import 'package:field_colector/domain/ports/photo_local_port.dart';
import 'package:field_colector/features/records/services/record_photo_enrichment.dart';
import 'package:field_colector/domain/ports/bird_record_local_port.dart';
import 'package:field_colector/domain/ports/bird_record_remote_port.dart';
import 'package:field_colector/domain/ports/rock_record_local_port.dart';
import 'package:field_colector/domain/ports/rock_record_remote_port.dart';
import 'package:field_colector/domain/ports/social_record_local_port.dart';
import 'package:field_colector/domain/ports/social_record_remote_port.dart';
import 'package:field_colector/domain/ports/soil_record_local_port.dart';
import 'package:field_colector/domain/ports/soil_record_remote_port.dart';
import 'package:field_colector/domain/ports/vegetation_record_local_port.dart';
import 'package:field_colector/domain/ports/vegetation_record_remote_port.dart';
import 'package:field_colector/domain/ports/water_record_local_port.dart';
import 'package:field_colector/domain/ports/water_record_remote_port.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

/// Recarga un registro desde Isar según el módulo de formulario.
class RecordDetailRefresh {
  RecordDetailRefresh._();

  static Future<BaseRecord?> fetch(
    BuildContext context, {
    required String moduleFormId,
    required String recordId,
  }) async {
    final record = await switch (moduleFormId) {
      FormMapperRegistry.moduloAves =>
        context.read<BirdRecordLocalPort>().getRecordById(recordId),
      FormMapperRegistry.moduloRocas =>
        context.read<RockRecordLocalPort>().getRecordById(recordId),
      FormMapperRegistry.moduloSuelos =>
        context.read<SoilRecordLocalPort>().getRecordById(recordId),
      FormMapperRegistry.moduloVegetacion =>
        context.read<VegetationRecordLocalPort>().getRecordById(recordId),
      FormMapperRegistry.moduloAgua =>
        context.read<WaterRecordLocalPort>().getRecordById(recordId),
      FormMapperRegistry.moduloSocial =>
        context.read<SocialRecordLocalPort>().getRecordById(recordId),
      _ => Future<BaseRecord?>.value(null),
    };
    if (record == null) return null;
    if (moduleFormId == FormMapperRegistry.moduloSocial && record is SocialRecord) {
      return RecordPhotoEnrichment.socialWithPhotos(
        record,
        context.read<PhotoLocalPort>(),
      );
    }
    return record;
  }

  /// Isar primero; si falta y hay red, Firestore (p. ej. registro de compañero).
  static Future<BaseRecord?> fetchWithRemoteFallback(
    BuildContext context, {
    required String moduleFormId,
    required String recordId,
    required bool tryRemote,
  }) async {
    final local = await fetch(
      context,
      moduleFormId: moduleFormId,
      recordId: recordId,
    );
    if (local != null || !tryRemote) return local;

    return switch (moduleFormId) {
      FormMapperRegistry.moduloAves =>
        context.read<BirdRecordRemotePort>().getBirdRecordById(recordId),
      FormMapperRegistry.moduloRocas =>
        context.read<RockRecordRemotePort>().getRockRecordById(recordId),
      FormMapperRegistry.moduloSuelos =>
        context.read<SoilRecordRemotePort>().getSoilRecordById(recordId),
      FormMapperRegistry.moduloVegetacion => context
          .read<VegetationRecordRemotePort>()
          .getVegetationRecordById(recordId),
      FormMapperRegistry.moduloAgua =>
        context.read<WaterRecordRemotePort>().getWaterRecordById(recordId),
      FormMapperRegistry.moduloSocial =>
        context.read<SocialRecordRemotePort>().getSocialRecordById(recordId),
      _ => null,
    };
  }
}
