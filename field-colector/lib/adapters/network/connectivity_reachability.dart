import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:field_colector/domain/ports/network_reachability.dart';

class ConnectivityReachability implements NetworkReachability {
  ConnectivityReachability([Connectivity? connectivity])
      : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;

  static bool _resultsOnline(List<ConnectivityResult> results) {
    return results.any((r) => r != ConnectivityResult.none);
  }

  @override
  Stream<bool> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged.map(_resultsOnline);

  @override
  Future<bool> hasConnectivityNow() async {
    final r = await _connectivity.checkConnectivity();
    return _resultsOnline(r);
  }
}
