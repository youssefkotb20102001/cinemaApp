// Date(
//                     day: "sun",
//                     day_num: "2",
//                     month: "jan",
//                     // ignore: avoid_types_as_parameter_names
//                     selectdate: (String) {
//                       chosenDate(String);
//                     }),
//                 SizedBox(
//                   width: width * 0.05,
//                 ),
//                 Date(
//                     day: "Mon",
//                     day_num: "3",
//                     month: "jan",
//                     selectdate: (String text) {
//                       chosenDate(text);
//                     }),
//                 SizedBox(
//                   width: width * 0.05,
//                 ),
//                 Date(
//                     day: "Tues",
//                     day_num: "4",
//                     month: "jan",
//                     // ignore: avoid_types_as_parameter_names
//                     selectdate: (String) {
//                       chosenDate(String);
//                     }),
//                 SizedBox(
//                   width: width * 0.05,
//                 ),
//                 Date(
//                     day: "Wed",
//                     day_num: "5",
//                     month: "jan",
//                     // ignore: avoid_types_as_parameter_names
//                     selectdate: (String) {
//                       chosenDate(String);
//                     }),
//                 SizedBox(
//                   width: width * 0.05,
//                 ),
//                 Date(
//                     day: "Thurs",
//                     day_num: "6",
//                     month: "jan",
//                     // ignore: avoid_types_as_parameter_names
//                     selectdate: (String) {
//                       chosenDate(String);
//                     }),
//                 SizedBox(
//                   width: width * 0.05,
//                 ),
//                 Date(
//                     day: "Fri",
//                     day_num: "7",
//                     month: "jan",
//                     // ignore: avoid_types_as_parameter_names
//                     selectdate: (String) {
//                       chosenDate(String);
//                     }),
//                 SizedBox(
//                   width: width * 0.05,
//                 ),
//                 Date(
//                     day: "Fri",
//                     day_num: "7",
//                     month: "jan",
//                     // ignore: avoid_types_as_parameter_names
//                     selectdate: (String) {
//                       chosenDate(String);
//                     }),


























// import 'package:flutter/material.dart';

// class Time extends StatelessWidget {
//   const Time({required this.time, required this.submittime});
//   final String time;
//   final void Function(String Time) submittime;
//   @override
//   void submit(date) {
//     submittime(date);
//   }

//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     return InkWell(
//         onTap: () {
//           submit(time);
//         },
//         child: SizedBox(
//           width: width * 0.12,
//           child: Container(
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.pink),
//                 borderRadius: BorderRadius.circular(15)),
//             child: Column(
//               children: [
//                 Text(
//                   time,
//                   style: const TextStyle(
//                       color: Color.fromARGB(255, 252, 249, 250)),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

