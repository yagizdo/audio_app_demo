import 'package:get_it/get_it.dart';

import '../services/audio/audio_manager.dart';
import '../services/core/network/network_manager.dart';
import '../views/player/controller/player_controller.dart';

final GetIt getIt = GetIt.instance;

void setup() {

  // Network Manager
  getIt.registerLazySingleton(() => NetworkManager());

  // Audio Manager
  getIt.registerLazySingleton(() => AudioManager());

  // Player View Model
  getIt.registerLazySingleton(() => PlayerController());
}