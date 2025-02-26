import 'package:flutter/material.dart';

class carousel_slider extends StatelessWidget {
  const carousel_slider(
      {required this.title,
      required this.description,
      required this.wallpaper,
      required this.widget});

  final String title;
  final String description;
  final String wallpaper;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(wallpaper),
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Color.fromARGB(255, 71, 70, 70),
              BlendMode.color,
            )),
      ),
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: width * 0.09),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: TextStyle(color: Colors.white, fontSize: width * 0.03),
            ),
            SizedBox(
              height: Height * 0.08,
            ),
            SizedBox(width: width, child: widget),
            SizedBox(
              height: Height * 0.125,
            )
          ],
        ),
      ),
    ));
  }
}
