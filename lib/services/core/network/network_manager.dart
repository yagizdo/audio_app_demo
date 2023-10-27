import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../utils/enums/network_result.dart';

typedef NetworkCallback = void Function(NetworkResult result);

class NetworkManager {
  late final InternetConnectionChecker _connectionChecker;
  StreamSubscription<InternetConnectionStatus>? _subscription;

  NetworkManager() {
    _connectionChecker = InternetConnectionChecker.createInstance(
      checkInterval: const Duration(seconds: 1),
      checkTimeout: const Duration(seconds: 5),
    );
  }

  void handleNetworkChange(NetworkCallback onChange) {
    _subscription = _connectionChecker.onStatusChange.listen((event) {
      onChange.call(
        NetworkResult.checkConnectivityResult(event),
      );
    });
  }

  void dispose() {
    _subscription?.cancel();
  }
}