import 'dart:async';


import 'package:flutter/material.dart';

import '../../../utils/app_locator.dart';
import '../../../utils/enums/network_result.dart';
import 'network_manager.dart';

class NetworkProvider extends ChangeNotifier {
  final NetworkManager _networkManager = getIt<NetworkManager>();
  final _networkStatusController = StreamController<bool>.broadcast();
  Stream<bool> get networkStatusStream => _networkStatusController.stream;

  NetworkProvider() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      _checkNetworkStatus();
    });
  }

  void _checkNetworkStatus() async {
    _networkManager.handleNetworkChange((result) {
      if (result == NetworkResult.on) {
        _networkStatusController.sink.add(true);
      } else {
        _networkStatusController.sink.add(false);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _networkStatusController.close();
  }
}