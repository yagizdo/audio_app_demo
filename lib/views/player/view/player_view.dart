import 'package:audio_app_demo/widgets/main_widgets/main_layout.dart';
import 'package:flutter/cupertino.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(content: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      child: Text('Player'),
    );
  }
}
