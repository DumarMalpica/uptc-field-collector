import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../domain/ports/sync_port.dart';
import 'offline_expedition_service.dart';

/// Escucha cambios de conectividad y dispara sincronización automática.
/// registrarse en main.dart y llamar startListening() al iniciar la app.
class ConnectivitySyncService {
  final SyncPort _syncService;
  final OfflineExpeditionService? _offlineExpeditionService;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  ConnectivitySyncService(
    this._syncService, {
    OfflineExpeditionService? offlineExpeditionService,
  }) : _offlineExpeditionService = offlineExpeditionService;

  void startListening() {
    _subscription =
        Connectivity().onConnectivityChanged.listen((results) async {
      final hasConnection =
          results.any((r) => r != ConnectivityResult.none);
      if (hasConnection) {
        // 1. Subir datos pendientes (registros creados offline → Firestore)
        final hasPending = await _syncService.hasPendingSync();
        if (hasPending) {
          await _syncService.syncPendingData();
        }

        // 2. Actualizar expediciones pinned (traer registros nuevos de otros)
        await _offlineExpeditionService?.syncPendingPins();
      }
    });
  }

  void stopListening() => _subscription?.cancel();
}
