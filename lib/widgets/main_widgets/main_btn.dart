import 'package:audio_app_demo/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_textstyles.dart';
import 'tap_wrapper.dart';

class MainBtn extends StatelessWidget {
  const MainBtn(
      {super.key,
      required this.onTap,
      required this.text,
      this.color = AppColors.blackBackground,
      this.textColor = AppColors.blackBackground,
      this.width,
      this.height,
      this.iconPath,
      this.iconColor,
      this.isShadow = false,
      this.fontSize,
      this.fontWeight});

  final VoidCallback onTap;
  final String text;
  final Color color;
  final Color textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final String? iconPath;
  final Color? iconColor;
  final bool isShadow;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return TapWrapper(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? context.screenWidth * 0.9,
        height: height ?? context.screenWidth * 0.13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: color,
          boxShadow: isShadow
              ? [
                  const BoxShadow(
                    color: AppColors.blackBackground,
                    offset: Offset(0, 4),
                    blurRadius: 16,
                  ),
                ]
              : null,
        ),
        child: iconPath != null
            ? Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        iconPath!,
                        color: iconColor ?? AppColors.blackBackground,
                        width: context.screenWidth * 0.08,
                        height: context.screenWidth * 0.08,
                      ),
                      width5Per(context: context),
                      Text(
                        text,
                        style: AppTextStyle.mainButtonTextStyle(
                            context, textColor, fontSize, fontWeight),
                      ),
                    ],
                  ),
                ),
              )
            : Text(
                text,
                style: AppTextStyle.mainButtonTextStyle(
                    context, textColor, fontSize, fontWeight),
              ),
      ),
    );
  }
}
