import 'package:audio_app_demo/utils/app_locator.dart';
import 'package:audio_app_demo/views/player/controller/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

import 'media_metadata.dart';

class AudioMedia extends StatelessWidget {
  const AudioMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    final PlayerController playerController = getIt<PlayerController>();
    return StreamBuilder<SequenceState?>(
      stream: playerController.sequenceStateStream,
      builder: (context, state) {
        final stateD = state.data;
        if (stateD?.sequence.isEmpty ?? true) {
          print('empty');
          return const SizedBox.shrink();
        };
        final metadata = stateD!.currentSource!.tag as MediaItem;
        return MediaMetadata(
          title: metadata.title,
          artist: metadata.artist ?? "Unknown",
          imageUrl: metadata.artUri.toString(),
        );
      },
    );
  }
}