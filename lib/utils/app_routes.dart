import 'package:audio_app_demo/views/home/view/home_view.dart';
import 'package:audio_app_demo/views/player/view/player_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/error_view.dart';

class AppRoutes {

  AppRoutes._();

  static final shared = AppRoutes._();

  factory AppRoutes() => shared;

  static const splash = '/';
  static const home = '/home';
  static const player = '/player';

  List<RouteBase> appRoutes = [
    GoRoute(
      path: splash,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: player,
      builder: (context, state) {
        Map<String, dynamic> extra = state.extra as Map<String, dynamic>;
        return PlayerView(audios: extra['audios'], initialIndex: extra['initialIndex']);
      },
    ),
  ];

  RouterConfig<Object>? appRouterConfig() {
    return GoRouter(
        errorBuilder: (context, state) => ErrorView(errorValue: state.error?.message,),routes: appRoutes);
  }

}