import 'package:flutter/material.dart';
import 'package:movie_review_app/utils/app_config.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConfigurations.backgroundColor,
        body: Center(
            child: Text('Media Player', style: AppConfigurations.title)));
  }
}
