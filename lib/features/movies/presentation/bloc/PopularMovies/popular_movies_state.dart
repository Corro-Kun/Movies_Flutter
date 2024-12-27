import 'package:movies_movil/features/movies/data/models/movies_data.dart';

abstract class PopularMoviesState {}

class MoviesInitialState extends PopularMoviesState {}

class MoviesLoadingState extends PopularMoviesState {}

class MoviesLoadedState extends PopularMoviesState {
  final List<MoviesData> movies;

  MoviesLoadedState({required this.movies});
}

class MoviesErrorState extends PopularMoviesState {
  final String message;

  MoviesErrorState({required this.message});
}
