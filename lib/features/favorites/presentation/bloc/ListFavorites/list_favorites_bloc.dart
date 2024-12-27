import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_movil/features/favorites/domain/usecase/get_favorites_usecase.dart';
import 'package:movies_movil/features/favorites/presentation/bloc/ListFavorites/list_favorites_event.dart';
import 'package:movies_movil/features/favorites/presentation/bloc/ListFavorites/list_favorites_state.dart';

class ListFavoritesBloc extends Bloc<ListFavoritesEvent, ListFavoritesState> {
  final GetFavoritesUsecase getFavoritesUsecase;

  ListFavoritesBloc({required this.getFavoritesUsecase})
      : super(ListFavoritesInitialState()) {
    on<GetListFavoritesEvent>(_onGetFavorites);
  }

  Future<void> _onGetFavorites(
      GetListFavoritesEvent event, Emitter<ListFavoritesState> emit) async {
    emit(ListFavoritesLoadingState());
    try {
      final result = await getFavoritesUsecase.call();
      emit(ListFavoritesLoadedState(favorites: result));
    } catch (e) {
      emit(ListFavoritesErrorState());
    }
  }
}
