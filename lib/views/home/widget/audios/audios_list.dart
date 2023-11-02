import 'package:audio_app_demo/views/home/widget/audios/audios_card.dart';
import 'package:flutter/material.dart';

import '../../../../models/audio/audio_model.dart';

class AudiosList extends StatelessWidget {
  const AudiosList({super.key, required this.audios});

  final List<AudioModel> audios;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: audios.length,
      itemBuilder: (context, index) {
        final audio = audios[index];
        return AudiosCard(audio: audio);
      },
    );
  }
}
