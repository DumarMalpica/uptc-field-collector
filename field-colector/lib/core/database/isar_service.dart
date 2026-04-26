import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../adapters/real/user_model.dart';

/// Servicio singleton que gestiona la instancia de Isar.
///
/// Solo los adaptadores reales deben importar este servicio.
/// La UI y el dominio nunca lo conocen.
class IsarService {
  static Isar? _instance;

  /// Retorna la instancia abierta de Isar.
  /// Si no existe, la crea y la abre con los schemas registrados.
  static Future<Isar> getInstance() async {
    if (_instance != null && _instance!.isOpen) return _instance!;

    final dir = await getApplicationDocumentsDirectory();

    _instance = await Isar.open(
      [UserModelSchema],
      directory: dir.path,
      name: 'citesa_field_collector',
    );

    return _instance!;
  }

  /// Cierra la instancia si está abierta.
  /// Usar solo en tests o al hacer logout total del dispositivo.
  static Future<void> close() async {
    if (_instance != null && _instance!.isOpen) {
      await _instance!.close();
      _instance = null;
    }
  }
}