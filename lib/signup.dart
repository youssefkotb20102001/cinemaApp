import 'dart:convert';
import 'package:cinema/signin.dart';
import 'package:cinema/widgets/Phonenumber_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() {
    return _SignupState();
  }
}

enum city { alexandria, cairo, suez }

class _SignupState extends State<Signup> {
  final _passwordcontroller = TextEditingController();
  final _phonenumberController = TextEditingController();
  var selectedOption = city.alexandria;
  List<String> usernames = [];
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  void dispose() {
    _passwordcontroller.dispose();
    _phonenumberController.dispose();
    super.dispose();
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
            setState(() {
              usernames.add(item['Phone number']);
            });
          }
        } else if (responseData == null) {
          print("Response body is empty.");
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

  void _savedata(enterednum, password, city) {
    if (usernames.contains(enterednum)) {
      _showdialog();
    } else {
      final url = Uri.https(
          "cinema-8ce7d-default-rtdb.firebaseio.com", "cinema-users.json");
      http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'Phone number': enterednum,
            'password': password,
            'city': city,
          }));

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Signin()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var cinemaimage = 'lib/assets/images/Cinema-wheel.png';

    var width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 79, 78, 78),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: Height * 0.05, left: width * 0.03, right: width * 0.03),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(cinemaimage, width: width * 0.7),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: Height * 0.03,
                ),
                const Text(
                  "Enter your phone number",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Height * 0.01,
                ),
                SizedBox(
                    height: Height * 0.05,
                    child: Phonenumber_textfeild(
                      controller: _phonenumberController,
                    )),
                SizedBox(
                  height: Height * 0.05,
                ),
                const Text(
                  "Password",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Height * 0.01,
                ),
                Container(
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
                SizedBox(
                  height: Height * 0.05,
                ),
                const Text(
                  "Select your city",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Height * 0.01,
                ),
                Container(
                  width: width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Color.fromARGB(255, 123, 122, 122),
                  ),
                  child: DropdownButton<city>(
                      value: selectedOption,
                      items: city.values
                          .map((category) => DropdownMenuItem(
                              value: category, child: Text(category.name)))
                          .toList(),
                      onChanged: ((value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          selectedOption = value;
                        });
                      })),
                ),
                SizedBox(
                  height: Height * 0.05,
                ),
                SizedBox(
                  width: width,
                  child: ElevatedButton(
                      onPressed: () {
                        _savedata(_phonenumberController.text,
                            _passwordcontroller.text, selectedOption.name);
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
      ),
    );
  }
}
