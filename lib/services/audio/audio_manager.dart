import 'package:audio_app_demo/services/audio/i_audio_manager.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class AudioManager extends IAudioManager {

  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Future<void> init() async {
    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.yagizdo.audio_app_demo.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    );
  }

  @override
  Future<Duration> load(String url) async {
    final source = AudioSource.uri(
      Uri.parse(url),
      tag: MediaItem(
        id: url,
        title: 'Tristram = Diablo',
        artUri:
            Uri.parse('https://i.ytimg.com/vi/Gki_L-8v_24/maxresdefault.jpg'),
      ),
    );

    return await _audioPlayer.setAudioSource(source) ?? Duration.zero;
  }

  @override
  Future<void> play() async {
    await _audioPlayer.play();
  }

  @override
  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  @override
  Future<void> seekTo(Duration position) async {
    await _audioPlayer.seek(position);
  }

  @override
  Stream<Duration> get position => _audioPlayer.positionStream;

  @override
  Stream<Duration> get totalDuration =>
      _audioPlayer.durationStream.map((duration) => duration ?? Duration.zero);

  @override
  Future<void> dispose() {
    return _audioPlayer.dispose();
  }
}
