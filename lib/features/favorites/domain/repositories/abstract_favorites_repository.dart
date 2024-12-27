import 'package:movies_movil/features/favorites/data/models/favorites_data.dart';
import 'package:movies_movil/features/movies/data/models/detail_movie.dart';

abstract class AbstractFavoritesRepository {
  Future<List<FavoritesData>> getFavorites();
  Future<FavoritesData> getFavorite(int id);
  Future<bool> isFavorite(int id);
  Future<void> addFavorite(DetailMovie movie);
  Future<void> removeFavorite(int id);
}
