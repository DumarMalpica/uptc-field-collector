import 'dart:async';

import 'package:field_colector/core/database/offline_pin_store.dart';
import 'package:field_colector/core/services/expedition_sync_service.dart';
import 'package:field_colector/core/services/record_local_persistence.dart';
import 'package:field_colector/core/services/record_sync_service.dart';
import 'package:field_colector/domain/entities/offline_pin_progress.dart';
import 'package:field_colector/domain/ports/network_reachability.dart';
import 'package:flutter/foundation.dart';

/// Orquesta el pin/unpin de expediciones para uso offline.
///
/// - **Pin**: persiste el ID, descarga outing + registros de los 6 módulos.
/// - **Unpin**: quita el ID, borra registros synced de esa expedición.
/// - **pinnedIds**: conjunto en memoria (cargado una vez desde disco).
class OfflineExpeditionService {
  OfflineExpeditionService({
    required OfflinePinStore pinStore,
    required ExpeditionSyncService expeditionSync,
    required RecordSyncService recordSync,
    required RecordLocalPersistence recordPersistence,
    required NetworkReachability reachability,
  })  : _pinStore = pinStore,
        _expeditionSync = expeditionSync,
        _recordSync = recordSync,
        _recordPersistence = recordPersistence,
        _reachability = reachability;

  final OfflinePinStore _pinStore;
  final ExpeditionSyncService _expeditionSync;
  final RecordSyncService _recordSync;
  final RecordLocalPersistence _recordPersistence;
  final NetworkReachability _reachability;

  Set<String> _pinnedIds = {};
  bool _initialized = false;

  final _progressController =
      StreamController<OfflinePinProgress>.broadcast();

  /// IDs actualmente pinned (cacheados en memoria tras [init]).
  Set<String> get pinnedIds => Set.unmodifiable(_pinnedIds);

  /// Stream de progreso para la UI (descargando, listo, error).
  Stream<OfflinePinProgress> get progress => _progressController.stream;

  /// Carga inicial desde disco. Llamar una vez al arrancar la app.
  Future<void> init() async {
    if (_initialized) return;
    _pinnedIds = await _pinStore.load();
    _initialized = true;
    debugPrint('[OfflinePin] Loaded ${_pinnedIds.length} pinned expeditions');
  }

  /// Marca una expedición para uso offline.
  ///
  /// 1. Persiste el ID en disco.
  /// 2. Si hay red, descarga outing actualizado + registros de los 6 módulos.
  /// 3. Si no hay red, solo persiste el ID (se descargará cuando haya red).
  Future<void> pinExpedition(String outingId) async {
    _pinnedIds.add(outingId);
    await _pinStore.addPin(outingId);

    _progressController.add(OfflinePinProgress(
      outingId: outingId,
      state: OfflinePinState.downloading,
      message: 'Descargando expedición...',
    ));

    try {
      if (await _reachability.hasConnectivityNow()) {
        // Descargar outing actualizado
        await _expeditionSync.syncOutingById(outingId);

        // Descargar todos los registros de la expedición
        await _recordSync.syncRecordsForOuting(outingId);
      } else {
        debugPrint(
          '[OfflinePin] Offline — pin saved, will download later',
        );
      }

      _progressController.add(OfflinePinProgress(
        outingId: outingId,
        state: OfflinePinState.done,
        message: 'Expedición disponible offline',
      ));
    } catch (e) {
      debugPrint('[OfflinePin] pinExpedition error: $e');
      _progressController.add(OfflinePinProgress(
        outingId: outingId,
        state: OfflinePinState.error,
        message: 'Error al descargar: $e',
      ));
    }
  }

  /// Desmarca una expedición y limpia datos locales.
  ///
  /// Borra registros con `syncStatus = 'synced'` de esa expedición.
  /// **NO** borra registros con `syncStatus = 'pending'` o `'error'`
  /// para no perder trabajo offline del usuario.
  Future<void> unpinExpedition(String outingId) async {
    _pinnedIds.remove(outingId);
    await _pinStore.removePin(outingId);

    try {
      // Borrar registros synced de los 6 módulos
      await _recordPersistence.deleteSyncedRecordsForOuting(outingId);

      // Si la expedición NO tiene registros pending y NO hay red,
      // podríamos borrar también el outing de Isar.
      // Pero lo dejamos para que se limpie naturalmente en el próximo sync.
      debugPrint(
        '[OfflinePin] Unpinned $outingId, synced records cleaned',
      );
    } catch (e) {
      debugPrint('[OfflinePin] unpinExpedition error: $e');
    }
  }

  /// Comprueba si un outing está pinned.
  bool isPinned(String outingId) => _pinnedIds.contains(outingId);

  /// Re-sincroniza todas las expediciones pinned con el servidor.
  ///
  /// Llamar cuando el dispositivo recupera conectividad para:
  /// - Descargar outings/registros que se marcaron estando offline.
  /// - Traer registros nuevos que otros usuarios subieron mientras estábamos sin red.
  Future<void> syncPendingPins() async {
    if (!await _reachability.hasConnectivityNow()) return;
    if (_pinnedIds.isEmpty) return;

    debugPrint(
      '[OfflinePin] Syncing ${_pinnedIds.length} pinned expeditions...',
    );

    for (final outingId in _pinnedIds.toList()) {
      try {
        // Actualizar metadata del outing
        await _expeditionSync.syncOutingById(outingId);

        // Descargar registros nuevos (upsert no pisa pending/error)
        await _recordSync.syncRecordsForOuting(outingId);
      } catch (e) {
        debugPrint('[OfflinePin] syncPendingPins error for $outingId: $e');
      }
    }

    debugPrint('[OfflinePin] Sync of pinned expeditions complete');
  }

  void dispose() {
    _progressController.close();
  }
}
