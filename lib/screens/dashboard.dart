import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_review_app/screens/home/home_screen.dart';
import 'package:movie_review_app/screens/player_screen.dart';
import 'package:movie_review_app/screens/profile.dart';
import 'package:movie_review_app/utils/app_config.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Widget> screens = const [
    HomePage(),
    PlayerScreen(),
    ProfileScreen(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: screens[index]),
          Container(
            height: 60,
            width: double.infinity,
            color: AppConfigurations.backgroundColor,
            child: Row(children: [
              Expanded(
                  child: InkWell(
                      onTap: () {
                        index = 0;
                        setState(() {});
                      },
                      child: const Icon(Icons.home_rounded,
                          size: 35, color: Colors.white24))),
              Expanded(
                  child: InkWell(
                      onTap: () {
                        index = 1;
                        setState(() {});
                      },
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 8, 10),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.orange),
                          child: const Icon(FontAwesomeIcons.play,
                              color: Colors.white60, size: 20)))),
              Expanded(
                  child: InkWell(
                      onTap: () {
                        index = 2;
                        setState(() {});
                      },
                      child: const Icon(Icons.person,
                          size: 35, color: Colors.white24))),
            ]),
          )
        ],
      ),
    );
  }
}
