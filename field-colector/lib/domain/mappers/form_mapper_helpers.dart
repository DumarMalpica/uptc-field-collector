import '../entities/coordinate.dart';
import '../entities/plot.dart';

class FormMapperHelpers {
  FormMapperHelpers._();

  static Coordinate parseCoordinate(Map<String, dynamic> values) {
    final raw = values['coordenadas_gps'];
    if (raw is! Map) {
      return Coordinate(
        latitude: 0,
        longitude: 0,
        altitude: 0,
        gpsAccuracy: 0,
        manuallyEdited: false,
      );
    }
    return Coordinate(
      latitude: _toDouble(raw['latitude']),
      longitude: _toDouble(raw['longitude']),
      altitude: _toDouble(raw['altitude']),
      gpsAccuracy: _toDouble(raw['gpsAccuracy']),
      manuallyEdited: raw['manuallyEdited'] == true,
    );
  }

  static Plot parsePlot(Map<String, dynamic> values) {
    final isPlot = stringValue(values, 'es_parcela') == 'si';
    return Plot(
      hasPlot: isPlot,
      width: isPlot ? optionalDouble(values, 'parcela_ancho') : null,
      height: isPlot ? optionalDouble(values, 'parcela_largo') : null,
    );
  }

  static String stringValue(Map<String, dynamic> values, String key,
      {String fallback = ''}) {
    final raw = values[key];
    if (raw == null) return fallback;
    return raw.toString().trim();
  }

  static String? optionalString(Map<String, dynamic> values, String key) {
    final s = stringValue(values, key);
    return s.isEmpty ? null : s;
  }

  static double doubleValue(Map<String, dynamic> values, String key,
      {double fallback = 0}) {
    final raw = values[key];
    if (raw == null) return fallback;
    if (raw is num) return raw.toDouble();
    return double.tryParse(raw.toString()) ?? fallback;
  }

  static double? optionalDouble(Map<String, dynamic> values, String key) {
    final raw = values[key];
    if (raw == null) return null;
    if (raw is num) return raw.toDouble();
    final parsed = double.tryParse(raw.toString());
    return parsed;
  }

  static int intValue(Map<String, dynamic> values, String key,
      {int fallback = 0}) {
    final raw = values[key];
    if (raw == null) return fallback;
    if (raw is int) return raw;
    if (raw is num) return raw.toInt();
    return int.tryParse(raw.toString()) ?? fallback;
  }

  static int? optionalInt(Map<String, dynamic> values, String key) {
    final raw = values[key];
    if (raw == null) return null;
    if (raw is int) return raw;
    if (raw is num) return raw.toInt();
    return int.tryParse(raw.toString());
  }

  static List<String> stringListValue(Map<String, dynamic> values, String key) {
    final raw = values[key];
    if (raw is List) {
      return raw.map((e) => e.toString()).where((s) => s.isNotEmpty).toList();
    }
    return const [];
  }

  static List<String> textAsList(Map<String, dynamic> values, String key) {
    final text = stringValue(values, key);
    if (text.isEmpty) return const [];
    return [text];
  }

  static String selectOrChildText(
    Map<String, dynamic> values, {
    required String selectKey,
    required String childKey,
    String otherValue = 'otro',
  }) {
    final selected = stringValue(values, selectKey);
    if (selected == otherValue) {
      return stringValue(values, childKey);
    }
    return selected;
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0;
    if (value is num) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0;
  }
}
