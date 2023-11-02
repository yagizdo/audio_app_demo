import 'package:audio_app_demo/views/player/widget/audio_media.dart';
import 'package:audio_app_demo/views/player/widget/audio_progress_controls.dart';
import 'package:audio_app_demo/widgets/main_widgets/main_layout.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/audio/audio_model.dart';
import '../../../utils/app_locator.dart';
import '../controller/player_controller.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({super.key, this.audios, this.initialIndex});

  final List<AudioModel>? audios;
  final int? initialIndex;

  @override
  Widget build(BuildContext context) {
    return MainLayout(content: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    final playerViewModel = getIt<PlayerController>();
    playerViewModel.load("");

    return const Column(
      children: [
        AudioMedia(),
        AudioProgressControls(),
      ],
    );


  }
}
