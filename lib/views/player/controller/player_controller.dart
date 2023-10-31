import 'package:just_audio/just_audio.dart';
import 'package:mobx/mobx.dart';

import '../../../models/position_data.dart';
import '../../../services/audio/audio_manager.dart';
import '../../../utils/app_locator.dart';

part 'player_controller.g.dart';

class PlayerController = PlayerControllerBase with _$PlayerController;

abstract class PlayerControllerBase with Store {

  PlayerControllerBase() {
    positionStream = _audioManager.position.asObservable();
    bufferedPositionStream = _audioManager.bufferedPosition.asObservable();
    totalDurationStream = _audioManager.totalDuration.asObservable();
    playerStateStream = _audioManager.playerState.asObservable();
    positionDataStream = _audioManager.positionDataStream.asBroadcastStream();
    sequenceStateStream = _audioManager.sequenceStateStream.asObservable();
  }

  final AudioManager _audioManager = getIt<AudioManager>();

  @observable
  ObservableStream<Duration>? positionStream;

  @observable
  Stream<PositionData>? positionDataStream;

  @observable
  ObservableStream<Duration>? bufferedPositionStream;

  @observable
  ObservableStream<Duration>? totalDurationStream;

  @observable
  ObservableStream<PlayerState>? playerStateStream;

  @observable
  ObservableStream<SequenceState?>? sequenceStateStream;

  @observable
  Duration totalDuration = Duration.zero;

  @action
  Future<void> init() async {
    await _audioManager.init();
  }

  @action
  Future<void> load(String url) async {
    totalDuration = await _audioManager.load(url);
  }

  @action
  Future<void> play() async {
    await _audioManager.play();
  }

  @action
  Future<void> pause() async {
    await _audioManager.pause();
  }

  @action
  Future<void> seekTo(Duration position) async {
    await _audioManager.seekTo(position);
  }

  @action
  Future<void> dispose() async {
    await _audioManager.dispose();
  }
}
