import 'package:cinema/Congratulations.dart';
import 'package:cinema/Tickets_List.dart';
import 'package:cinema/classes/film_data.dart';
import 'package:cinema/client_details.dart';
import 'package:cinema/tabs.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Ticket extends StatelessWidget {
  final Film_data film;
  final Client_details client;
  final String? taken; // URL of the image to be downloaded

  Ticket({required this.film, required this.client, this.taken});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => Tabs(
                    client: client,
                  )),
          (route) => false, // This prevents back navigation from the new page
        );
        return false; // Return false to block back button press
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 67, 67, 67),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImageView(
                backgroundColor: Colors.pink,
                data: film
                    .Film_name, // QR code data contains the image download URL
                version: QrVersions.auto,
                size: 200.0,
              ),
              SizedBox(
                height: height * 0.15,
              ),
              SizedBox(
                width: width * 0.5,
                child: ElevatedButton(
                    onPressed: () {
                      if (taken == 'taken') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Tickets_List(client: client)),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => congratulations(
                                    client: client,
                                  )),
                        );
                      }
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
                    child: const Text("Download")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
