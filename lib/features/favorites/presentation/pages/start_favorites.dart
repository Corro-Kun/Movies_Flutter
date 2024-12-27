import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_movil/core/di/injection_container.dart';
import 'package:movies_movil/features/favorites/presentation/bloc/ListFavorites/list_favorites_bloc.dart';
import 'package:movies_movil/features/favorites/presentation/bloc/ListFavorites/list_favorites_event.dart';
import 'package:movies_movil/features/favorites/presentation/bloc/ListFavorites/list_favorites_state.dart';
import 'package:movies_movil/shared/components/movie_card.dart';

class StartFavorites extends StatelessWidget {
  const StartFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ListFavoritesBloc>()..add(GetListFavoritesEvent()),
      child: ListView(
        children: [
          BlocBuilder<ListFavoritesBloc, ListFavoritesState>(
            builder: (context, state) {
              if (state is ListFavoritesInitialState) {
                return const Center(
                  child: Text('No hay favoritos'),
                );
              } else if (state is ListFavoritesLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ListFavoritesLoadedState) {
                return Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: List.generate(state.favorites.length, (i) {
                    return MovieCard(
                      id: state.favorites[i].id,
                      title: state.favorites[i].title,
                      imageUrl:
                          'https://image.tmdb.org/t/p/w300${state.favorites[i].poster_path}',
                    );
                  }),
                );
              } else {
                return const Center(
                  child: Text('Error'),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
