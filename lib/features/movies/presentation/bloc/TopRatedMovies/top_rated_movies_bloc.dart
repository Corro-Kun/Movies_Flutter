import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_movil/features/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_movil/features/movies/presentation/bloc/TopRatedMovies/top_rated_movies_event.dart';
import 'package:movies_movil/features/movies/presentation/bloc/TopRatedMovies/top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final GetTopRatedMovies getTopRatedMovies;

  TopRatedMoviesBloc({required this.getTopRatedMovies})
      : super(TopRatedMoviesInitialState()) {
    on<GetTopMovies>(_onGetMovies);
  }

  Future<void> _onGetMovies(
      GetTopMovies event, Emitter<TopRatedMoviesState> emit) async {
    emit(TopRatedMoviesLoadingState());
    try {
      final result = await getTopRatedMovies.call();
      emit(TopRatedMoviesLoadedState(movies: result));
    } catch (e) {
      emit(TopRatedMoviesErrorState());
    }
  }
}
