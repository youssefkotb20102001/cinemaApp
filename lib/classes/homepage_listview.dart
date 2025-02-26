import 'package:cinema/classes/film_data.dart';
import 'package:cinema/classes/homepage_containers.dart';
import 'package:cinema/client_details.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class Homepage_listview extends StatelessWidget {
  Homepage_listview(
      {super.key,
      required this.films,
      required this.favourite,
      required this.clientkey,
      required this.genre,
      required this.client});
  final List<Film_data> films;
  final List<Film_data> favourite;
  final String clientkey;
  final String genre;
  List<Film_data> list = [];
  final Client_details client;

  filterfilms() {
    for (final film in films) {
      if (genre != 'All') {
        if (film.genre == genre) {
          list.add(film);
        }
      } else {
        list = films;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    filterfilms();
    Widget context = ListView(scrollDirection: Axis.horizontal, children: [
      for (var film in list)
        Row(
          children: [
            Homepage_Container(
              image: film.Film_image,
              favourite: favourite,
              film: film,
              clientkey: clientkey,
              client: client,
            ),
            const SizedBox(
              width: 15,
            )
          ],
        )
    ]);

    if (list.isEmpty) {
      context = const Center(
        child: Text(
          "No Films To Show",
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return context;
  }
}
