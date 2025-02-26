import 'package:cinema/classes/film_data.dart';
import 'package:cinema/client_details.dart';
import 'package:cinema/film_info.dart';
import 'package:flutter/material.dart';

class Film_item extends StatelessWidget {
  const Film_item(
      {required this.film,
      required this.favourite,
      required this.clientkey,
      required this.client});
  final Film_data film;
  final List<Film_data> favourite;
  final String clientkey;
  final Client_details client;

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Film_Info(
                    favourite: favourite,
                    film: film,
                    client: client,
                  )),
        );
      },
      splashColor: Colors.red,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(film.Film_image),
            fit: BoxFit.cover,
          ),
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          // gradient: LinearGradient(
          //   colors: [
          //     category.color.withOpacity(0.55),
          //     category.color.withOpacity(0.9),
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // )
        ),
      ),
    );
  }
}
