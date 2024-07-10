import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_review_app/screens/dashboard.dart';
import 'package:movie_review_app/utils/app_config.dart';
import 'package:movie_review_app/utils/navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Nav.pushAndRemoveAll(context, Dashboard.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfigurations.backgroundColor,
      body: Center(
        child: Container(
            padding: const EdgeInsets.fromLTRB(30, 30, 16, 30),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.orange),
            child: const Icon(FontAwesomeIcons.play,
                color: Colors.white60, size: 100)),
      ),
    );
  }
}
