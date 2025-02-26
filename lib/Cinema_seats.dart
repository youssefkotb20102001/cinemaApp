import 'package:flutter/material.dart';

class CinemaSeats extends StatefulWidget {
  const CinemaSeats({required this.row_name, required this.incrementSeats});
  final String row_name;
  final void Function(int) incrementSeats;
  @override
  State<CinemaSeats> createState() {
    return _CinemaSeatsState();
  }
}

class _CinemaSeatsState extends State<CinemaSeats> {
  var container_color = Colors.white;

  void changeColor() {
    if (container_color == Colors.white) {
      widget.incrementSeats(1);
      setState(() {
        container_color = Colors.pink;
      });
    } else {
      widget.incrementSeats(0);
      setState(() {
        container_color = Colors.white;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        changeColor();
      },
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: 15,
              width: 15,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: container_color,
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Text(
              widget.row_name,
              style: TextStyle(color: Colors.white, fontSize: 8),
            )
          ],
        ),
      ),
    );
  }
}
