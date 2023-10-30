import 'package:just_audio/just_audio.dart';

abstract class IAudioManager {
  Future<void> init();
  Future<Duration> load(String url);
  Future<void> play();
  Future<void> pause();
  Future<void> seekTo(Duration position);
  Stream<Duration> get position;
  Stream<Duration> get bufferedPosition;
  Stream<Duration> get totalDuration;
  Stream<PlayerState> get playerState;
  Future<void> dispose();
}