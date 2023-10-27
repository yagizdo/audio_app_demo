import 'package:audio_app_demo/utils/app_textstyles.dart';
import 'package:audio_app_demo/widgets/main_widgets/main_layout.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      content: Center(
        child: Text(
          'Home',
          style: AppTextStyle.homeText(),
        ),
      ),
    );
  }
}
