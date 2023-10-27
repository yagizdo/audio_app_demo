abstract class IAudioManager {
  Future<void> init();
  Future<Duration> load(String url);
  Future<void> play();
  Future<void> pause();
  Future<void> seekTo(Duration position);
  Stream<Duration> get position;
  Stream<Duration> get totalDuration;
  Future<void> dispose();
}