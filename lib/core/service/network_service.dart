import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
@injectable
class NetworkService {
  final Connectivity _connectivity = Connectivity();
  late final StreamSubscription _subscription;

  void listenConnection(void Function(bool isOnline) onStatusChange) {
    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        onStatusChange(true);
      } else {
        onStatusChange(false);
      }
    });
  }

  void dispose() {
    _subscription.cancel();
  }
}
