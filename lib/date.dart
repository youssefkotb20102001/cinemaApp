import 'package:cinema/classes/date_components.dart';
import 'package:flutter/material.dart';

class Date extends StatefulWidget {
  const Date({required this.selectdate, required this.list});

  final List<Date_components> list;
  final void Function(String date) selectdate;
  @override
  State<Date> createState() {
    return _DateState();
  }
}

class _DateState extends State<Date> {
  int selectedIndex = -1;
  void submit(date) {
    widget.selectdate(date);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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
              var year = DateTime.now().year;
              var fulldate =
                  "${widget.list[index].day}-${widget.list[index].month}-$year";
              submit(fulldate);
            },
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: index == selectedIndex
                          ? Colors.white
                          : Colors
                              .transparent, // Change color based on selection

                      borderRadius: BorderRadius.circular(15),
                      border: index == selectedIndex
                          ? Border.all(color: Colors.white)
                          : Border.all(color: Colors.pink),
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          widget.list[index].day,
                          style: TextStyle(
                              color: index == selectedIndex
                                  ? Colors.pink
                                  : Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Text(
                          widget.list[index].day_num.toString(),
                          style: TextStyle(
                              color: index == selectedIndex
                                  ? Colors.pink
                                  : Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Text(
                          widget.list[index].month,
                          style: TextStyle(
                              color: index == selectedIndex
                                  ? Colors.pink
                                  : Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
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
