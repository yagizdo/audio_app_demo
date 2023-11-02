import 'package:audio_app_demo/services/audio/i_audio_manager.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';

import '../../models/audio/audio_model.dart';
import '../../models/position_data.dart';

class AudioManager extends IAudioManager {

  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Future<void> init() async {
    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.yagizdo.audio_app_demo.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      rewindInterval: const Duration(seconds: 15),
      fastForwardInterval: const Duration(seconds: 15),
      androidNotificationOngoing: true,
    );
  }

  @override
  Future<Duration> load(
      {String? url,
      List<AudioModel>? audios,
      bool? isPlaylist,
      Duration? initialPosition,
      int? initialIndex}) async {
    Duration duration = Duration.zero;
    isPlaylist = isPlaylist ?? false;
    if (isPlaylist) {
      if (audios != null) {
        List<AudioSource> audioSources = audios.map((e) => AudioSource.uri(
          Uri.parse(e.url),
          tag: MediaItem(
            id: e.id,
            title: e.title,
            artUri: Uri.parse(e.artUri),
          ),
        )).toList();
        final playlist = ConcatenatingAudioSource(
          children: audioSources,
        );

        duration = await _audioPlayer.setAudioSource(playlist, initialPosition: initialPosition, initialIndex: initialIndex ?? 0, preload: true) ?? Duration.zero;
      }

    } else {
      if (url != null) {
        final source = AudioSource.uri(
          Uri.parse(url),
          tag: MediaItem(
            id: url,
            title: 'Tristram = Diablo',
            artUri:
            Uri.parse('https://i.ytimg.com/vi/Gki_L-8v_24/maxresdefault.jpg'),
          ),
        );
        duration = await _audioPlayer.setAudioSource(source, initialPosition: initialPosition, preload: true) ?? Duration.zero;
      }
    }

    return duration;
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
  Stream<PositionData> get positionDataStream => Rx.combineLatest3<Duration, Duration, Duration?, PositionData> (
    _audioPlayer.positionStream,
    _audioPlayer.bufferedPositionStream,
    _audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(position, bufferedPosition, duration ?? Duration.zero),
  );

  @override
  Stream<Duration> get position => _audioPlayer.positionStream;

  @override
  Stream<Duration> get bufferedPosition => _audioPlayer.bufferedPositionStream;

  @override
  Stream<Duration> get totalDuration =>
      _audioPlayer.durationStream.map((duration) => duration ?? Duration.zero);

  @override
  Stream<SequenceState?> get sequenceStateStream => _audioPlayer.sequenceStateStream;

  @override
  Stream<PlayerState> get playerState => _audioPlayer.playerStateStream;

  @override
  Future<void> dispose() async {
    await _audioPlayer.stop();
    //await _audioPlayer.dispose();
  }
}
