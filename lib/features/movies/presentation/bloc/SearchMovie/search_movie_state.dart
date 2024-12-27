import 'package:movies_movil/features/movies/data/models/movies_data.dart';

abstract class SearchMovieState {}

class SearchMovieInitialState extends SearchMovieState {}

class SearchMovieLoadingState extends SearchMovieState {}

class SearchMovieLoadedState extends SearchMovieState {
  final List<MoviesData> movies;

  SearchMovieLoadedState({required this.movies});
}

class SearchMovieErrorState extends SearchMovieState {}
