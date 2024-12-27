import 'package:movies_movil/features/movies/data/models/movies_data.dart';

class MoviesDataResponse {
  final int page;
  final List<MoviesData> results;

  MoviesDataResponse({
    required this.page,
    required this.results,
  });

  factory MoviesDataResponse.fromJson(Map<String, dynamic> json) {
    final List<MoviesData> movies = [];

    for (final movie in json['results']) {
      movies.add(MoviesData.fromJson(movie));
    }

    return MoviesDataResponse(
      page: json['page'],
      results: movies,
    );
  }
}
