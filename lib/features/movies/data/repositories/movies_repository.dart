import 'package:movies_movil/features/movies/data/datasource/movies_datasource.dart';
import 'package:movies_movil/features/movies/data/models/detail_movie.dart';
import 'package:movies_movil/features/movies/data/models/movies_data.dart';
import 'package:movies_movil/features/movies/data/models/movies_data_response.dart';
import 'package:movies_movil/features/movies/data/services/movies_favorites_service.dart';
import 'package:movies_movil/features/movies/domain/repositories/abstract_movies_repository.dart';

class MoviesRepositoryImply extends AbstractMoviesRepository {
  final MoviesDatasource datasource;
  final MoviesFavoritesService favoritesService;

  MoviesRepositoryImply(this.datasource, this.favoritesService);

  @override
  Future<List<MoviesData>> getPopular() async {
    final response = await datasource.getPopular();
    return MoviesDataResponse.fromJson(response).results;
  }

  @override
  Future<List<MoviesData>> getTopRated() async {
    final response = await datasource.getTopRated();
    return MoviesDataResponse.fromJson(response).results;
  }

  @override
  Future<DetailMovie> getDetail(int id) async {
    final isFavorite = await favoritesService.isFavorite(id);
    if (isFavorite) {
      final favorite = await favoritesService.getFavorite(id);
      return DetailMovie(
        id: favorite.id,
        title: favorite.title,
        original_title: favorite.original_title,
        overview: favorite.overview,
        poster_path: favorite.poster_path,
        backdrop_path: favorite.backdrop_path,
        release_date: favorite.release_date,
        vote_average: favorite.vote_average,
        isFavorite: true,
      );
    }
    final response = await datasource.getDetail(id);
    final movie = DetailMovie.fromJson(response);
    movie.isFavorite = isFavorite;
    return movie;
  }

  @override
  Future<List<MoviesData>> getSearch(String query) async {
    final response = await datasource.getSearch(query);
    return MoviesDataResponse.fromJson(response).results;
  }

  @override
  Future<void> setFavorite(DetailMovie movie) async {
    if (movie.isFavorite) {
      await favoritesService.removeFavorite(movie.id);
    } else {
      await favoritesService.addFavorite(movie);
    }
  }
}
