import 'package:field_colector/features/utilities/export_service.dart';
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';

/// Estado y acciones de exportación Excel vía [ExportService].
class ExportProvider extends ChangeNotifier {
  ExportProvider({required ExportService exportService})
      : _exportService = exportService;

  final ExportService _exportService;

  bool _isExporting = false;
  String? _errorMessage;
  String? _lastExportPath;

  bool get isExporting => _isExporting;
  String? get errorMessage => _errorMessage;
  String? get lastExportPath => _lastExportPath;

  /// Exporta con filtros opcionales (expedición, usuario, fechas).
  Future<bool> export({
    String? outingId,
    String? userId,
    DateTime? startDate,
    DateTime? endDate,
    required String fileNamePrefix,
  }) async {
    final safePrefix = _sanitizeFilePrefix(fileNamePrefix);
    return _runExport(
      () => _exportService.generateExcel(
        outingId: outingId,
        userId: userId,
        startDate: startDate,
        endDate: endDate,
        fileNamePrefix: safePrefix,
      ),
    );
  }

  /// Exporta registros de una expedición (atajo sin filtros extra).
  Future<bool> exportByOuting({
    required String outingId,
    required String filePrefix,
  }) {
    final prefix = filePrefix.trim().isNotEmpty ? filePrefix : 'expedicion';
    return export(
      outingId: outingId,
      fileNamePrefix: prefix,
    );
  }

  Future<bool> _runExport(Future<String?> Function() generate) async {
    if (_isExporting) return false;

    _isExporting = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final path = await generate();
      if (path == null) {
        _errorMessage =
            'No se pudo generar el archivo Excel (sin datos o error al guardar)';
        return false;
      }

      _lastExportPath = path;
      await Share.shareXFiles(
        [XFile(path)],
        subject: 'Exportación Citesa Field Colector',
        text: 'Datos exportados desde Citesa Field Colector',
      );
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    } finally {
      _isExporting = false;
      notifyListeners();
    }
  }

  static String _sanitizeFilePrefix(String raw) {
    final trimmed = raw.trim();
    if (trimmed.isEmpty) return 'expedicion';
    return trimmed
        .replaceAll(RegExp(r'[^\w\-.]+'), '_')
        .replaceAll(RegExp(r'_+'), '_');
  }
}
