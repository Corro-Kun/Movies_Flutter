import 'package:movies_movil/features/movies/data/models/detail_movie.dart';
import 'package:movies_movil/features/movies/domain/repositories/abstract_movies_repository.dart';

class GetDetailMovie {
  final AbstractMoviesRepository repository;

  GetDetailMovie(this.repository);

  Future<DetailMovie> call(int id) async {
    return await repository.getDetail(id);
  }
}
