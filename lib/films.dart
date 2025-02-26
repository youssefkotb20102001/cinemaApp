import 'package:cinema/classes/film_data.dart';
import 'package:cinema/classes/grid.dart';
import 'package:cinema/client_details.dart';

import 'package:flutter/material.dart';

class Films extends StatelessWidget {
  const Films(
      {required this.favourite, required this.clientkey, required this.client});
  final List<Film_data> favourite;
  final String clientkey;
  final Client_details client;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Now Playing", textAlign: TextAlign.center),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: const Color.fromARGB(255, 67, 67, 67),
          body: Grid(
            favourite: favourite,
            clientkey: clientkey,
            client: client,
          )),
    );
  }
}
