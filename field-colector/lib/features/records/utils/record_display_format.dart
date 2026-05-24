import 'package:field_colector/domain/entities/coordinate.dart';
import 'package:field_colector/domain/entities/plot.dart';

class RecordDisplayFormat {
  RecordDisplayFormat._();

  static String formatList(List<String> values, {String separator = ', '}) {
    if (values.isEmpty) return '';
    return values.join(separator);
  }

  static String formatOptionalString(String? value) => value?.trim() ?? '';

  static String formatOptionalNum(num? value, {int decimals = 2}) {
    if (value == null) return '';
    return value.toStringAsFixed(decimals);
  }

  static String formatOptionalInt(int? value) {
    if (value == null) return '';
    return value.toString();
  }

  static String formatBool(bool value) => value ? 'Sí' : 'No';

  static String formatCoordinate(Coordinate c) {
    return '${c.latitude.toStringAsFixed(6)}, ${c.longitude.toStringAsFixed(6)}'
        '${c.altitude.isFinite ? ' · ${c.altitude.toStringAsFixed(1)} m' : ''}';
  }

  static String formatPlot(Plot plot) {
    if (!plot.hasPlot) return 'Sin parcela';
    final h = plot.height;
    final w = plot.width;
    if (h != null && w != null) {
      return 'Sí · ${h.toStringAsFixed(2)} × ${w.toStringAsFixed(2)} m';
    }
    return 'Sí';
  }

  static String formatWithFreeText(String primary, String? freeText) {
    if (freeText != null && freeText.trim().isNotEmpty) {
      return '$primary ($freeText)';
    }
    return primary;
  }
}
