import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_movil/features/favorites/presentation/pages/start_favorites.dart';
import 'package:movies_movil/features/movies/presentation/pages/start_movies.dart';
import 'package:movies_movil/shared/components/app_bar_main.dart';
import 'package:movies_movil/presentation/pages/widgets/navigation_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMain(),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          StartMovies(),
          StartFavorites(),
        ],
      ),
      bottomNavigationBar: NavigationBarCustom(
        pageController: _pageController,
      ),
    );
  }
}
