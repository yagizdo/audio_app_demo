import 'package:audio_app_demo/models/audio_cache_info/audio_cache_info.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mobx/mobx.dart';

import '../../../models/position_data.dart';
import '../../../services/audio/audio_manager.dart';
import '../../../services/core/cache_manager.dart';
import '../../../utils/app_locator.dart';

part 'player_controller.g.dart';

class PlayerController = PlayerControllerBase with _$PlayerController;

abstract class PlayerControllerBase with Store {

  PlayerControllerBase() {
    positionStream = _audioManager.position.asBroadcastStream();
    bufferedPositionStream = _audioManager.bufferedPosition.asBroadcastStream();
    totalDurationStream = _audioManager.totalDuration.asBroadcastStream();
    playerStateStream = _audioManager.playerState.asBroadcastStream();
    positionDataStream = _audioManager.positionDataStream.asBroadcastStream();
    sequenceStateStream = _audioManager.sequenceStateStream.asBroadcastStream();
  }

  final AudioManager _audioManager = getIt<AudioManager>();
  final CacheManager _cacheManager = getIt<CacheManager>();

  @observable
  Stream<Duration>? positionStream;

  @observable
  Stream<PositionData>? positionDataStream;

  @observable
  Stream<Duration>? bufferedPositionStream;

  @observable
  Stream<Duration>? totalDurationStream;

  @observable
  Stream<PlayerState>? playerStateStream;

  @observable
  Stream<SequenceState?>? sequenceStateStream;

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
  Future<void> saveAudioCache(String audioName, int currentPosition) async {
    await _cacheManager.saveAudioCache(audioName, currentPosition);
  }

  @action
  Future<Duration?> getAudioCache(String audioName) async {
    return await _cacheManager.getAudioCache(audioName);
  }

  @action
  Future<void> dispose() async {
    await _audioManager.dispose();
  }
}
