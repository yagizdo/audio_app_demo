import 'package:audio_app_demo/utils/app_locator.dart';
import 'package:audio_app_demo/views/player/controller/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:headset_connection_event/headset_event.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mobx/mobx.dart';

class AudioControls extends StatefulWidget {
  const AudioControls(
      {super.key, required this.totalDuration, required this.currentPosition});

  final Duration totalDuration;
  final Duration currentPosition;

  @override
  State<AudioControls> createState() => _AudioControlsState();
}

class _AudioControlsState extends State<AudioControls> {
  late final HeadsetEvent _headsetEvent;
  late final PlayerController playerController;


  @override
  void initState() {
    super.initState();
    playerController = getIt<PlayerController>();
    _headsetEvent = HeadsetEvent();
    _headsetEvent.getCurrentState.then((value) {
      playerController.setHeadsetState(value ?? HeadsetState.DISCONNECT);
    });
    _headsetEvent.setListener((value) {
      playerController.setHeadsetState(value);
    });
  }
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(context) {
    return Observer(
      builder: (_) {
        return StreamBuilder<PlayerState>(
          stream: playerController.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (!(playing ?? false)) {
              return _buildButtonsRow(playing ?? false, () {
                if (playerController.headsetState != HeadsetState.DISCONNECT) {
                  playerController.play();
                }
              });
            } else if (processingState != ProcessingState.completed) {
              return _buildButtonsRow(playing ?? false, () {
                playerController.pause();
              });
            }
            return _buildButtonsRow(playing ?? false, () {
              if (playerController.headsetState != HeadsetState.DISCONNECT) {
                playerController.seekTo(Duration.zero);
                playerController.play();
              }
            });
          },
        );
      }
    );
  }

  Widget _buildButtonsRow(bool isPlaying, Function onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildBackwardsForwards(false),
        _buildPlayButton(
          playing: isPlaying,
          onPressed: onPressed,
        ),
        _buildBackwardsForwards(true),
      ],
    );
  }

  Widget _buildBackwardsForwards(bool isForward) {
    const int skipDurationSeconds = 10;
    final PlayerController playerController = getIt<PlayerController>();

    Duration targetPosition;

    if (isForward) {
      targetPosition =
          widget.currentPosition + const Duration(seconds: skipDurationSeconds);

      // Eğer ileri alma sonunda sesin sonuna ulaşıldıysa, targetPosition'ı sona getir.
      if (targetPosition >= widget.totalDuration) {
        targetPosition = widget.totalDuration;
      }
    } else {
      targetPosition =
          widget.currentPosition - const Duration(seconds: skipDurationSeconds);

      // Eğer geri alma sonunda sesin başına ulaşıldıysa, targetPosition'ı başa getir.
      if (targetPosition < Duration.zero) {
        targetPosition = Duration.zero;
      }
    }

    return IconButton(
      onPressed: () {
        playerController.seekTo(targetPosition);
      },
      icon: isForward
          ? const Icon(Icons.forward_10)
          : const Icon(Icons.replay_10),
      iconSize: 80,
      color: Colors.white,
    );
  }

  Widget _buildPlayButton(
      {required bool playing, required Function onPressed}) {
    return IconButton(
      onPressed: () {
        onPressed();
      },
      icon: playing ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
      iconSize: 80,
      color: Colors.white,
    );
  }
}
