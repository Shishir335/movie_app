import 'package:flutter/material.dart';
import 'package:movie_review_app/api_service/api_service.dart';
import 'package:movie_review_app/models/movie_details.dart';
import 'package:movie_review_app/models/movie_response.dart';
import 'package:movie_review_app/models/tv_series_details.dart';
import 'package:movie_review_app/models/tv_series_response.dart';
import 'package:movie_review_app/utils/urls.dart';

class DetailsProvider with ChangeNotifier {
  // movie details
  MovieDetails? _movieDetails;
  MovieDetails? get movieDetails => _movieDetails;

  reset() {
    _movieDetails = null;
    _tvSeriesDetails = null;
    _relatedMovies = [];
    _relatedSeries = [];
    seeMore = false;
  }

  Future getMovieDetails(String id) async {
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

  Future getTvSeriesDetails(String id) async {
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

  // get related movies
  List<Movie> _relatedMovies = [];
  List<Movie> get relatedMovies => _relatedMovies;

  getRelatedMovies() async {
    await HttpHelper.get(Urls.getRelatedMoviesUrl(_movieDetails!.id.toString()))
        .then((value) {
      MovieResponse response = MovieResponse.fromJson(value.response);
      _relatedMovies = response.results!;
    });
    notifyListeners();
  }

  // get related series
  List<TVSeries> _relatedSeries = [];
  List<TVSeries> get relatedSeries => _relatedSeries;

  getRelatedSeries() async {
    await HttpHelper.get(
            Urls.getRelatedSeriesUrl(_tvSeriesDetails!.id.toString()))
        .then((value) {
      TVSeriesResponse response = TVSeriesResponse.fromJson(value.response);
      _relatedSeries = response.results!;
    });
    notifyListeners();
  }
}
