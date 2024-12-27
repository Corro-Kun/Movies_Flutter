import 'package:movies_movil/features/movies/data/models/detail_movie.dart';

abstract class DetailMovieEvent {}

class GetDetailMovieEvent extends DetailMovieEvent {
  final int id;

  GetDetailMovieEvent({required this.id});
}

class SetFavorite extends DetailMovieEvent {
  final DetailMovie detailMovie;

  SetFavorite({required this.detailMovie});
}
