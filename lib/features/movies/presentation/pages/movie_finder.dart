import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_movil/core/di/injection_container.dart';
import 'package:movies_movil/features/movies/presentation/bloc/SearchMovie/search_movie_bloc.dart';
import 'package:movies_movil/features/movies/presentation/bloc/SearchMovie/search_movie_event.dart';
import 'package:movies_movil/features/movies/presentation/bloc/SearchMovie/search_movie_state.dart';
import 'package:movies_movil/features/movies/presentation/widgets/app_bar_movies.dart';
import 'package:movies_movil/features/movies/presentation/widgets/search_custom.dart';
import 'package:movies_movil/shared/components/movie_card.dart';

class MovieFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchMovieBloc>(),
      child: MovieFinderPage(),
    );
  }
}

class MovieFinderPage extends StatelessWidget {
  const MovieFinderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMovie(
        title: 'Buscar Película',
      ),
      body: ListView(
        children: [
          SearchCustom(
            submit: (value) {
              context
                  .read<SearchMovieBloc>()
                  .add(SearchMovieEventSearch(query: value));
            },
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<SearchMovieBloc, SearchMovieState>(
            builder: (context, state) {
              if (state is SearchMovieInitialState) {
                return const Center(
                  child: Text('Buscar una película'),
                );
              } else if (state is SearchMovieLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SearchMovieLoadedState) {
                return Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: List.generate(state.movies.length, (i) {
                    return MovieCard(
                      id: state.movies[i].id,
                      title: state.movies[i].title,
                      imageUrl:
                          'https://image.tmdb.org/t/p/w300${state.movies[i].poster_path}',
                    );
                  }),
                );
              } else {
                return const Center(
                  child: Text('No se encontraron resultados'),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
