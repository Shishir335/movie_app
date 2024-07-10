import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_review_app/api_service/api_service.dart';
import 'package:movie_review_app/models/movie_response.dart';
import 'package:movie_review_app/models/tv_series_response.dart';
import 'package:movie_review_app/utils/urls.dart';

class HomeProvider extends ChangeNotifier {
  // categories
  List<String> categoryNames = [
    'Movies',
    'Popular Movies',
    'Top-rated Movies',
    'TV Series',
    'Popular TV Series',
    'Top-rated TV Series',
  ];

  String _selectedCategoryNames = 'Movies';
  String get selectedCategoryNames => _selectedCategoryNames;

  changeSelectedCategory(String value) {
    _selectedCategoryNames = value;
    getRegardingData();
    notifyListeners();
  }

  void getRegardingData() {
    switch (_selectedCategoryNames) {
      case 'Movies':
        getNowPlayingMovies();
      case 'Popular Movies':
        getPopularMovies();
      case 'Top-rated Movies':
        getTopRatedMovies();
      case 'TV Series':
        getTVSeries();
      case 'Popular TV Series':
        getPopularTVSeries();
      case 'Top-rated TV Series':
        getTopRatedTVSeries();
    }
  }

  // now playing movies
  List<Movie> _nowPlayingMovies = [];
  List<Movie> get nowPlayingMovies => _nowPlayingMovies;

  getNowPlayingMovies() async {
    await HttpHelper.get(Urls.nowPlayingMovies).then((value) {
      MovieResponse response = MovieResponse.fromJson(value.response);
      _nowPlayingMovies = response.results!;
    });
    notifyListeners();
  }

  // popular movies
  List<Movie> _popularMovies = [];
  List<Movie> get popularMovies => _popularMovies;

  getPopularMovies() async {
    await HttpHelper.get(Urls.popularMovies).then((value) {
      MovieResponse response = MovieResponse.fromJson(value.response);
      _popularMovies = response.results!;
    });
    notifyListeners();
  }

  // top rated movies
  List<Movie> _topRatedMovies = [];
  List<Movie> get topRatedMovies => _topRatedMovies;

  getTopRatedMovies() async {
    await HttpHelper.get(Urls.topRatedMovies).then((value) {
      MovieResponse response = MovieResponse.fromJson(value.response);
      _topRatedMovies = response.results!;
    });
    notifyListeners();
  }

  // Tv series
  List<TVSeries> _nowPlayingTVSeries = [];
  List<TVSeries> get nowPlayingTVSeries => _nowPlayingTVSeries;

  getTVSeries() async {
    await HttpHelper.get(Urls.nowPlayingTvSeries).then((value) {
      TVSeriesResponse response = TVSeriesResponse.fromJson(value.response);
      _nowPlayingTVSeries = response.results!;
    });
    notifyListeners();
  }

  // popular Tv series
  List<TVSeries> _popularTVSeries = [];
  List<TVSeries> get popularTVSeries => _popularTVSeries;

  getPopularTVSeries() async {
    await HttpHelper.get(Urls.popularTvSeries).then((value) {
      TVSeriesResponse response = TVSeriesResponse.fromJson(value.response);
      _popularTVSeries = response.results!;
    });
    notifyListeners();
  }

  // top rated Tv series
  List<TVSeries> _topRatedTVSeries = [];
  List<TVSeries> get topRatedTVSeries => _topRatedTVSeries;

  getTopRatedTVSeries() async {
    await HttpHelper.get(Urls.topRatedTvSeries).then((value) {
      TVSeriesResponse response = TVSeriesResponse.fromJson(value.response);
      _topRatedTVSeries = response.results!;
    });
    notifyListeners();
  }

  // movie Search
  List<Movie> _movieSearch = [];
  List<Movie> get movieSearch => _movieSearch;

  getMovieSearch(String name) async {
    await HttpHelper.get('${Urls.movieSearch}&query=$name').then((value) {
      MovieResponse response = MovieResponse.fromJson(value.response);
      _movieSearch = response.results!;
    });
    notifyListeners();
  }

  // movie Search
  List<TVSeries> _tvSearch = [];
  List<TVSeries> get tvSearch => _tvSearch;

  getTVSearch(String name) async {
    await HttpHelper.get('${Urls.tvSearch}&query=$name').then((value) {
      TVSeriesResponse response = TVSeriesResponse.fromJson(value.response);
      _tvSearch = response.results!;
    });
    notifyListeners();
  }

  // search

  TextEditingController search = TextEditingController();

  Timer? _debounceTimer;

  void getSearch(String value) {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 800), () {
      print(value);
      if (['Movies', 'Popular Movies', 'Top-rated Movies']
          .contains(_selectedCategoryNames)) {
        getMovieSearch(value);
      } else {
        getTVSearch(value);
      }
      cancelTimer();
    });
  }

  cancelTimer() {
    _debounceTimer!.cancel();
  }
}
