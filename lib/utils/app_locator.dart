import 'package:get_it/get_it.dart';

import '../services/core/network/network_manager.dart';

final GetIt getIt = GetIt.instance;

void setup() {

  // Network Manager
  getIt.registerLazySingleton(() => NetworkManager());
}