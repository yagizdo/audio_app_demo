import 'package:audio_app_demo/utils/app_locator.dart';
import 'package:audio_app_demo/views/player/controller/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';


class AudioControls extends StatelessWidget {
  const AudioControls({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(context) {
    final PlayerController playerController = getIt<PlayerController>();
    return StreamBuilder<PlayerState>(
      stream: playerController.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (!(playing ?? false)) {
          return _buildButtonsRow(playing ?? false, (){
            playerController.play();
          });
        } else if (processingState != ProcessingState.completed) {
          return _buildButtonsRow(playing ?? false, (){
            playerController.pause();
          });
        }
        return _buildButtonsRow(playing ?? false, (){
          playerController.seekTo(Duration.zero);
          playerController.play();
        });
      },
    );
  }

  Widget _buildButtonsRow(bool isPlaying, Function onPressed) {
    final PlayerController playerController = getIt<PlayerController>();
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
    const int skipDurationSeconds = 15;
    final PlayerController playerController = getIt<PlayerController>();
    return IconButton(
      onPressed: () {

      },
      icon: isForward ? const Icon(Icons.forward_10) : const Icon(Icons.replay_10),
      iconSize: 80,
      color: Colors.white,
    );
  }

  Widget _buildPlayButton({required bool playing, required Function onPressed}) {
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
