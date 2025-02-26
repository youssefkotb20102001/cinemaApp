import 'package:cinema/changePassword.dart';
import 'package:cinema/client_details.dart';
import 'package:cinema/signin.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({required this.client});
  final Client_details client;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 79, 78, 78),
      body: Padding(
        padding: EdgeInsets.only(top: Height * 0.07, left: width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Profile",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(
              height: Height * 0.02,
            ),
            SizedBox(
                height: 100,
                width: 100,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.blue, shape: BoxShape.circle),
                )),
            SizedBox(
              height: Height * 0.1,
            ),
            SizedBox(
              width: width * 0.9,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 254, 254, 254), //background color of button
                      // side: const BorderSide(
                      //     width: 3,
                      //     color: Colors.pink), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(
                          20) //content padding inside button

                      ),
                  child: Row(
                    children: [
                      const Icon(Icons.account_circle, color: Colors.black),
                      SizedBox(width: width * 0.03),
                      const Text(
                        "Account",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: Height * 0.02,
            ),
            SizedBox(
              width: width * 0.9,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePassword(
                                client: client,
                              )),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 254, 254, 254), //background color of button
                      // side: const BorderSide(
                      //     width: 3,
                      //     color: Colors.pink), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(
                          20) //content padding inside button

                      ),
                  child: Row(
                    children: [
                      const Icon(Icons.lock_outline_rounded,
                          color: Colors.black),
                      SizedBox(width: width * 0.03),
                      const Text(
                        "Change Password",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: Height * 0.02,
            ),
            SizedBox(
              width: width * 0.9,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 254, 254, 254), //background color of button
                      // side: const BorderSide(
                      //     width: 3,
                      //     color: Colors.pink), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(
                          20) //content padding inside button

                      ),
                  child: Row(
                    children: [
                      const Icon(Icons.settings, color: Colors.black),
                      SizedBox(width: width * 0.03),
                      const Text(
                        "Settings",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: Height * 0.02,
            ),
            SizedBox(
              width: width * 0.9,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 254, 254, 254), //background color of button
                      // side: const BorderSide(
                      //     width: 3,
                      //     color: Colors.pink), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(
                          20) //content padding inside button

                      ),
                  child: Row(
                    children: [
                      const Icon(Icons.help_center_rounded,
                          color: Colors.black),
                      SizedBox(width: width * 0.03),
                      const Text(
                        "Help",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: Height * 0.02,
            ),
            SizedBox(
              width: width * 0.9,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 254, 254, 254), //background color of button
                      // side: const BorderSide(
                      //     width: 3,
                      //     color: Colors.pink), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(
                          20) //content padding inside button

                      ),
                  child: Row(
                    children: [
                      const Icon(Icons.notifications, color: Colors.black),
                      SizedBox(width: width * 0.03),
                      const Text(
                        "Notification",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: Height * 0.02,
            ),
            SizedBox(
              width: width * 0.9,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Signin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 254, 254, 254), //background color of button
                      // side: const BorderSide(
                      //     width: 3,
                      //     color: Colors.pink), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(
                          20) //content padding inside button

                      ),
                  child: Row(
                    children: [
                      const Icon(Icons.logout, color: Colors.black),
                      SizedBox(width: width * 0.03),
                      const Text(
                        "Log out",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
