import 'package:movies_movil/features/movies/data/models/movies_data.dart';
import 'package:movies_movil/features/movies/domain/repositories/abstract_movies_repository.dart';

class GetSearchMovies {
  final AbstractMoviesRepository repository;

  GetSearchMovies(this.repository);

  Future<List<MoviesData>> call(String query) async {
    return await repository.getSearch(query);
  }
}
