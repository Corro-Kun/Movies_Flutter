import 'package:movies_movil/features/movies/data/models/movies_data.dart';

abstract class TopRatedMoviesState {}

class TopRatedMoviesInitialState extends TopRatedMoviesState {}

class TopRatedMoviesLoadingState extends TopRatedMoviesState {}

class TopRatedMoviesLoadedState extends TopRatedMoviesState {
  final List<MoviesData> movies;

  TopRatedMoviesLoadedState({required this.movies});
}

class TopRatedMoviesErrorState extends TopRatedMoviesState {}
