class Urls {
  static String apiKey = 'api_key=cd890f94a756b1518a2a17617a5b430e';

  static String nowPlayingMovies = 'https://api.themoviedb.org/3/movie/now_playing?$apiKey';
  static String topRatedMovies = 'https://api.themoviedb.org/3/movie/top_rated?$apiKey';
  static String popularMovies = 'https://api.themoviedb.org/3/movie/popular?$apiKey';

  static String nowPlayingTvSeries = 'https://api.themoviedb.org/3/tv/on_the_air?$apiKey';
  static String topRatedTvSeries = 'https://api.themoviedb.org/3/tv/top_rated?$apiKey';
  static String popularTvSeries = 'https://api.themoviedb.org/3/tv/popular?$apiKey';

  static String movieSearch = 'https://api.themoviedb.org/3/search/movie?$apiKey';
  static String tvSearch = 'https://api.themoviedb.org/3/search/tv?$apiKey';

  static String movieDetails = 'https://api.themoviedb.org/3/movie/';
  static String tvSeriesDetails = 'https://api.themoviedb.org/3/tv/';

  static String getRelatedMoviesUrl(String id) {
    return 'https://api.themoviedb.org/3/movie/$id/recommendations?$apiKey';
  }

  static String getRelatedSeriesUrl(String id) {
    return 'https://api.themoviedb.org/3/tv/$id/recommendations?$apiKey';
  }

  static String posterPath = 'http://image.tmdb.org/t/p/w185';

}
