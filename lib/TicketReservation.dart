import 'package:cinema/Cinema_seats.dart';
import 'package:cinema/Payment_method.dart';
import 'package:cinema/availableCinemas.dart';
import 'package:cinema/classes/Tickets.dart';
import 'package:cinema/classes/date_components.dart';
import 'package:cinema/classes/film_data.dart';
import 'package:cinema/client_details.dart';
import 'package:cinema/date.dart';
import 'package:cinema/time.dart';
import 'package:flutter/material.dart';

class TicketReservation extends StatefulWidget {
  const TicketReservation(
      {required this.film, required this.cinema, required this.client});
  final Film_data film;
  final String cinema;
  final Client_details client;
  @override
  State<TicketReservation> createState() {
    return _TicketReservationState();
  }
}

class _TicketReservationState extends State<TicketReservation> {
  var number_of_seats = 0;
  var _selecteddate;
  var _selectedtime;
  void _showdialog() {
    showDialog(
        context: context,
        builder: ((ctx) => AlertDialog(
              title: const Text('Invalid input'),
              content: const Text('Please select a date and a time and a seat'),
              actions: [
                TextButton(
                    onPressed: (() {
                      Navigator.pop(ctx);
                    }),
                    child: const Text('Close'))
              ],
            )));
  }

  void submit() {
    Tickets ticket =
        Tickets(film: widget.film, time: _selectedtime, date: _selecteddate);
    setState(() {
      widget.client.ticket.add(ticket);
    });
  }

  void chosenDate(date) {
    setState(() {
      _selecteddate = date;
    });
  }

  void chosenTime(time) {
    setState(() {
      _selectedtime = time;
    });
  }

  void increment_seats(index) {
    if (index == 1) {
      setState(() {
        number_of_seats++;
      });
    } else {
      setState(() {
        number_of_seats--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var image = "lib/assets/images/Vector 10.png";
    var width = MediaQuery.of(context).size.width;
    // ignore: non_constant_identifier_names
    var Height = MediaQuery.of(context).size.height;
    var text = "Amir";
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("Ticket Reservation"),
          backgroundColor: Colors.transparent),
      backgroundColor: const Color.fromARGB(255, 67, 67, 67),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 23,
                color: Colors.white,
              ),
              Text(
                "cinema:$text",
                style: const TextStyle(color: Colors.white),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AvailableCinemas(
                                film: widget.film,
                                client: widget.client,
                              )),
                    );
                  },
                  child: const Text(
                    "Change",
                    style: TextStyle(color: Colors.pink),
                  )),
            ],
          ),
          SizedBox(
              height: 100,
              width: double.infinity,
              child: Date(selectdate: chosenDate, list: const [
                Date_components(day: "Sun", day_num: 18, month: "sep"),
                Date_components(day: "Mon", day_num: 19, month: "sep"),
                Date_components(day: "Tues", day_num: 20, month: "sep"),
                Date_components(day: "Wed", day_num: 21, month: "sep"),
                Date_components(day: "Thurs", day_num: 22, month: "sep"),
                Date_components(day: "Fri", day_num: 23, month: "sep"),
                Date_components(day: "Sat", day_num: 24, month: "sep"),
                Date_components(day: "Mon", day_num: 25, month: "sep"),
                Date_components(day: "Tues", day_num: 26, month: "sep"),
                Date_components(day: "Wed", day_num: 27, month: "sep"),
              ])),
          SizedBox(
            height: Height * 0.03,
          ),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Time(
                  list: const [
                    '9:00',
                    '10:00',
                    '11:00',
                    '12:00',
                    '1:00',
                    '2:00',
                    '3:00',
                    '4:00',
                    '5:00'
                  ],
                  selecttime: (String) {
                    chosenTime(String);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: Height * 0.03,
          ),
          Image(image: AssetImage(image)),
          SizedBox(
            height: Height * 0.02,
          ),
          SizedBox(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (var i = 0; i < 7; i++)
                    Column(
                      children: [
                        CinemaSeats(
                            row_name: "A${i + 1}",
                            incrementSeats: increment_seats),
                        SizedBox(
                          width: width * 0.05,
                        )
                      ],
                    )
                ],
              ),
              SizedBox(
                height: Height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (var i = 0; i < 7; i++)
                    Column(
                      children: [
                        CinemaSeats(
                            row_name: "B${i + 1}",
                            incrementSeats: increment_seats),
                        SizedBox(
                          width: width * 0.05,
                        )
                      ],
                    )
                ],
              ),
              SizedBox(
                height: Height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (var i = 0; i < 9; i++)
                    Column(
                      children: [
                        CinemaSeats(
                            row_name: "C${i + 1}",
                            incrementSeats: increment_seats),
                        SizedBox(
                          width: width * 0.05,
                        )
                      ],
                    )
                ],
              ),
              SizedBox(
                height: Height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (var i = 0; i < 9; i++)
                    Column(
                      children: [
                        CinemaSeats(
                            row_name: "D${i + 1}",
                            incrementSeats: increment_seats),
                        SizedBox(
                          width: width * 0.05,
                        )
                      ],
                    )
                ],
              ),
              SizedBox(
                height: Height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (var i = 0; i < 9; i++)
                    Column(
                      children: [
                        CinemaSeats(
                            row_name: "E${i + 1}",
                            incrementSeats: increment_seats),
                        SizedBox(
                          width: width * 0.05,
                        )
                      ],
                    )
                ],
              ),
              SizedBox(
                height: Height * 0.01,
              ),
            ],
          )),
          SizedBox(height: Height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.circle,
                color: Colors.white,
              ),
              SizedBox(
                width: width * 0.02,
              ),
              const Text("Available"),
              SizedBox(
                width: width * 0.02,
              ),
              const Icon(Icons.circle, color: Color.fromARGB(255, 85, 83, 83)),
              SizedBox(
                width: width * 0.02,
              ),
              const Text("Reserved"),
              SizedBox(
                width: width * 0.02,
              ),
              const Icon(
                Icons.circle,
                color: Colors.pink,
              ),
              SizedBox(
                width: width * 0.02,
              ),
              const Text("Selected"),
            ],
          ),
          SizedBox(
            height: Height * 0.03,
          ),
          SizedBox(
            width: width,
            child: ElevatedButton(
                onPressed: () {
                  if (_selecteddate != null &&
                      _selectedtime != null &&
                      number_of_seats != 0) {
                    submit();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PayementMethod(
                                film: widget.film,
                                cinema: widget.cinema,
                                Number_of_seats: number_of_seats,
                                client: widget.client,
                              )),
                    );
                  } else {
                    _showdialog();
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, //background color of button
                    side: const BorderSide(
                        width: 3, color: Colors.pink), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(30)),
                    padding:
                        const EdgeInsets.all(20) //content padding inside button

                    ),
                child: const Text("Checkout")),
          ),
        ]),
      ),
    );
  }
}
