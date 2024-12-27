import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_movil/features/movies/domain/usecases/get_search_movies.dart';
import 'package:movies_movil/features/movies/presentation/bloc/SearchMovie/search_movie_event.dart';
import 'package:movies_movil/features/movies/presentation/bloc/SearchMovie/search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final GetSearchMovies getSearchMovies;

  SearchMovieBloc({required this.getSearchMovies})
      : super(SearchMovieInitialState()) {
    on<SearchMovieEventSearch>(_onSearchMovie);
  }

  Future<void> _onSearchMovie(
      SearchMovieEventSearch event, Emitter<SearchMovieState> emit) async {
    emit(SearchMovieLoadingState());
    try {
      final result = await getSearchMovies.call(event.query);
      emit(SearchMovieLoadedState(movies: result));
    } catch (e) {
      emit(SearchMovieErrorState());
    }
  }
}
