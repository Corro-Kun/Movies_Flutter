import 'package:flutter/material.dart';

class SearchCustom extends StatelessWidget {
  final void Function(String value)? search;
  final void Function(String value)? submit;
  const SearchCustom({super.key, this.search, this.submit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextField(
        onChanged: (value) => {
          if (search != null) {search!(value)}
        },
        onSubmitted: (value) {
          if (submit != null) {
            submit!(value);
          }
        },
        decoration: InputDecoration(
          hintText: "Buscar",
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
