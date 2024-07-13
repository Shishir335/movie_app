import 'package:flutter/material.dart';
import 'package:movie_review_app/components/components.dart';
import 'package:movie_review_app/models/movie_response.dart';
import 'package:movie_review_app/screens/details/movie_details_screen.dart';
import 'package:movie_review_app/screens/details/tv_series_details.dart';
import 'package:movie_review_app/utils/app_config.dart';
import 'package:movie_review_app/utils/navigator.dart';
import 'package:movie_review_app/utils/urls.dart';

class RecommendedCard extends StatelessWidget {
  final dynamic details;

  const RecommendedCard({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (details is Movie) {
          Nav.pushAndReplace(context, MovieDetailsScreen.routeName,
              arguments: {'id': details.id.toString()});
        } else {
          Nav.pushAndReplace(context, TVSeriesDetailsScreen.routeName,
              arguments: {'id': details.id.toString()});
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 180,
              width: 250,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: details.posterPath == null
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 50),
                          child: Center(child: Icon(Icons.image, size: 100)))
                      : Image.network(Urls.posterPath + details.posterPath!,
                          loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const CircularProgressIndicator();
                        }, fit: BoxFit.cover)),
            ),
            verticalGap(10),
            SizedBox(
              width: 250,
              child: Wrap(
                children: [
                  Text(details is Movie ? details.title : details.originalName,
                      style: AppConfigurations.title),
                  details is Movie
                      ? Text(' (${details.releaseDate.split('-').first})',
                          style: AppConfigurations.title)
                      : Text(' (${details.firstAirDate.split('-').first})',
                          style: AppConfigurations.title)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
