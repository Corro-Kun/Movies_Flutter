import 'package:movies_movil/features/movies/data/models/detail_movie.dart';
import 'package:movies_movil/features/movies/domain/repositories/abstract_movies_repository.dart';

class SetFavoritesMovie {
  final AbstractMoviesRepository repository;

  SetFavoritesMovie(this.repository);

  Future<void> call(DetailMovie movie) async {
    await repository.setFavorite(movie);
  }
}
