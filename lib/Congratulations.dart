import 'package:cinema/client_details.dart';
import 'package:cinema/tabs.dart';
import 'package:flutter/material.dart';

class congratulations extends StatelessWidget {
  const congratulations({required this.client});
  final Client_details client;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var image = 'lib/assets/images/cuate.png';
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 67, 67, 67),
      body: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(image)),
            SizedBox(height: height * 0.03),
            const Text(
              "Congratulations!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * 0.02),
            const Text(
              "Your ticket has been booked",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * 0.3),
            SizedBox(
              width: width * 0.5,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Tabs(
                                client: client,
                              )),
                    );
                  },
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
                  child: const Text("Go Home")),
            )
          ],
        ),
      ),
    );
  }
}
