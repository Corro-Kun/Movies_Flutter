import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_movil/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_movil/features/movies/presentation/bloc/PopularMovies/popular_movies_event.dart';
import 'package:movies_movil/features/movies/presentation/bloc/PopularMovies/popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc({required this.getPopularMovies})
      : super(MoviesInitialState()) {
    on<GetMovies>(_onGetMovies);
  }

  Future<void> _onGetMovies(
      GetMovies event, Emitter<PopularMoviesState> emit) async {
    emit(MoviesLoadingState());
    try {
      final result = await getPopularMovies.call();
      emit(MoviesLoadedState(movies: result));
    } catch (e) {
      emit(MoviesErrorState(message: e.toString()));
    }
  }
}
