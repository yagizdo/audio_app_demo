import 'package:audio_app_demo/models/audio/audio_model.dart';
import 'package:audio_app_demo/utils/app_constants.dart';
import 'package:audio_app_demo/utils/app_locator.dart';
import 'package:audio_app_demo/utils/app_textstyles.dart';
import 'package:audio_app_demo/views/home/widget/audios/audios_list.dart';
import 'package:audio_app_demo/views/player/controller/player_controller.dart';
import 'package:audio_app_demo/widgets/main_widgets/main_layout.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlayerController playerController = getIt<PlayerController>();
    List<AudioModel> audios = [
      AudioModel(
        id: '0',
        title: "I'm Still Standing",
        artist: 'Elton John',
        artUri: "https://upload.wikimedia.org/wikipedia/en/6/69/Elton_John_StillStanding.jpg",
        url: 'https://Hippopcharts.com/music/uploads/2023/06/Elton_John_-_I_m_Still_Standing-Hippopcharts.com.mp3',
      ),
      AudioModel(
        id: "1",
        title: 'Club Mix',
        artist: 'DJ Blend',
        artUri: "https://i1.sndcdn.com/artworks-000051113932-6rfb2i-t500x500.jpg",
        url: 'https://mp3files.cc/dl/V2Excnp1OHV4TG5EVU5OYmZneDFFZz/club-mix-dj-blend.mp3',
      ),
      AudioModel(
        id: "2",
        title: 'Country Roads - Take Me Home',
        artist: 'John Denver',
        artUri: "https://i.scdn.co/image/ab67616d0000b27334fb2b0117a542d515dc78d6",
        url: 'https://mp3files.cc/dl/a29kelU3R1d5dmJWcE90ZmJNMUZtZz/john-denver-take-me-home-country-roads-audio.mp3',
      ),
      AudioModel(
        id: "3",
        title: "We Will Rock You",
        artist: 'Queen',
        artUri: "https://static.wikia.nocookie.net/rockband/images/e/e5/Newsoftheworld.png/revision/latest?cb=20121008210402",
        url: 'https://mp3files.cc/dl/dExreDBwZThCTlc5bk5DN1lRTVR3Zz/queen-we-will-rock-you.mp3',
      ),
      AudioModel(
        id: "4",
        title: 'Aşk Benimle',
        artist: 'Kasım Şeren',
        artUri: 'https://i.scdn.co/image/ab67616d0000b273ad6f9a0b02908d879a1a8c80',
        url: 'https://mp3files.cc/dl/d0ZjeUlyTStSQkRiZmZrVk95M2dTUT/kasim-seren-ask-benimle.mp3',
      ),
    ];
    playerController.setAudios(audios);
    return MainLayout(
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            height5Per(context: context),
            Text(
              'Audios',
              style: AppTextStyle.homeText(),
            ),
            height10Per(context: context),
            Expanded(child: AudiosList(audios: audios,)),
          ],
        ),
      ),
    );
  }
}
