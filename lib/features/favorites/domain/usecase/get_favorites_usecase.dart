import 'package:movies_movil/features/favorites/data/models/favorites_data.dart';
import 'package:movies_movil/features/favorites/domain/repositories/abstract_favorites_repository.dart';

class GetFavoritesUsecase {
  final AbstractFavoritesRepository repository;

  GetFavoritesUsecase(this.repository);

  Future<List<FavoritesData>> call() async {
    return await repository.getFavorites();
  }
}
