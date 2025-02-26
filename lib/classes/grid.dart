import 'package:cinema/classes/AllFilms.dart';
import 'package:cinema/classes/film_data.dart';
import 'package:cinema/client_details.dart';
import 'package:cinema/film_item.dart';
import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  const Grid(
      {required this.favourite, required this.clientkey, required this.client});
  final List<Film_data> favourite;
  final String clientkey;
  final Client_details client;
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final film in nowplaying)
          Film_item(
            favourite: favourite,
            film: film,
            clientkey: clientkey,
            client: client,
          ),
      ],
    );
  }
}
