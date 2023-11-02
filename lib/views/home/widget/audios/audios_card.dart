import 'package:audio_app_demo/widgets/main_widgets/tap_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/audio/audio_model.dart';
import '../../../../utils/app_locator.dart';
import '../../../player/controller/player_controller.dart';

class AudiosCard extends StatelessWidget {
  const AudiosCard({super.key, required this.audio, required this.index});

  final AudioModel audio;
  final int index;

  @override
  Widget build(BuildContext context) {
    final playerViewModel = getIt<PlayerController>();

    return TapWrapper(
      onTap: () {
        playerViewModel.setSelectedIndex(index);
        context.push('/player', extra: {'audios': [audio]});
      },
      child: Card(
        child: ListTile(
          leading: _buildPlayButton(),
          title: Text(audio.title),
          subtitle: Text(audio.artist),
          trailing: const Icon(Icons.more_vert),
        ),
      ),
    );
  }

  Widget _buildPlayButton() {
    return const Icon(Icons.play_arrow, size: 35);
  }
}
