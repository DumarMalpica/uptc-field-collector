/// Indica si el dispositivo tiene ruta de red (no garantiza llegar a un host concreto).
abstract class NetworkReachability {
  Stream<bool> get onConnectivityChanged;

  Future<bool> hasConnectivityNow();
}
