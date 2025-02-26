import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  const Time({super.key, required this.selecttime, required this.list});

  final List<String> list;
  final void Function(String time) selecttime;
  @override
  State<Time> createState() {
    return _TimeState();
  }
}

class _TimeState extends State<Time> {
  int selectedIndex = -1;
  void submit(time) {
    widget.selecttime(time);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    //var height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.list.length, // Your list length
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });

              submit(widget.list[index]);
            },
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: index == selectedIndex
                        ? Colors.white
                        : Colors.transparent, // Change color based on selection

                    borderRadius: BorderRadius.circular(15),
                    border: index == selectedIndex
                        ? Border.all(color: Colors.white)
                        : Border.all(color: Colors.pink),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.list[index],
                    style: TextStyle(
                        color:
                            index == selectedIndex ? Colors.pink : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
