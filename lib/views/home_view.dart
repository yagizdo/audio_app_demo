import 'package:audio_app_demo/utils/app_constants.dart';
import 'package:audio_app_demo/utils/app_textstyles.dart';
import 'package:audio_app_demo/utils/extensions/context_extension.dart';
import 'package:audio_app_demo/widgets/main_widgets/main_layout.dart';
import 'package:audio_app_demo/widgets/main_widgets/tap_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home',
              style: AppTextStyle.homeText(),
            ),
            height10Per(context: context),
            TapWrapper(
              onTap: () {
                context.push('/player');
              },
              child: Container(
                width: context.screenWidth * 0.5,
                height: context.screenWidth * 0.1,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Go Player',
                    style: AppTextStyle.homeText(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
