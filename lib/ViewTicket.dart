import 'dart:convert';

import 'package:cinema/Ticket.dart';
import 'package:cinema/classes/film_data.dart';
import 'package:cinema/client_details.dart';
import 'package:cinema/tabs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewTicket extends StatelessWidget {
  const ViewTicket({required this.film, required this.client});
  final Film_data film;
  final Client_details client;

  void update() {
    var key = client.key;
    final url = Uri.https("cinema-8ce7d-default-rtdb.firebaseio.com",
        "cinema-users/$key/Tickets.json");

    for (var i = 0; i < client.ticket.length; i++) {
      var filmBooked = client.ticket[i].film.Film_name;
      Map<String, dynamic> list = {
        'name': client.ticket[i].film.Film_name,
        'Date': client.ticket[i].date,
        'Time': client.ticket[i].time,
      };
      http.patch(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            // 'Film name': client.ticket[i].film.Film_name,
            // 'Film Date': client.ticket[i].date,
            // 'Film Time': client.ticket[i].time,

            '$filmBooked': list
          }));
    }
  }

  @override
  Widget build(BuildContext context) {
    var image = "lib/assets/images/Vector.png";
    var width = MediaQuery.of(context).size.width;
    // ignore: non_constant_identifier_names
    var Height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 67, 67, 67),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            width * 0.2, Height * 0.2, width * 0.2, Height * 0.2),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.white),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, Height * 0.06, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: width * 0.2,
                      child: Container(
                        child: Image(image: AssetImage(image)),
                        decoration: const BoxDecoration(
                            color: Colors.pink, shape: BoxShape.circle),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.03,
                    ),
                    const Text(
                      "Payment Success",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    const Text(
                      "You can view  tickets now",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: Height * 0.15,
                    ),
                    SizedBox(
                      width: width * 0.4,
                      child: ElevatedButton(
                          onPressed: () {
                            update();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Ticket(
                                        film: film,
                                        client: client,
                                      )),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.pink, //background color of button
                              side: const BorderSide(
                                  width: 3,
                                  color: Colors.pink), //border width and color
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(15)),
                              padding: const EdgeInsets.all(
                                  20) //content padding inside button

                              ),
                          child: const Text("View Ticket")),
                    ),
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Tabs(client: client)),
                          );
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
