import 'package:audio_app_demo/widgets/main_widgets/main_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

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
    playerViewModel.load("https://ia601802.us.archive.org/8/items/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3").then((value) => playerViewModel.play());
    Duration? lastPosition;

    return StreamBuilder<Duration>(
      stream: playerViewModel.positionStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final currentPosition = snapshot.data;

          if (currentPosition != lastPosition) {
            final seconds = currentPosition?.inSeconds;
            print('Current Position in seconds: $seconds');
            lastPosition = currentPosition;
          }

          return Text('Player View');
        } else {
          return Text('Player View');
        }
      },
    );


  }
}
