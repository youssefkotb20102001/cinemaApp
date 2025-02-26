import 'dart:convert';
import 'package:cinema/classes/AllFilms.dart';
import 'package:cinema/classes/Tickets.dart';
import 'package:cinema/client_details.dart';
import 'package:cinema/tabs.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() {
    return _SigninState();
  }
}

class _SigninState extends State<Signin> with SingleTickerProviderStateMixin {
  final _passwordcontroller = TextEditingController();
  final _phonenumberController = TextEditingController();
  final Client_details client = Client_details(
      phonenumber: '', Password: '', City: 'City', key: '', ticket: []);

  List<Tickets> ticket_list = [];
  late AnimationController _controller;

  @override
  void dispose() {
    _passwordcontroller.dispose();
    _phonenumberController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust duration as needed
    );
  }

  void _showdialog() {
    showDialog(
        context: context,
        builder: ((ctx) => AlertDialog(
              title: const Text('invalid input'),
              content: const Text('Incorrect Phone Number or Password'),
              actions: [
                TextButton(
                    onPressed: (() {
                      Navigator.pop(ctx);
                    }),
                    child: const Text('Close'))
              ],
            )));
  }

  void loaddata() async {
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

            if (item["Phone number"] == _phonenumberController.text &&
                item["password"] == _passwordcontroller.text) {
              // ignore: use_build_context_synchronously
              setState(() {
                client.phonenumber = item['Phone number'];
                client.Password = item['password'];
                client.City = item['city'];
                client.key = entry.key;
              });
              if (item['Tickets'] != null) {
                for (var film in allmovies) {
                  if (item['Tickets'][film.Film_name] != null) {
                    setState(() {
                      // ticket_list.add(item['Tickets'][film.Film_name]);
                      ticket_list.add(Tickets(
                          film: film,
                          date: item['Tickets'][film.Film_name]['Date'],
                          time: item['Tickets'][film.Film_name]['Time']));
                    });
                  }
                }
              }
              setState(() {
                client.ticket = ticket_list;
              });

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Tabs(
                          client: client,
                        )),
              );
            } else {
              _controller.reset();
              _showdialog();
            }
          }
        } else if (responseData == null) {
          print("Response body is empty.");
          _showdialog();
          _controller.reset();
        } else {
          print("Response body is not a valid JSON object.");
        }
      } else {
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (error) {
      print("An error occurred: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    var cinemaimage = 'lib/assets/images/Cinema-wheel.png';
    final keyboard_space = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 79, 78, 78),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.fromLTRB(16, Height * 0.1, 16, keyboard_space + 16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotationTransition(
                        turns: _controller,
                        child: Image.asset(cinemaimage, width: width * 0.7),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign in",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Height * 0.07,
                  ),
                  const Text(
                    "Enter your phone number",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: width,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Color.fromARGB(255, 123, 122, 122),
                      ),
                      child: TextField(
                        controller: _phonenumberController,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Password",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: width,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Color.fromARGB(255, 123, 122, 122),
                      ),
                      child: TextField(
                        obscureText: true,
                        controller: _passwordcontroller,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Height * 0.03,
                  ),
                  SizedBox(
                    width: width,
                    child: ElevatedButton(
                        onPressed: () {
                          _controller.repeat();
                          loaddata();
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
                        child: const Text("Login")),
                  ),
                ]),
          ),
        ));
  }
}
