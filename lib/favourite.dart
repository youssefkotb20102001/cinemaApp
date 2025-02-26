import 'package:cinema/classes/favourite_item.dart';
import 'package:cinema/classes/film_data.dart';
import 'package:cinema/client_details.dart';

import 'package:flutter/material.dart';

class Favourite extends StatelessWidget {
  const Favourite(
      {required this.favourite, required this.clientkey, required this.client});
  final List<Film_data> favourite;
  final String clientkey;
  final Client_details client;

  Widget build(BuildContext context) {
    Widget content = Column(
      children: [
        for (var film in favourite)
          Favourite_Item(
            film: film,
            favourite: favourite,
            client: client,
          )
      ],
    );

    if (favourite.isEmpty) {
      content = const Center(
          child: Text(
        "No Favourite Movies Yet!",
        style: TextStyle(color: Colors.white),
      ));
    }
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 67, 67, 67),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Favourite"),
        ),
        body: content);
  }
}
