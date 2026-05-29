/// Estado de la descarga offline de una expedición.
enum OfflinePinState {
  /// Descargando datos (outing + registros).
  downloading,

  /// Descarga completada con éxito.
  done,

  /// Error durante la descarga.
  error,
}

/// Progreso de pin/unpin de una expedición para uso offline.
class OfflinePinProgress {
  const OfflinePinProgress({
    required this.outingId,
    required this.state,
    this.message,
  });

  final String outingId;
  final OfflinePinState state;
  final String? message;
}
