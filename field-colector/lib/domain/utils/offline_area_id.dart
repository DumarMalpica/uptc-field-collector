import 'dart:math';

/// Generador de IDs únicos para áreas offline (hasta que Isar asigne IDs propios).
String generateOfflineAreaId() {
  final t = DateTime.now().microsecondsSinceEpoch;
  final r = Random().nextInt(0x1000000);
  return 'offline_${t}_$r';
}
