import 'package:audio_app_demo/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_assets.dart';
import '../utils/app_constants.dart';
import '../utils/app_textstyles.dart';
import '../widgets/main_widgets/main_layout.dart';

class NetworkErrorView extends StatelessWidget {
  const NetworkErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      content: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.noNetworkIcon, width: context.screenWidth * 0.3,),
          height10Per(context: context),
          Text("Lütfen internet bağlantınızı\n kontrol ediniz!",textAlign: TextAlign.center, style: AppTextStyle.noInternetConnectionView(context),),
        ],
      ),
    );
  }
}