import 'package:cinema/ViewTicket.dart';
import 'package:cinema/classes/film_data.dart';
import 'package:cinema/client_details.dart';
import 'package:flutter/material.dart';

class PayementMethod extends StatefulWidget {
  const PayementMethod(
      {super.key,
      required this.film,
      required this.cinema,
      required this.Number_of_seats,
      required this.client});
  final Film_data film;
  final String cinema;
  final int Number_of_seats;
  final Client_details client;

  @override
  State<PayementMethod> createState() {
    return _PayementMethodState();
  }
}

class _PayementMethodState extends State<PayementMethod> {
  // ignore: non_constant_identifier_names
  final _CardNumberController = TextEditingController();
  // ignore: non_constant_identifier_names
  final _CardNameController = TextEditingController();
  // ignore: non_constant_identifier_names
  final _DateController = TextEditingController();
  // ignore: non_constant_identifier_names
  final _CVVController = TextEditingController();

  @override
  void dispose() {
    _CardNumberController.dispose();
    _CardNameController.dispose();
    _DateController.dispose();
    _CVVController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // ignore: non_constant_identifier_names
    var Height = MediaQuery.of(context).size.height;
    var image = "lib/assets/images/Frame 1000002453.png";
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 67, 67, 67),
      appBar: AppBar(title: const Text("Payement Method")),
      body: Padding(
        padding: EdgeInsets.fromLTRB(width * 0.03, 0, width * 0.03, 0),
        child: SizedBox(
          width: width,
          child: Padding(
            padding: EdgeInsets.only(top: Height * 0.04),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "choose Payement Method",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Image(image: AssetImage(image)),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Color.fromARGB(255, 252, 250, 250),
                    ),
                    child: TextField(
                      controller: _CardNumberController,
                      decoration:
                          const InputDecoration(label: Text('Card Number')),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    height: Height * 0.03,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Color.fromARGB(255, 252, 250, 250),
                    ),
                    child: TextField(
                      controller: _CardNameController,
                      decoration: const InputDecoration(
                          label: Text('Card Holder Name')),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: Height * 0.03,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width / 3,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Color.fromARGB(255, 252, 250, 250),
                          ),
                          child: TextField(
                            controller: _DateController,
                            decoration:
                                const InputDecoration(label: Text('Date')),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: width / 3,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Color.fromARGB(255, 252, 250, 250),
                          ),
                          child: TextField(
                            controller: _CVVController,
                            decoration:
                                const InputDecoration(label: Text('CVV')),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Height * 0.03,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Remember me",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Height * 0.03,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.film.Film_name,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        "(${widget.cinema})",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const Text(
                        '80 LE',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Height * 0.02,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        "${80 * widget.Number_of_seats} LE",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Height * 0.03,
                  ),
                  SizedBox(
                    width: width,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewTicket(
                                      client: widget.client,
                                      film: widget.film,
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
                                borderRadius: BorderRadius.circular(30)),
                            padding: const EdgeInsets.all(
                                20) //content padding inside button

                            ),
                        child: const Text("Confirm")),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
