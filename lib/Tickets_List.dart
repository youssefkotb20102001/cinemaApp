// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:cinema/client_details.dart';
import 'package:cinema/widgets/ticket_item.dart';

// ignore: camel_case_types
class Tickets_List extends StatelessWidget {
  const Tickets_List({super.key, required this.client});

  final Client_details client;

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text(
        "No tickets yet....",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    if (client.ticket.isNotEmpty) {
      content = SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < client.ticket.length; i++)
              Ticket_Item(
                index: i,
                client: client,
                taken: "taken",
              )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 67, 67, 67),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Tickets"),
        ),
        body: SizedBox(height: double.infinity, child: content));
  }
}
