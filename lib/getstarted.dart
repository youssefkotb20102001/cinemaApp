import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema/Carousell_slider.dart';
import 'package:cinema/login.dart';
import 'package:flutter/material.dart';

class Getstarted extends StatefulWidget {
  @override
  State<Getstarted> createState() {
    return _GetstartedState();
  }
}

class _GetstartedState extends State<Getstarted> {
  @override
  Widget build(BuildContext context) {
    CarouselController _carouselController = CarouselController();
    var width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    return Center(
      child: CarouselSlider(
        items: [
          const carousel_slider(
            title: "Welcome To Movies+",
            description: "A ticket to the cinema is always in your pocket!",
            wallpaper: "lib/assets/images/peter 1.png",
            widget: Text(" "),
          ),
          carousel_slider(
            title: "Your cinema community",
            description: "The best way to have the best movie experiance",
            wallpaper: "lib/assets/images/openhimer 1.png",
            widget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the second screen when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
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
                  child: const Text("Get Started")),
            ),
          )
        ],
        carouselController: _carouselController,
        options: CarouselOptions(
          height: Height, // Adjust the height as needed

          enlargeCenterPage: true,
          autoPlay: false,
          aspectRatio: Height / width,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: false,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {});
          },
        ),
      ),
    );
  }
}
