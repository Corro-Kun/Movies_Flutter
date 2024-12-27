import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_movil/features/movies/presentation/pages/movie_finder.dart';

class AppBarMain extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMain({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {},
        child: Container(),
      ),
      actions: [
        GestureDetector(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieFinder(),
              ),
            ),
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: Icon(
              CupertinoIcons.search,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
