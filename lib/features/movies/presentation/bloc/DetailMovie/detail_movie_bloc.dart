import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_movil/features/movies/domain/usecases/get_detail_movie.dart';
import 'package:movies_movil/features/movies/domain/usecases/set_favorites_movie.dart';
import 'package:movies_movil/features/movies/presentation/bloc/DetailMovie/detail_movie_event.dart';
import 'package:movies_movil/features/movies/presentation/bloc/DetailMovie/detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  final GetDetailMovie getDetailMovie;
  final SetFavoritesMovie setFavorite;

  DetailMovieBloc({required this.getDetailMovie, required this.setFavorite})
      : super(DetailMovieInitialState()) {
    on<GetDetailMovieEvent>(_onGetDetailMovie);
    on<SetFavorite>(_onSetFavorite);
  }

  Future<void> _onGetDetailMovie(
      GetDetailMovieEvent event, Emitter<DetailMovieState> emit) async {
    emit(DetailMovieLoadingState());
    try {
      final result = await getDetailMovie.call(event.id);
      emit(DetailMovieLoadedState(detailMovie: result));
    } catch (e) {
      emit(DetailMovieErrorState());
    }
  }

  void _onSetFavorite(SetFavorite event, Emitter<DetailMovieState> emit) {
    setFavorite.call(event.detailMovie);
    final detailMovie = event.detailMovie.copyWith(
      isFavorite: !event.detailMovie.isFavorite,
    );
    emit(DetailMovieLoadedState(detailMovie: detailMovie));
  }
}
