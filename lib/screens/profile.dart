import 'package:flutter/material.dart';
import 'package:movie_review_app/utils/app_config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConfigurations.backgroundColor,
        body: Center(child: Text('Profile', style: AppConfigurations.title)));
  }
}
