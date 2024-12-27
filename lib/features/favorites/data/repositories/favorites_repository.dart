import 'package:movies_movil/features/favorites/data/datasource/favorites_datasource.dart';
import 'package:movies_movil/features/favorites/data/models/favorites_data.dart';
import 'package:movies_movil/features/favorites/domain/repositories/abstract_favorites_repository.dart';
import 'package:movies_movil/features/movies/data/models/detail_movie.dart';

class FavoritesRepository extends AbstractFavoritesRepository {
  final FavoritesDatasource datasource;

  FavoritesRepository(this.datasource);

  @override
  Future<void> addFavorite(DetailMovie movie) {
    final result = FavoritesData(
        id: movie.id,
        title: movie.title,
        original_title: movie.original_title,
        overview: movie.overview,
        poster_path: movie.poster_path,
        backdrop_path: movie.backdrop_path,
        release_date: movie.release_date,
        vote_average: movie.vote_average);

    return datasource.insertMovie(result);
  }

  @override
  Future<bool> isFavorite(int id) {
    return datasource.isFavorite(id);
  }

  @override
  Future<List<FavoritesData>> getFavorites() {
    return datasource.getMovies().then((value) {
      return value.map((e) => FavoritesData.fromJson(e)).toList();
    });
  }

  @override
  Future<FavoritesData> getFavorite(int id) {
    return datasource.getMovie(id);
  }

  @override
  Future<void> removeFavorite(int id) {
    return datasource.deleteMovie(id);
  }
}
