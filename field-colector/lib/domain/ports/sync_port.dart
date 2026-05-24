abstract class SyncPort {
  /// Sincroniza todos los registros pendientes cuando hay conectividad.
  /// Orden: primero outings, luego registros, luego fotos huérfanas.
  Future<SyncResult> syncPendingData();

  Future<bool> hasPendingSync();

  Future<SyncPendingSummary> getPendingSummary();

  Stream<SyncProgress> get syncProgress;
}

class SyncPendingSummary {
  final int pendingRecords;
  final int pendingPhotos;
  final int pendingOutings;

  const SyncPendingSummary({
    required this.pendingRecords,
    required this.pendingPhotos,
    required this.pendingOutings,
  });

  int get total => pendingRecords + pendingPhotos + pendingOutings;

  bool get hasPending => total > 0;
}

class SyncResult {
  final int synced;
  final int failed;
  final List<String> errors;

  const SyncResult({
    required this.synced,
    required this.failed,
    required this.errors,
  });
}

class SyncProgress {
  final int total;
  final int completed;
  final String currentItem;

  const SyncProgress({
    required this.total,
    required this.completed,
    required this.currentItem,
  });
}
