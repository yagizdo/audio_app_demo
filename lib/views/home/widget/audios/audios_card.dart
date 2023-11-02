import 'package:audio_app_demo/widgets/main_widgets/tap_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/audio/audio_model.dart';

class AudiosCard extends StatelessWidget {
  const AudiosCard({super.key, required this.audio});

  final AudioModel audio;

  @override
  Widget build(BuildContext context) {
    return TapWrapper(
      onTap: () {
        context.push('/player', extra: {'audios': [audio], 'initialIndex': 0});
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
