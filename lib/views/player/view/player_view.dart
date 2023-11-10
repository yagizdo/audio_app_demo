import 'package:audio_app_demo/views/player/widget/audio_media.dart';
import 'package:audio_app_demo/views/player/widget/audio_progress_controls.dart';
import 'package:audio_app_demo/widgets/main_widgets/main_layout.dart';
import 'package:audio_session/audio_session.dart';
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
  late final AudioSession session;

  @override
  void initState() {
    super.initState();
    playerController = getIt<PlayerController>();
    playerController.load("");
    _initSession();
  }

  Future<void> _initSession() async {
    session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
    session.devicesChangedEventStream.listen((event) {
      final connectedDevices =
          event.devicesAdded.map((device) => device.type).toList();

      if (connectedDevices.contains(AudioDeviceType.builtInEarpiece) ||
          connectedDevices.contains(AudioDeviceType.bluetoothA2dp) ||
          connectedDevices.contains(AudioDeviceType.wiredHeadphones) ||
          connectedDevices.contains(AudioDeviceType.wiredHeadset)) {
        print("Kulaklık bağlandı");
      }
    });
    session.devicesStream.listen((devices) {
      print("Available devices: $devices");
    });
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
