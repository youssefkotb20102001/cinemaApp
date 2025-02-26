import 'dart:convert';

import 'package:cinema/client_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChangePassword extends StatefulWidget {
  const ChangePassword({required this.client});
  final Client_details client;
  @override
  State<ChangePassword> createState() {
    return _SignupState();
  }
}

class _SignupState extends State<ChangePassword> {
  final _passwordcontroller = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _newpasswordcontroller = TextEditingController();

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
              content: const Text(
                  'please make sure a valid title, amount and date correctly'),
              actions: [
                TextButton(
                    onPressed: (() {
                      Navigator.pop(ctx);
                    }),
                    child: const Text('Close'))
              ],
            )));
  }

  void update(key, newpassword) {
    final url = Uri.https(
        "cinema-8ce7d-default-rtdb.firebaseio.com", "cinema-users/$key.json");

    http.patch(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'password': newpassword}));
  }

  void changePassword() {
    if (_passwordcontroller.text == _newpasswordcontroller.text) {
      _showdialog();
    } else {
      update(widget.client.key, _newpasswordcontroller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.client.phonenumber);
    print(widget.client.Password);
    print(widget.client.City);
    var width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 79, 78, 78),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(
              height: Height * 0.3,
            ),
            const Icon(Icons.lock_open, color: Colors.white),
            SizedBox(
              height: Height * 0.03,
            ),
            const Text(
              "change Password",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Height * 0.03,
            ),
            const Row(
              children: [
                Text(
                  "Phone number",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: Height * 0.02,
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
            const Row(
              children: [
                Text(
                  "Old Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: Height * 0.02,
            ),
            SizedBox(
              width: width,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Color.fromARGB(255, 123, 122, 122),
                ),
                child: TextField(
                  controller: _passwordcontroller,
                  keyboardType: TextInputType.phone,
                ),
              ),
            ),
            const Row(
              children: [
                Text(
                  "New Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: Height * 0.02,
            ),
            SizedBox(
              width: width,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Color.fromARGB(255, 123, 122, 122),
                ),
                child: TextField(
                  controller: _newpasswordcontroller,
                  keyboardType: TextInputType.phone,
                ),
              ),
            ),
            SizedBox(
              height: Height * 0.02,
            ),
            SizedBox(
              width: width,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink, //background color of button
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
