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
          return IconButton(
            onPressed: () {
              playerController.play();
            },
            icon: const Icon(Icons.play_arrow),
            iconSize: 80,
            color: Colors.white,
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            onPressed: () {
              playerController.pause();
            },
            icon: const Icon(Icons.pause),
            iconSize: 80,
            color: Colors.white,
          );
        }
        return IconButton(
          onPressed: () {
            playerController.seekTo(Duration.zero);
            playerController.play();
          },
          icon: const Icon(Icons.play_arrow),
          iconSize: 80,
          color: Colors.white,
        );
      },
    );
  }
}
