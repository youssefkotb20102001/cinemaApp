import 'dart:convert';

import 'package:cinema/Tickets_List.dart';
import 'package:cinema/classes/AllFilms.dart';
import 'package:cinema/classes/film_data.dart';
import 'package:cinema/client_details.dart';

import 'package:cinema/favourite.dart';
import 'package:cinema/homepage.dart';
import 'package:cinema/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Tabs extends StatefulWidget {
  const Tabs({super.key, required this.client});

  final Client_details client;

  @override
  State<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  List<Film_data> favourite = [];
  // ignore: non_constant_identifier_names
  List<String> favourite_film_names = [];
  Widget activescreen = const Text('');

  String clientkey = "";
  var selectedpageindex = 0;
  void _selectpage(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  @override
  void initState() {
    getfavourite();

    super.initState();
  }

  void getfavourite() async {
    // ignore: non_constant_identifier_names
    final Url = Uri.https(
        "cinema-8ce7d-default-rtdb.firebaseio.com", "cinema-users.json");

    try {
      final response = await http.get(Url);

      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        final dynamic responseData = json.decode(response.body);
        //print(response.body);
        // Check if responseData is not null and is a valid JSON object
        if (responseData != null && responseData is Map<String, dynamic>) {
          final Map<String, dynamic> data = responseData;

          // Now you can iterate through each entry and process the data...
          for (final entry in data.entries) {
            final Map<String, dynamic> item = entry.value;
            if (entry.key == widget.client.key) {
              setState(() {
                clientkey = entry.key;
              });
              for (final film in item['favourites']) {
                setState(() {
                  favourite_film_names.add(film);
                });
              }
            }
          }
        } else if (responseData == null) {
          //print("Response body is empty.");
        } else {
          //print("Response body is not a valid JSON object.");
        }
      } else {
        // print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (error) {
      //print("An error occurred: $error");
    }
    sync();
  }

  void sync() {
    for (final name in favourite_film_names) {
      for (final film in allmovies) {
        if (name == film.Film_name) {
          favourite.add(film);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if (selectedpageindex == 1) {
      setState(() {
        activescreen = Favourite(
          favourite: favourite,
          clientkey: clientkey,
          client: widget.client,
        );
      });
    } else if (selectedpageindex == 0) {
      setState(() {
        activescreen = Homepage(
          favourite: favourite,
          clientkey: clientkey,
          client: widget.client,
        );
      });
    } else if (selectedpageindex == 3) {
      setState(() {
        activescreen = Profile(client: widget.client);
      });
    } else if (selectedpageindex == 2) {
      setState(() {
        activescreen = Tickets_List(
          client: widget.client,
        );
      });
    }
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 67, 67, 67),
        body: activescreen,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: SizedBox(
            width: width,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              fixedColor: const Color.fromARGB(255, 15, 15, 15),
              backgroundColor: const Color.fromARGB(255, 250, 248, 248),
              currentIndex: selectedpageindex,
              //this made the selected category highlighted...
              onTap: _selectpage,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'films'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.star), label: 'favorites'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.airplane_ticket_outlined),
                    label: 'Ticket'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: 'Profile'),
              ],
            ),
          ),
        ));
  }
}
