import 'package:get_it/get_it.dart';
import 'package:movies_movil/features/favorites/data/datasource/favorites_datasource.dart';
import 'package:movies_movil/features/favorites/data/repositories/favorites_repository.dart';
import 'package:movies_movil/features/favorites/domain/repositories/abstract_favorites_repository.dart';
import 'package:movies_movil/features/favorites/domain/usecase/get_favorites_usecase.dart';
import 'package:movies_movil/features/favorites/presentation/bloc/ListFavorites/list_favorites_bloc.dart';
import 'package:movies_movil/features/movies/data/datasource/movies_datasource.dart';
import 'package:movies_movil/features/movies/data/repositories/movies_repository.dart';
import 'package:movies_movil/features/movies/data/services/movies_favorites_service.dart';
import 'package:movies_movil/features/movies/domain/repositories/abstract_movies_repository.dart';
import 'package:movies_movil/features/movies/domain/usecases/get_detail_movie.dart';
import 'package:movies_movil/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_movil/features/movies/domain/usecases/get_search_movies.dart';
import 'package:movies_movil/features/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_movil/features/movies/domain/usecases/set_favorites_movie.dart';
import 'package:movies_movil/features/movies/presentation/bloc/DetailMovie/detail_movie_bloc.dart';
import 'package:movies_movil/features/movies/presentation/bloc/PopularMovies/popular_movies_bloc.dart';
import 'package:movies_movil/features/movies/presentation/bloc/SearchMovie/search_movie_bloc.dart';
import 'package:movies_movil/features/movies/presentation/bloc/TopRatedMovies/top_rated_movies_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => PopularMoviesBloc(getPopularMovies: sl()));
  sl.registerFactory(() => TopRatedMoviesBloc(getTopRatedMovies: sl()));
  sl.registerFactory(
      () => DetailMovieBloc(getDetailMovie: sl(), setFavorite: sl()));
  sl.registerFactory(() => SearchMovieBloc(getSearchMovies: sl()));

  sl.registerFactory(() => ListFavoritesBloc(getFavoritesUsecase: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetPopularMovies(sl()));
  sl.registerLazySingleton(() => GetTopRatedMovies(sl()));
  sl.registerLazySingleton(() => GetDetailMovie(sl()));
  sl.registerLazySingleton(() => GetSearchMovies(sl()));

  sl.registerLazySingleton(() => SetFavoritesMovie(sl()));
  sl.registerLazySingleton(() => GetFavoritesUsecase(sl()));

  // Services
  sl.registerLazySingleton(() => MoviesFavoritesService(sl()));

  // Repository
  sl.registerLazySingleton<AbstractMoviesRepository>(
    () => MoviesRepositoryImply(sl(), sl()),
  );
  sl.registerLazySingleton<AbstractFavoritesRepository>(
    () => FavoritesRepository(sl()),
  );

  // Data sources
  sl.registerLazySingleton(() => MoviesDatasource());
  sl.registerLazySingleton(() => FavoritesDatasource());
}
