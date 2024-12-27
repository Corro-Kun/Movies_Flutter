import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_movil/core/di/injection_container.dart';
import 'package:movies_movil/features/movies/presentation/bloc/DetailMovie/detail_movie_bloc.dart';
import 'package:movies_movil/features/movies/presentation/bloc/DetailMovie/detail_movie_event.dart';
import 'package:movies_movil/features/movies/presentation/bloc/DetailMovie/detail_movie_state.dart';
import 'package:movies_movil/features/movies/presentation/widgets/app_bar_movies.dart';

class MovieInformation extends StatefulWidget {
  final int id;

  const MovieInformation({super.key, required this.id});

  @override
  State<MovieInformation> createState() => _MovieInformationState();
}

class _MovieInformationState extends State<MovieInformation> {
  late DetailMovieBloc _movieBloc;

  @override
  void initState() {
    super.initState();
    _movieBloc = sl<DetailMovieBloc>();
    Future.delayed(Duration.zero, () {
      _showDraggableBottomSheet();
    });
  }

  widthCart() {
    final Size screenSize = MediaQuery.of(context).size;
    return screenSize.width.toDouble();
  }

  void _showDraggableBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: _movieBloc,
          child: DraggableScrollableSheet(
            initialChildSize: 0.24,
            minChildSize: 0.2,
            maxChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: BlocBuilder<DetailMovieBloc, DetailMovieState>(
                        builder: (context, state) {
                          if (state is DetailMovieLoadingState) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is DetailMovieLoadedState) {
                            return Column(
                              children: [
                                SizedBox(
                                  width: widthCart(),
                                  child: Text(
                                    state.detailMovie.title,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: widthCart(),
                                  child: Text(
                                    state.detailMovie.release_date,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      state.detailMovie.vote_average >= 2
                                          ? CupertinoIcons.star_fill
                                          : CupertinoIcons.star,
                                      size: 15,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    Icon(
                                      state.detailMovie.vote_average >= 4
                                          ? CupertinoIcons.star_fill
                                          : CupertinoIcons.star,
                                      size: 15,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    Icon(
                                      state.detailMovie.vote_average >= 6
                                          ? CupertinoIcons.star_fill
                                          : CupertinoIcons.star,
                                      size: 15,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    Icon(
                                      state.detailMovie.vote_average >= 8
                                          ? CupertinoIcons.star_fill
                                          : CupertinoIcons.star,
                                      size: 15,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    Icon(
                                      state.detailMovie.vote_average == 10
                                          ? CupertinoIcons.star_fill
                                          : CupertinoIcons.star,
                                      size: 15,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: widthCart(),
                                  child: Text(
                                    state.detailMovie.overview,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.read<DetailMovieBloc>().add(
                                          SetFavorite(
                                              detailMovie: state.detailMovie),
                                        );
                                  },
                                  child: Icon(
                                    state.detailMovie.isFavorite
                                        ? CupertinoIcons.heart_fill
                                        : CupertinoIcons.heart,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 30,
                                  ),
                                )
                              ],
                            );
                          } else {
                            return const Center();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _movieBloc..add(GetDetailMovieEvent(id: widget.id)),
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              _showDraggableBottomSheet();
            },
            child: BlocBuilder<DetailMovieBloc, DetailMovieState>(
              builder: (context, state) {
                if (state is DetailMovieLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is DetailMovieLoadedState) {
                  return Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original${state.detailMovie.poster_path}',
                      fit: BoxFit.cover,
                    ),
                  );
                } else {
                  return const Center();
                }
              },
            ),
          ),
        ),
        appBar: AppBarMovie(
          title: 'Información de la película',
        ),
      ),
    );
  }
}
