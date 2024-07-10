import 'package:flutter/material.dart';
import 'package:movie_review_app/components/components.dart';
import 'package:movie_review_app/screens/home/home_components/categories.dart';
import 'package:movie_review_app/screens/home/home_components/movie_list.dart';
import 'package:movie_review_app/screens/home/home_components/search_text_field.dart';
import 'package:movie_review_app/providers/home_provider.dart';
import 'package:movie_review_app/utils/app_config.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    provider.getNowPlayingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<HomeProvider>(builder: (context, provider, _) {
        return Scaffold(
            backgroundColor: AppConfigurations.backgroundColor,
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Find Movies, Tv series, \nand more..',
                        style: AppConfigurations.headline),
                    verticalGap(),
                    SearchTextField(provider: provider),
                    verticalGap(15),
                    Categories(provider: provider),
                    verticalGap(15),
                    MovieList(provider: provider),
                  ]),
            ));
      }),
    );
  }
}
