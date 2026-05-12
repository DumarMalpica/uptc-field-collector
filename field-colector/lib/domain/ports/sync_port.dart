abstract class SyncPort {
  /// Sincroniza todos los registros pendientes cuando hay conectividad.
  /// Orden: primero outings, luego registros, luego fotos.
  Future<SyncResult> syncPendingData();

  Future<bool> hasPendingSync();

  Stream<SyncProgress> get syncProgress;
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
