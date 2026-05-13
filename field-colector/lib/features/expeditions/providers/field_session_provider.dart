import 'package:flutter/foundation.dart';

/// Activa modo campo: UI muestra acceso a formulario de registro en dashboard.
class FieldSessionProvider extends ChangeNotifier {
  bool _fieldModeActive = false;
  int _enterFieldEpoch = 0;
  bool _pendingDashboardHome = false;

  bool get fieldModeActive => _fieldModeActive;

  /// Se incrementa en cada `enterFieldMode()` para que listas/detalle reseteen.
  int get enterFieldEpoch => _enterFieldEpoch;

  void enterFieldMode() {
    _fieldModeActive = true;
    _enterFieldEpoch++;
    _pendingDashboardHome = true;
    notifyListeners();
  }

  /// Una sola vez tras `enterFieldMode()`: dashboard vuelve a inicio y cierra panel.
  bool takePendingDashboardHome() {
    if (!_pendingDashboardHome) return false;
    _pendingDashboardHome = false;
    return true;
  }
}
