import 'package:movies_movil/features/movies/data/models/movies_data.dart';
import 'package:movies_movil/features/movies/domain/repositories/abstract_movies_repository.dart';

class GetPopularMovies {
  final AbstractMoviesRepository repository;

  GetPopularMovies(this.repository);

  Future<List<MoviesData>> call() async {
    final result = await repository.getPopular();

    return result;
  }
}
