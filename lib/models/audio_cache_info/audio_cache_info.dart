import 'package:hive/hive.dart';

part 'audio_cache_info.g.dart';

@HiveType(typeId: 0)
class AudioCacheInfo {
  @HiveField(0)
  final String audioName;

  @HiveField(1)
  final int currentPositionInSeconds;

  AudioCacheInfo(this.audioName, this.currentPositionInSeconds);
}
