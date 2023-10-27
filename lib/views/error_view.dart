import 'package:audio_app_demo/utils/app_textstyles.dart';
import 'package:audio_app_demo/widgets/main_widgets/main_layout.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, this.errorValue});
  final String? errorValue;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      content: Center(
        child: Text(
          'Error',
          style: AppTextStyle.errorTitleText(context),
        ),
      )
    );
  }
}
