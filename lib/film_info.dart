import 'dart:convert';
import 'package:cinema/availableCinemas.dart';
import 'package:cinema/classes/AllFilms.dart';
import 'package:cinema/client_details.dart';
import 'package:http/http.dart' as http;
import 'package:cinema/classes/film_data.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Film_Info extends StatelessWidget {
  const Film_Info(
      {required this.film, required this.favourite, required this.client});
  final Film_data film;
  final List<Film_data> favourite;

  final Client_details client;

  void update(film) {
    var key = client.key;
    final url = Uri.https(
        "cinema-8ce7d-default-rtdb.firebaseio.com", "cinema-users/$key.json");

    http.patch(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'favourites': film}));
  }

  List<dynamic> getfilmsname(Action) {
    var list = [];
    for (final film in favourite) {
      list.add(film.Film_name);
    }
    return list;
  }

  Widget build(BuildContext context) {
    bool isComingSoon = false;
    var wasadded = false;
    var width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    if (comingSoon.contains(film)) {
      isComingSoon = true;
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {
                  if (favourite.contains(film)) {
                    wasadded = false;
                    favourite.remove(film);
                    update(getfilmsname('remove'));
                  } else {
                    if (wasadded == false) {
                      wasadded = true;
                      favourite.add(film);
                      update(getfilmsname('add'));
                    } else if (wasadded == true) {
                      wasadded = false;
                      favourite.remove(film);
                      update(getfilmsname('remove'));
                    }
                  }
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(wasadded ? 'film added' : 'film removed'),
                  ));
                },
                icon: const Icon(Icons.favorite))
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: Height,
            child: Stack(
              children: [
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(film.Film_image),
                  //network image is an image loaded from the internet
                  fit: BoxFit.cover,
                  height: Height * 0.4,
                  width: double.infinity,
                ),
                Positioned(
                  top: Height * 0.35,
                  child: Container(
                      padding: EdgeInsets.only(bottom: Height * 0.1),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 93, 92, 92),
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle),
                      height: Height * 0.7,
                      width: width,
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(film.genre,
                                  style: const TextStyle(color: Colors.pink)),
                              SizedBox(width: width * 0.01),
                              Text(
                                film.Release_date,
                                style: const TextStyle(color: Colors.white),
                              )
                            ]),
                            Text(
                              film.Film_name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: Height * 0.02,
                            ),
                            Row(
                              children: [
                                for (var i = 0; i < film.rating; i++)
                                  const Icon(Icons.star, color: Colors.yellow),
                                const Spacer(),
                                Text(film.duration,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              height: Height * 0.02,
                            ),
                            Text(
                              film.discription,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: Height * 0.04,
                            ),
                            const Text(
                              "Cast",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 120,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: film.cast.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: width * 0.1,
                                            margin: const EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: NetworkImage(film
                                                        .cast[index]
                                                        .cast_image),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                        Container(
                                          width: 50,
                                          child: Text(
                                            film.cast[index].cast_name,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: width * 0.9,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (isComingSoon == false) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AvailableCinemas(
                                                      film: film,
                                                      client: client,
                                                    )),
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: isComingSoon == false
                                              ? Colors.pink
                                              : const Color.fromARGB(
                                                  255,
                                                  138,
                                                  137,
                                                  137), //background color of button
                                          side: BorderSide(
                                            width: 3,
                                            color: isComingSoon == false
                                                ? Colors.pink
                                                : const Color.fromARGB(
                                                    255, 138, 137, 137),
                                          ), //border width and color
                                          elevation: 3, //elevation of button
                                          shape: RoundedRectangleBorder(
                                              //to set border radius to button
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          padding: const EdgeInsets.all(
                                              20) //content padding inside button

                                          ),
                                      child: isComingSoon == false
                                          ? const Text(
                                              "Buy Ticket",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : const Text(
                                              "Not Available yet",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                ),
                Positioned(
                    left: width * 0.75,
                    top: Height * 0.32,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.play_arrow, size: 60),
                    ))
              ],
            ),
          ),
        ));
  }
}
