import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_review_app/components/components.dart';
import 'package:movie_review_app/components/loader.dart';
import 'package:movie_review_app/providers/details_provider.dart';
import 'package:movie_review_app/screens/details/recommended_card.dart';
import 'package:movie_review_app/utils/app_config.dart';
import 'package:movie_review_app/utils/navigator.dart';
import 'package:movie_review_app/utils/urls.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const routeName = 'MovieDetailsScreen';

  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    final provider = Provider.of<DetailsProvider>(context, listen: false);
    provider.reset();
    Future.delayed(const Duration(milliseconds: 200), () {
      provider.getMovieDetails(Nav.getArguments(context)['id']).then((value) {
        provider.getRelatedMovies();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context, provider, _) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppConfigurations.backgroundColor,
          body: provider.movieDetails == null
              ? const Loader()
              : SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height / 2.5,
                            child: Image.network(
                                Urls.posterPath +
                                    provider.movieDetails!.posterPath!,
                                fit: BoxFit.cover)),
                        verticalGap(10),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(provider.movieDetails!.title!,
                                    style: AppConfigurations.headline),
                                verticalGap(10),
                                Row(children: [
                                  Icon(FontAwesomeIcons.clock,
                                      color: AppConfigurations.iconColor,
                                      size: 15),
                                  horizontalGap(7),
                                  Text(
                                      '${provider.movieDetails!.runtime} Minute',
                                      style: AppConfigurations.bodyText),
                                  horizontalGap(),
                                  Icon(Icons.star,
                                      color: AppConfigurations.iconColor,
                                      size: 20),
                                  horizontalGap(7),
                                  Text(
                                      '${provider.movieDetails!.voteAverage}( IMDB)',
                                      style: AppConfigurations.bodyText),
                                ]),
                                const Divider(height: 50, thickness: .7),

                                // release date / genre
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // release date
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Release Date',
                                                  style:
                                                      AppConfigurations.title),
                                              verticalGap(5),
                                              Text(
                                                  formatDate(
                                                      DateTime.parse(provider
                                                          .movieDetails!
                                                          .releaseDate!),
                                                      format: 'MMM d, y'),
                                                  style: AppConfigurations
                                                      .bodyText),
                                            ]),
                                      ),

                                      // genre
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Genre',
                                                  style:
                                                      AppConfigurations.title),
                                              Wrap(
                                                  spacing: 10,
                                                  runSpacing: 10,
                                                  children: [
                                                    for (var item in provider
                                                        .movieDetails!.genres!)
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(7),
                                                        decoration: BoxDecoration(
                                                            color: AppConfigurations
                                                                .backgroundColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey)),
                                                        child: Text(item.name!,
                                                            style:
                                                                AppConfigurations
                                                                    .subtitle),
                                                      ),
                                                  ]),
                                            ]),
                                      ),
                                    ]),
                                const Divider(height: 50, thickness: .7),

                                // synopsis
                                Text('Synopsis',
                                    style: AppConfigurations.title),
                                verticalGap(10),
                                Text(provider.movieDetails!.overview!,
                                    style: AppConfigurations.bodyText,
                                    maxLines: provider.seeMore ? 1000 : 4,
                                    overflow: TextOverflow.ellipsis),
                                if (provider.seeMore == false)
                                  GestureDetector(
                                      onTap: () {
                                        provider.changeSeeMore(true);
                                      },
                                      child: Text('Read more..',
                                          style: AppConfigurations.subtitle)),

                                verticalGap(40),
                                // related movies
                                Text('Related Movies',
                                    style: AppConfigurations.title),
                                verticalGap(20),
                                SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          for (var item
                                              in provider.relatedMovies)
                                            RecommendedCard(details: item)
                                        ]))
                              ]),
                        ),
                      ]),
                ),
        ),
      );
    });
  }
}
