import 'package:flutter/material.dart';
import 'package:movie_review_app/components/components.dart';
import 'package:movie_review_app/models/movie_response.dart';
import 'package:movie_review_app/screens/details/movie_details_screen.dart';
import 'package:movie_review_app/screens/details/tv_series_details.dart';
import 'package:movie_review_app/utils/app_config.dart';
import 'package:movie_review_app/utils/navigator.dart';
import 'package:movie_review_app/utils/urls.dart';

class ItemCard extends StatelessWidget {
  final dynamic details;

  const ItemCard({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (details is Movie) {
          Nav.push(context, MovieDetailsScreen.routeName,
              arguments: {'id': details.id.toString()});
        } else {
          Nav.push(context, TVSeriesDetailsScreen.routeName,
              arguments: {'id': details.id.toString()});
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
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
          verticalGap(10),
          Text(details is Movie ? details.title : details.originalName,
              style: AppConfigurations.title),
        ],
      ),
    );
  }
}
