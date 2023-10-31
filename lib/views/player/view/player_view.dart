import 'package:audio_app_demo/views/player/widget/audio_media.dart';
import 'package:audio_app_demo/views/player/widget/audio_progress_controls.dart';
import 'package:audio_app_demo/widgets/main_widgets/main_layout.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/app_locator.dart';
import '../controller/player_controller.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(content: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    final playerViewModel = getIt<PlayerController>();
    playerViewModel.load("https://Hippopcharts.com/music/uploads/2023/06/Elton_John_-_I_m_Still_Standing-Hippopcharts.com.mp3").then((value) => playerViewModel.play());

    return const Column(
      children: [
        AudioMedia(),
        AudioProgressControls(),
      ],
    );


  }
}
