import 'dart:io';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/ports/bird_record_remote_port.dart';
import '../../domain/ports/rock_record_remote_port.dart';
import '../../domain/ports/soil_record_remote_port.dart';
import '../../domain/ports/vegetation_record_remote_port.dart';
import '../../domain/ports/water_record_remote_port.dart';

import '../../domain/entities/bird_record.dart';
import '../../domain/entities/rock_record.dart';
import '../../domain/entities/soil_record.dart';
import '../../domain/entities/vegetation_record.dart';
import '../../domain/entities/water_record.dart';

class ExportService {
  final BirdRecordRemotePort birdPort;
  final RockRecordRemotePort rockPort;
  final SoilRecordRemotePort soilPort;
  final VegetationRecordRemotePort vegetationPort;
  final WaterRecordRemotePort waterPort;

  ExportService({
    required this.birdPort,
    required this.rockPort,
    required this.soilPort,
    required this.vegetationPort,
    required this.waterPort,
  });

  Future<String?> generateExcel({String? outingId, String? userId, required String fileNamePrefix}) async {
    try {
      var excel = Excel.createExcel();

      String defaultSheet = excel.getDefaultSheet() ?? 'Sheet1';

      final birds = await birdPort.getBirdRecordsForExport(outingId: outingId, userId: userId);
      if (birds.isNotEmpty) {
        Sheet sheet = excel['Aves'];
        sheet.appendRow([
          TextCellValue('ID Registro'), TextCellValue('Fecha'), TextCellValue('Latitud'),
          TextCellValue('Longitud'), TextCellValue('Departamento'), TextCellValue('Municipio'),
          TextCellValue('Época'), TextCellValue('Lugar'), TextCellValue('ID Especie'),
          TextCellValue('Tipo Ave'), TextCellValue('Estatus'), TextCellValue('Cantidad'),
          TextCellValue('Comportamiento'), TextCellValue('Actividad'), TextCellValue('Hábitat'),
          TextCellValue('Forrajeo'), TextCellValue('Amenazas')
        ]);

        for (BirdRecord b in birds) {
          sheet.appendRow([
            TextCellValue(b.id), TextCellValue(b.recordedAt.toIso8601String()), DoubleCellValue(b.coordinates.latitude),
            DoubleCellValue(b.coordinates.longitude), TextCellValue(b.department), TextCellValue(b.municipality),
            TextCellValue(b.season), TextCellValue(b.place), TextCellValue(b.speciesId),
            TextCellValue(b.birdType), TextCellValue(b.migratorStatus), IntCellValue(b.individualCount),
            TextCellValue(b.behavior), TextCellValue(b.activity), TextCellValue(b.habitat.join(', ')),
            TextCellValue(b.foragingType.join(', ')), TextCellValue(b.observedThreats.join(', '))
          ]);
        }
      }

      final rocks = await rockPort.getRockRecordsForExport(outingId: outingId, userId: userId);
      if (rocks.isNotEmpty) {
        Sheet sheet = excel['Rocas'];
        sheet.appendRow([
          TextCellValue('ID Registro'), TextCellValue('Fecha'), TextCellValue('Latitud'), TextCellValue('Longitud'),
          TextCellValue('Tipo Roca'), TextCellValue('Color'), TextCellValue('Textura'),
          TextCellValue('Estructura'), TextCellValue('Dureza'), TextCellValue('Minerales'),
          TextCellValue('Tiene Muestra'), TextCellValue('ID Muestra'), TextCellValue('Profundidad (cm)'), TextCellValue('Observaciones')
        ]);

        for (RockRecord r in rocks) {
          sheet.appendRow([
            TextCellValue(r.id), TextCellValue(r.recordedAt.toIso8601String()), DoubleCellValue(r.coordinates.latitude), DoubleCellValue(r.coordinates.longitude),
            TextCellValue(r.rockType), TextCellValue(r.dominantColor), TextCellValue(r.texture.join(', ')),
            TextCellValue(r.structure), TextCellValue(r.hardness), TextCellValue(r.minerals),
            TextCellValue(r.hasSample ? 'Sí' : 'No'), TextCellValue(r.sampleId ?? ''),
            r.sampleDepth != null ? DoubleCellValue(r.sampleDepth!) : TextCellValue(''),
            TextCellValue(r.observations)
          ]);
        }
      }

      final soils = await soilPort.getSoilRecordsForExport(outingId: outingId, userId: userId);
      if (soils.isNotEmpty) {
        Sheet sheet = excel['Suelos'];
        sheet.appendRow([
          TextCellValue('ID Registro'), TextCellValue('Fecha'), TextCellValue('Latitud'), TextCellValue('Longitud'),
          TextCellValue('Tipos Suelo'), TextCellValue('Color'), TextCellValue('Variabilidad Color'),
          TextCellValue('Textura'), TextCellValue('Estructura'), TextCellValue('Perfil'),
          TextCellValue('Tiene Muestra'), TextCellValue('ID Muestra'), TextCellValue('Profundidad (cm)'), TextCellValue('Observaciones')
        ]);

        for (SoilRecord s in soils) {
          sheet.appendRow([
            TextCellValue(s.id), TextCellValue(s.recordedAt.toIso8601String()), DoubleCellValue(s.coordinates.latitude), DoubleCellValue(s.coordinates.longitude),
            TextCellValue(s.soilTypes.join(', ')), TextCellValue(s.dominantColor), TextCellValue(s.colorVariability),
            TextCellValue(s.texture.join(', ')), TextCellValue(s.structure), TextCellValue(s.soilProfile),
            TextCellValue(s.hasSample ? 'Sí' : 'No'), TextCellValue(s.sampleId ?? ''),
            s.sampleDepth != null ? DoubleCellValue(s.sampleDepth!) : TextCellValue(''),
            TextCellValue(s.observations)
          ]);
        }
      }

      final veg = await vegetationPort.getVegetationRecordsForExport(outingId: outingId, userId: userId);
      if (veg.isNotEmpty) {
        Sheet sheet = excel['Vegetación'];
        sheet.appendRow([
          TextCellValue('ID Registro'), TextCellValue('Fecha'), TextCellValue('Latitud'), TextCellValue('Longitud'),
          TextCellValue('ID Especie'), TextCellValue('Nombre Común'), TextCellValue('Origen'), TextCellValue('Tipo Vegetación'),
          TextCellValue('Altura (m)'), TextCellValue('Diámetro (m)'), TextCellValue('Fisionomía'), TextCellValue('Cobertura %'),
          TextCellValue('Condición'), TextCellValue('Pirogenia'), TextCellValue('Suelo/Hojarasca')
        ]);

        for (VegetationRecord v in veg) {
          sheet.appendRow([
            TextCellValue(v.id), TextCellValue(v.recordedAt.toIso8601String()), DoubleCellValue(v.coordinates.latitude), DoubleCellValue(v.coordinates.longitude),
            TextCellValue(v.speciesId), TextCellValue(v.commonName), TextCellValue(v.origin), TextCellValue(v.vegetationType),
            v.height != null ? DoubleCellValue(v.height!) : TextCellValue(''),
            v.diameter != null ? DoubleCellValue(v.diameter!) : TextCellValue(''),
            TextCellValue(v.physiognomy), v.coveragePercent != null ? IntCellValue(v.coveragePercent!) : TextCellValue(''),
            TextCellValue(v.physicalCondition), TextCellValue(v.hasPyrogeny ? 'Sí' : 'No'), TextCellValue(v.groundCover)
          ]);
        }
      }

      final water = await waterPort.getWaterRecordsForExport(outingId: outingId, userId: userId);
      if (water.isNotEmpty) {
        Sheet sheet = excel['Agua'];
        sheet.appendRow([
          TextCellValue('ID Registro'), TextCellValue('Fecha'), TextCellValue('Latitud'), TextCellValue('Longitud'),
          TextCellValue('Clima'), TextCellValue('Visibilidad'), TextCellValue('Acceso'), TextCellValue('Profundidad'),
          TextCellValue('pH'), TextCellValue('Temp (°C)'), TextCellValue('Conductividad'), TextCellValue('OD (mg/L)'),
          TextCellValue('Turbidez'), TextCellValue('Color Aparente'), TextCellValue('Olor'), TextCellValue('Tiene Muestra'),
          TextCellValue('ID Muestra'), TextCellValue('Objetivo Muestreo')
        ]);

        for (WaterRecord w in water) {
          sheet.appendRow([
            TextCellValue(w.id), TextCellValue(w.recordedAt.toIso8601String()), DoubleCellValue(w.coordinates.latitude), DoubleCellValue(w.coordinates.longitude),
            TextCellValue(w.weatherConditions), TextCellValue(w.visibility), TextCellValue(w.access), TextCellValue(w.samplingDepth),
            w.ph != null ? DoubleCellValue(w.ph!) : TextCellValue(''),
            w.temperature != null ? DoubleCellValue(w.temperature!) : TextCellValue(''),
            w.conductivity != null ? DoubleCellValue(w.conductivity!) : TextCellValue(''),
            w.dissolvedOxygen != null ? DoubleCellValue(w.dissolvedOxygen!) : TextCellValue(''),
            w.turbidity != null ? DoubleCellValue(w.turbidity!) : TextCellValue(''),
            TextCellValue(w.apparentColor), TextCellValue(w.odor), TextCellValue(w.hasSample ? 'Sí' : 'No'),
            TextCellValue(w.sampleId ?? ''), TextCellValue(w.samplingGoal ?? '')
          ]);
        }
      }

      if (excel.tables.keys.length > 1) {
        excel.delete(defaultSheet);
      }

      var fileBytes = excel.save();
      if (fileBytes == null) return null;

      Directory tempDir = await getTemporaryDirectory();
      String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      String filePath = '${tempDir.path}/${fileNamePrefix}_$timestamp.xlsx';

      File file = File(filePath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes);

      print('✅ Archivo Excel generado con éxito: $filePath');
      return filePath;

    } catch (e) {
      print('❌ Error generando el archivo Excel: $e');
      return null;
    }
  }
}