import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_movil/core/di/injection_container.dart';
import 'package:movies_movil/features/movies/presentation/bloc/PopularMovies/popular_movies_bloc.dart';
import 'package:movies_movil/features/movies/presentation/bloc/PopularMovies/popular_movies_event.dart';
import 'package:movies_movil/features/movies/presentation/bloc/PopularMovies/popular_movies_state.dart';
import 'package:movies_movil/features/movies/presentation/bloc/TopRatedMovies/top_rated_movies_bloc.dart';
import 'package:movies_movil/features/movies/presentation/bloc/TopRatedMovies/top_rated_movies_event.dart';
import 'package:movies_movil/features/movies/presentation/bloc/TopRatedMovies/top_rated_movies_state.dart';
import 'package:movies_movil/features/movies/presentation/widgets/poster.dart';
import 'package:movies_movil/shared/components/movie_card.dart';
import 'package:visibility_detector/visibility_detector.dart';

class StartMovies extends StatelessWidget {
  const StartMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PopularMoviesBloc>(
          create: (context) => sl<PopularMoviesBloc>()..add(GetMovies()),
        ),
        BlocProvider<TopRatedMoviesBloc>(
          create: (context) => sl<TopRatedMoviesBloc>(),
        ),
      ],
      child: CupertinoPageScaffold(
        child: StartMoviesPage(),
      ),
    );
  }
}

class StartMoviesPage extends StatefulWidget {
  @override
  State<StartMoviesPage> createState() => _StartMoviesPageState();
}

class _StartMoviesPageState extends State<StartMoviesPage> {
  bool _topRated = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
          builder: (context, state) {
            if (state is MoviesLoadingState) {
              return Poster(
                id: 1,
                imageUrl:
                    'https://wallpapers.com/images/hd/4k-black-3840-x-2160-background-4d1940xxomuv4kwe.jpg',
              );
            } else if (state is MoviesLoadedState) {
              final movie = (state.movies.toList()..shuffle()).first;
              return Poster(
                id: movie.id,
                imageUrl:
                    'https://image.tmdb.org/t/p/original${movie.poster_path}',
              );
            } else if (state is MoviesErrorState) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center();
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Popular',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: 240,
          child: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
            builder: (context, state) {
              if (state is MoviesLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MoviesLoadedState) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    final movie = state.movies[index];
                    return MovieCard(
                      id: movie.id,
                      title: movie.title,
                      imageUrl:
                          'https://image.tmdb.org/t/p/w300${movie.poster_path}',
                    );
                  },
                );
              } else {
                return const Center();
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Mejor Calificados',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        VisibilityDetector(
          key: const Key('top-rated'),
          onVisibilityChanged: (info) {
            if (info.visibleFraction > 0 && !_topRated) {
              context.read<TopRatedMoviesBloc>().add(GetTopMovies());
              setState(() {
                _topRated = true;
              });
            }
          },
          child: SizedBox(
            height: 240,
            child: BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
              builder: (context, state) {
                if (state is TopRatedMoviesLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TopRatedMoviesLoadedState) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      final movie = state.movies[index];
                      return MovieCard(
                        id: movie.id,
                        title: movie.title,
                        imageUrl:
                            'https://image.tmdb.org/t/p/w300${movie.poster_path}',
                      );
                    },
                  );
                } else {
                  return const Center();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
