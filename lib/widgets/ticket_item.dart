import 'package:cinema/Ticket.dart';
import 'package:cinema/client_details.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Ticket_Item extends StatelessWidget {
  const Ticket_Item(
      {super.key, required this.index, required this.client, this.taken});

  final Client_details client;
  final int index;
  final String? taken;
  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var Height = MediaQuery.of(context).size.height;
    var film = client.ticket[index].film;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Ticket(
                    film: film,
                    client: client,
                    taken: taken,
                  )),
        );
      },
      child: Card(
          color: const Color.fromARGB(255, 75, 75, 75),
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          clipBehavior: Clip.hardEdge,
          //to make the above settings work
          elevation: 20,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(film.Film_image)),
                  Column(
                    children: [
                      Text(
                        film.Film_name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            client.ticket[index].date,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "|",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            client.ticket[index].time,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward,
                      color: Colors.white, size: 22),
                ],
              ),
              const Divider(
                color: Color.fromARGB(255, 132, 132, 132), // Color of the line
                thickness: 1, // Thickness of the line
              ),
              Row(
                children: [
                  const Text(
                    "Remember me one hour earlier",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Change",
                        style: TextStyle(color: Colors.pink)),
                  )
                ],
              )
            ],
          )),
    );
  }
}
