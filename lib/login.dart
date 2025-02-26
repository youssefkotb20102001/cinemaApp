import 'package:cinema/signin.dart';
import 'package:cinema/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 67, 67, 67),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Tazaker Cinema",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
                const Text(
                  "Your ticket to cinematic bliss!",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        // height: 100, //height of button
                        width: 300,
                        child: ElevatedButton(
                            onPressed: () {
                              // Navigate to the second screen when the button is pressed
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signin()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.pink, //background color of button
                                side: const BorderSide(
                                    width: 3,
                                    color:
                                        Colors.pink), //border width and color
                                elevation: 3, //elevation of button
                                shape: RoundedRectangleBorder(
                                    //to set border radius to button
                                    borderRadius: BorderRadius.circular(30)),
                                padding: const EdgeInsets.all(
                                    20) //content padding inside button

                                ),
                            child: const Text("Login")),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 251, 249, 249),
                                foregroundColor: Colors.black,
                                side: const BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 246, 244, 244)),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                padding: const EdgeInsets.all(20)),
                            child: const Text("Signup")),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
