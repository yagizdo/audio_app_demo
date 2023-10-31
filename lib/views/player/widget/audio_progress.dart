import 'package:audio_app_demo/models/position_data.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_locator.dart';
import '../controller/player_controller.dart';

class AudioProgress extends StatefulWidget {

  const AudioProgress({super.key});

  @override
  State<AudioProgress> createState() => _AudioProgressState();
}

class _AudioProgressState extends State<AudioProgress> {
  late final PlayerController playerController;

  @override
  void initState() {
    super.initState();
    playerController = getIt<PlayerController>();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(context) {
    return StreamBuilder<PositionData>(
      stream: playerController.positionDataStream,
      builder: (context, state) {
        return Column(
          children: [
            _buildProgressBar(state),
          ],
        );
      }
    );
  }

  Widget _buildProgressBar(AsyncSnapshot<PositionData> state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: ProgressBar(
        progress: state.hasData ? state.data!.position : Duration.zero,
        buffered: state.hasData ? state.data!.bufferedPosition : Duration.zero,
        total: state.hasData ? state.data!.duration : Duration.zero,
        onSeek: (duration) {
          playerController.seekTo(duration);
        },
        timeLabelLocation: TimeLabelLocation.above,
        timeLabelType: TimeLabelType.totalTime,
        timeLabelTextStyle: const TextStyle(color: Colors.white),
        thumbColor: Colors.white,
        barHeight: 2,
        baseBarColor: Colors.white.withOpacity(0.24),
        bufferedBarColor: Colors.white.withOpacity(0.24),
        progressBarColor: Colors.white,
      ),
    );
  }
}
