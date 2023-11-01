import 'package:hive_flutter/adapters.dart';

import '../../models/audio_cache_info/audio_cache_info.dart';

class CacheManager {
  static final CacheManager _instance = CacheManager._internal();
  factory CacheManager() => _instance;

  CacheManager._internal();

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AudioCacheInfoAdapter());
    await Hive.openBox<AudioCacheInfo>('audioCache');
  }

  Future<void> saveAudioCacheInfo(AudioCacheInfo audioInfo) async {
    final boxSave = await Hive.openBox<AudioCacheInfo>('audioCache');
    await boxSave.put(audioInfo.audioName, audioInfo);
  }

  Future<AudioCacheInfo?> getAudioCacheInfo(String audioName) async {
    final boxSave = await Hive.openBox<AudioCacheInfo>('audioCache');
    return boxSave.get(audioName);
  }
}