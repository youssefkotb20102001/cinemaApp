import 'package:cinema/classes/film_data.dart';
import 'package:cinema/client_details.dart';
import 'package:cinema/film_info.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Homepage_Container extends StatelessWidget {
  const Homepage_Container(
      {super.key,
      this.name,
      this.image,
      this.favourite,
      this.film,
      this.selectedcategory,
      required this.clientkey,
      required this.client});
  final String? name;
  final String? image;
  final List<Film_data>? favourite;
  final Film_data? film;
  final Function()? selectedcategory;
  final String clientkey;
  final Client_details client;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Film_Info(
                    film: film!,
                    favourite: favourite!,
                    client: client,
                  )),
        );
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(image!), fit: BoxFit.cover)),
      ),
    );
  }
}
