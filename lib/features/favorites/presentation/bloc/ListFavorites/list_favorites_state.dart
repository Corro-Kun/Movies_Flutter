import 'package:movies_movil/features/favorites/data/models/favorites_data.dart';

abstract class ListFavoritesState {}

class ListFavoritesInitialState extends ListFavoritesState {}

class ListFavoritesLoadingState extends ListFavoritesState {}

class ListFavoritesLoadedState extends ListFavoritesState {
  final List<FavoritesData> favorites;

  ListFavoritesLoadedState({required this.favorites});
}

class ListFavoritesErrorState extends ListFavoritesState {}
