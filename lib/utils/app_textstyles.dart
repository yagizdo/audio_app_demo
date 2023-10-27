import 'package:audio_app_demo/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  AppTextStyle._();

// Main Button
  static TextStyle mainButtonTextStyle(BuildContext context, Color? textColor,
      double? fontSize, FontWeight? fontWeight) {
    return TextStyle(
      color: textColor ?? AppColors.blackBackground,
      fontSize: fontSize ?? context.screenWidth * 0.04,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle homeText() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.2,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle errorTitleText(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: context.screenWidth * 0.05,
      fontWeight: FontWeight.w700,
      //letterSpacing: -0.2,
      //overflow: TextOverflow.ellipsis,
    );
  }

  // No Internet Connection View
  static TextStyle noInternetConnectionView(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: context.isLittlePhone
          ? context.screenWidth * 0.04
          : context.screenWidth * 0.045,
      //overflow: TextOverflow.ellipsis,
    );
  }
}
