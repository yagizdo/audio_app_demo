import 'package:audio_app_demo/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({
    Key? key,
    this.appBar,
    this.content,
    this.padding,
    this.alignment,
    this.backgroundColor,
    this.safeAreaBottomActivated = false,
    this.floatingActionButton,
    this.disableSafeArea = false,
    this.resizeToAvoidBottomInset,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final Widget? content;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Color? backgroundColor;
  final bool safeAreaBottomActivated;
  final bool disableSafeArea;
  final FloatingActionButton? floatingActionButton;
  final bool? resizeToAvoidBottomInset;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor ?? AppColors.blackBackground,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      appBar: widget.appBar,
      floatingActionButton: widget.floatingActionButton,
      body: SafeArea(
        bottom: widget.safeAreaBottomActivated,
        top: !widget.disableSafeArea,
        left: !widget.disableSafeArea,
        right: !widget.disableSafeArea,
        child: Container(
          alignment: widget.alignment,
          padding: widget.padding,
          child: widget.content ?? Container(),
        ),
      ),
    );
  }
}
