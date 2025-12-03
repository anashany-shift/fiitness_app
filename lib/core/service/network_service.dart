import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@injectable
class NetworkService {
  final Connectivity _connectivity = Connectivity();
  late final StreamSubscription _subscription;

 void listenConnection(void Function(bool isOnline) onStatusChange) {
  _subscription = _connectivity.onConnectivityChanged.listen((results) {
    final isOnline = results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.ethernet);

    onStatusChange(isOnline);
  });
}


  void dispose() {
    _subscription.cancel();
  }
}
