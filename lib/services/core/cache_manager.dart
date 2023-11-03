import 'package:hive_flutter/adapters.dart';


class CacheManager {
  static final CacheManager _instance = CacheManager._internal();
  factory CacheManager() => _instance;

  CacheManager._internal();

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<int>('audioCache');
  }

  Future<void> saveAudioCache(String audioName, int currentPosition) async {
    final boxSave = await Hive.openBox<int>('audioCache');
    await boxSave.put(audioName, currentPosition);
  }

  Future<Duration> getAudioCache(String audioName) async {
    final boxSave = await Hive.openBox<int>('audioCache');
    return Duration(seconds: boxSave.get(audioName) ?? 0);
  }
}