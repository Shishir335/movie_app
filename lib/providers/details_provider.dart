import 'package:flutter/material.dart';
import 'package:movie_review_app/api_service/api_service.dart';
import 'package:movie_review_app/models/movie_details.dart';
import 'package:movie_review_app/models/tv_series_details.dart';
import 'package:movie_review_app/utils/urls.dart';

class DetailsProvider with ChangeNotifier {
  // movie details
  MovieDetails? _movieDetails;
  MovieDetails? get movieDetails => _movieDetails;

  setMovieDetailsNull() {
    _movieDetails = null;
    seeMore = false;
  }

  getMovieDetails(String id) async {
    await HttpHelper.get('${Urls.movieDetails}$id?${Urls.apiKey}')
        .then((value) {
      MovieDetails response = MovieDetails.fromJson(value.response);
      _movieDetails = response;
      notifyListeners();
    });
  }

  // tv series details
  TVSeriesDetails? _tvSeriesDetails;
  TVSeriesDetails? get tvSeriesDetails => _tvSeriesDetails;

  getTvSeriesDetails(String id) async {
    await HttpHelper.get('${Urls.tvSeriesDetails}$id?${Urls.apiKey}')
        .then((value) {
      TVSeriesDetails response = TVSeriesDetails.fromJson(value.response);
      _tvSeriesDetails = response;
      notifyListeners();
    });
  }

  bool seeMore = false;

  changeSeeMore(bool value) {
    seeMore = value;
    notifyListeners();
  }
}
