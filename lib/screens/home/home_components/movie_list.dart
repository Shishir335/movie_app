import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_review_app/providers/home_provider.dart';
import 'package:movie_review_app/screens/home/home_components/item_card.dart';

class MovieList extends StatelessWidget {
  final HomeProvider provider;
  const MovieList({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            children: provider.search.text.isEmpty
                ? [
                    if (provider.selectedCategoryNames == 'Movies')
                      for (var item in provider.nowPlayingMovies)
                        ItemCard(details: item),
                    if (provider.selectedCategoryNames == 'Popular Movies')
                      for (var item in provider.popularMovies)
                        ItemCard(details: item),
                    if (provider.selectedCategoryNames == 'Top-rated Movies')
                      for (var item in provider.topRatedMovies)
                        ItemCard(details: item),
                    if (provider.selectedCategoryNames == 'TV Series')
                      for (var item in provider.nowPlayingTVSeries)
                        ItemCard(details: item),
                    if (provider.selectedCategoryNames == 'Popular TV Series')
                      for (var item in provider.popularTVSeries)
                        ItemCard(details: item),
                    if (provider.selectedCategoryNames == 'Top-rated TV Series')
                      for (var item in provider.topRatedTVSeries)
                        ItemCard(details: item),
                  ]
                : [
                    if (['Movies', 'Popular Movies', 'Top-rated Movies']
                        .contains(provider.selectedCategoryNames))
                      for (var item in provider.movieSearch)
                        ItemCard(details: item),
                    if ([
                      'TV Series',
                      'Popular TV Series',
                      'Top-rated TV Series'
                    ].contains(provider.selectedCategoryNames))
                      for (var item in provider.tvSearch)
                        ItemCard(details: item),
                  ]),
      ),
    );
  }
}
