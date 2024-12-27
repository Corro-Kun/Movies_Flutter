import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarMovie extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarMovie({
    super.key,
    this.title = '',
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 20,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          CupertinoIcons.back,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
