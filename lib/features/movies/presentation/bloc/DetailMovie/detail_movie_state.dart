import 'package:movies_movil/features/movies/data/models/detail_movie.dart';

abstract class DetailMovieState {}

class DetailMovieInitialState extends DetailMovieState {}

class DetailMovieLoadingState extends DetailMovieState {}

class DetailMovieLoadedState extends DetailMovieState {
  final DetailMovie detailMovie;

  DetailMovieLoadedState({required this.detailMovie});
}

class DetailMovieErrorState extends DetailMovieState {}
