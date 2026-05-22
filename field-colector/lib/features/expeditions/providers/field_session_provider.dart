import 'package:field_colector/domain/ports/outing_local_port.dart';
import 'package:flutter/foundation.dart';

/// Activa modo campo: UI muestra acceso a formulario de registro en dashboard.
class FieldSessionProvider extends ChangeNotifier {
  FieldSessionProvider({required OutingLocalPort outingLocal})
      : _outingLocal = outingLocal;

  final OutingLocalPort _outingLocal;

  bool _fieldModeActive = false;
  String? _activeOutingId;
  int _enterFieldEpoch = 0;
  bool _pendingDashboardHome = false;

  bool get fieldModeActive => _fieldModeActive;

  /// Expedición activa al pulsar "En campo"; usada al guardar registros.
  String? get activeOutingId => _activeOutingId;

  /// Se incrementa en cada `enterFieldMode()` para que listas/detalle reseteen.
  int get enterFieldEpoch => _enterFieldEpoch;

  /// Activa modo campo solo si [userId] es dueño o participante de la expedición.
  Future<bool> enterFieldMode({
    required String outingId,
    required String userId,
  }) async {
    if (userId.isEmpty) return false;

    final outing = await _outingLocal.getOutingById(outingId);
    if (outing == null || !outing.isMember(userId)) return false;

    _fieldModeActive = true;
    _activeOutingId = outingId;
    _enterFieldEpoch++;
    _pendingDashboardHome = true;
    notifyListeners();
    return true;
  }

  void exitFieldMode() {
    _fieldModeActive = false;
    _activeOutingId = null;
    notifyListeners();
  }

  /// Una sola vez tras `enterFieldMode()`: dashboard vuelve a inicio y cierra panel.
  bool takePendingDashboardHome() {
    if (!_pendingDashboardHome) return false;
    _pendingDashboardHome = false;
    return true;
  }
}
