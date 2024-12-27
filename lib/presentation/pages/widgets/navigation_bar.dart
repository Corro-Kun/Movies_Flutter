import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavigationBarCustom extends StatelessWidget {
  final PageController pageController;

  const NavigationBarCustom({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: GNav(
          backgroundColor: Theme.of(context).colorScheme.surface,
          color: Theme.of(context).colorScheme.secondary,
          activeColor: Theme.of(context).colorScheme.primary,
          tabActiveBorder: Border(
            top: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            right: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            left: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          onTabChange: (index) {
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          padding: const EdgeInsets.all(16),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: CupertinoIcons.heart_fill,
              text: 'favorites',
            )
          ],
        ),
      ),
    );
  }
}
