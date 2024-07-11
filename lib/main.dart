import 'package:flutter/material.dart';
import 'package:movie_review_app/providers/details_provider.dart';
import 'package:movie_review_app/screens/dashboard.dart';
import 'package:movie_review_app/providers/home_provider.dart';
import 'package:movie_review_app/screens/details/movie_details_screen.dart';
import 'package:movie_review_app/screens/details/tv_series_details.dart';
import 'package:movie_review_app/screens/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomeProvider()),
    ChangeNotifierProvider(create: (context) => DetailsProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movie Review',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true),
        home: const SplashScreen(),
        routes: {
          Dashboard.routeName: (context) => const Dashboard(),
          MovieDetailsScreen.routeName: (context) => const MovieDetailsScreen(),
          TVSeriesDetailsScreen.routeName: (context) =>
              const TVSeriesDetailsScreen(),
        });
  }
}
