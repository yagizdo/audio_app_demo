import 'package:audio_app_demo/views/player/widget/audio_media.dart';
import 'package:audio_app_demo/views/player/widget/audio_progress_controls.dart';
import 'package:audio_app_demo/widgets/main_widgets/main_layout.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/audio/audio_model.dart';
import '../../../utils/app_locator.dart';
import '../controller/player_controller.dart';

class PlayerView extends StatefulWidget {
  const PlayerView({super.key, this.audios});

  final List<AudioModel>? audios;

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  late final PlayerController playerController;

  @override
  void initState() {
    super.initState();
    playerController = getIt<PlayerController>();
    playerController.load("");
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(content: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return const Column(
      children: [
        AudioMedia(),
        AudioProgressControls(),
      ],
    );


  }
}
