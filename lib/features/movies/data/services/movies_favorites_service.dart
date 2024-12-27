import 'package:movies_movil/features/favorites/data/models/favorites_data.dart';
import 'package:movies_movil/features/favorites/domain/repositories/abstract_favorites_repository.dart';
import 'package:movies_movil/features/movies/data/models/detail_movie.dart';

class MoviesFavoritesService {
  final AbstractFavoritesRepository repository;

  MoviesFavoritesService(this.repository);

  Future<FavoritesData> getFavorite(int id) {
    return repository.getFavorite(id);
  }

  Future<bool> isFavorite(int id) {
    return repository.isFavorite(id);
  }

  Future<void> addFavorite(DetailMovie movie) {
    return repository.addFavorite(movie);
  }

  Future<void> removeFavorite(int id) {
    return repository.removeFavorite(id);
  }
}
