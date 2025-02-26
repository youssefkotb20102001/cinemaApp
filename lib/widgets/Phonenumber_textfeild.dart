import 'package:flutter/material.dart';

class Phonenumber_textfeild extends StatefulWidget {
  Phonenumber_textfeild({required this.controller});
  final controller;
  @override
  _Phonenumber_textfeildState createState() => _Phonenumber_textfeildState();
}

class _Phonenumber_textfeildState extends State<Phonenumber_textfeild> {
  String selectedOption = '+20'; // Default selected option

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 123, 122, 122),
        // Set border color
        borderRadius: BorderRadius.all(
            Radius.circular(8.0)), // Optional: Set border radius
      ),
      child: Row(
        children: [
          // Dropdown button on the left
          DropdownButton<String>(
            value: selectedOption,
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue!;
              });
            },
            items: <String>['+20', '+30', '+40']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          // Vertical line
          Container(
            height: 40.0, // Adjust the height as needed
            width: 1.0,
            color: Colors.grey,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
          ),
          // TextField
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: widget.controller,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border:
                      InputBorder.none, // Remove TextField's internal border
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
