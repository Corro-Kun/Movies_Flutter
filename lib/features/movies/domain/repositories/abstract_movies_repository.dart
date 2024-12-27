import 'package:movies_movil/features/movies/data/models/detail_movie.dart';
import 'package:movies_movil/features/movies/data/models/movies_data.dart';

abstract class AbstractMoviesRepository {
  Future<List<MoviesData>> getPopular();
  Future<List<MoviesData>> getTopRated();
  Future<DetailMovie> getDetail(int id);
  Future<List<MoviesData>> getSearch(String query);
  Future<void> setFavorite(DetailMovie detailMovie);
}
