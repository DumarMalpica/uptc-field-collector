import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../domain/ports/sync_port.dart';

/// Escucha cambios de conectividad y dispara sincronización automática.
/// registrarse en main.dart y llamar startListening() al iniciar la app.
class ConnectivitySyncService {
  final SyncPort _syncService;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  ConnectivitySyncService(this._syncService);

  void startListening() {
    _subscription =
        Connectivity().onConnectivityChanged.listen((results) async {
      final hasConnection =
          results.any((r) => r != ConnectivityResult.none);
      if (hasConnection) {
        final hasPending = await _syncService.hasPendingSync();
        if (hasPending) {
          await _syncService.syncPendingData();
        }
      }
    });
  }

  void stopListening() => _subscription?.cancel();
}
