import 'package:audio_app_demo/models/position_data.dart';
import 'package:just_audio/just_audio.dart';

import '../../models/audio/audio_model.dart';

abstract class IAudioManager {
  Future<void> init();
  Future<Duration> load(
      {String? url,
      List<AudioModel>? audios,
      bool? isPlaylist,
      Duration? initialPosition,
      int? initialIndex});
  Future<void> play();
  Future<void> pause();
  Future<void> seekTo(Duration position);
  Stream<PositionData> get positionDataStream;
  Stream<SequenceState?> get sequenceStateStream;
  Stream<Duration> get position;
  Stream<Duration> get bufferedPosition;
  Stream<Duration> get totalDuration;
  Stream<PlayerState> get playerState;
  Future<void> dispose();
}