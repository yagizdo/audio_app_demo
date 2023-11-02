import 'package:flutter/material.dart';

import '../../../../models/audio/audio_model.dart';

class AudiosCard extends StatelessWidget {
  const AudiosCard({super.key, required this.audio});

  final AudioModel audio;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: _buildPlayButton(),
        title: Text(audio.title),
        subtitle: Text(audio.artist),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }

  Widget _buildPlayButton() {
    return IconButton(
      icon: const Icon(Icons.play_arrow),
      onPressed: () {},
    );
  }
}
