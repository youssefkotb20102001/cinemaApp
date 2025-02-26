import 'package:cinema/TicketReservation.dart';
import 'package:cinema/classes/film_data.dart';
import 'package:cinema/client_details.dart';
import 'package:flutter/material.dart';

class AvailableCinemas extends StatelessWidget {
  const AvailableCinemas({required this.film, required this.client});
  final Film_data film;
  final Client_details client;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 67, 67, 67),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Available cinema",
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 67, 67, 67),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(width * 0.02, 0, width * 0.02, 0),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.1,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TicketReservation(
                              film: film,
                              cinema: "Amir cinema",
                              client: client,
                            )),
                  );
                },
                child: Card(
                  color: const Color.fromARGB(255, 67, 67, 67),
                  shadowColor: Colors.black,
                  child: Row(
                    children: [
                      const Icon(Icons.favorite, color: Colors.pink),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Amir Cinema",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "(Mahatet ElRaml)",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const Spacer(),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.map, color: Colors.white),
                          Text(
                            "Go Map",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TicketReservation(
                              film: film,
                              cinema: "San Stefano",
                              client: client,
                            )),
                  );
                },
                child: Card(
                  color: const Color.fromARGB(255, 67, 67, 67),
                  shadowColor: Colors.black,
                  child: Row(
                    children: [
                      const Icon(Icons.favorite, color: Colors.pink),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "San Stefano Cinema",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "(San Stefano)",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.map, color: Colors.white),
                            Text(
                              "Go Map",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TicketReservation(
                              film: film,
                              cinema: "Vox",
                              client: client,
                            )),
                  );
                },
                child: Card(
                  color: const Color.fromARGB(255, 67, 67, 67),
                  shadowColor: Colors.black,
                  child: Row(
                    children: [
                      const Icon(Icons.favorite, color: Colors.pink),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "VOX Cinema",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "(Moharam beh)",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const Spacer(),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.map, color: Colors.white),
                          Text(
                            "Go Map",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TicketReservation(
                              film: film,
                              cinema: "Green Plaza",
                              client: client,
                            )),
                  );
                },
                child: Card(
                  color: const Color.fromARGB(255, 67, 67, 67),
                  shadowColor: Colors.black,
                  child: Row(
                    children: [
                      const Icon(Icons.favorite, color: Colors.pink),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Green Plaza",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "(Smouha)",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const Spacer(),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.map, color: Colors.white),
                          Text(
                            "Go Map",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
