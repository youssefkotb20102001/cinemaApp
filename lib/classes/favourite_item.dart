import 'package:cinema/classes/film_data.dart';
import 'package:cinema/client_details.dart';
import 'package:cinema/film_info.dart';
import 'package:cinema/widgets/film_trait.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Favourite_Item extends StatelessWidget {
  const Favourite_Item(
      {required this.film, required this.favourite, required this.client});
  final Film_data film;
  final List<Film_data> favourite;

  final Client_details client;
  @override
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
      child: Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.hardEdge,
        //to make the above settings work
        elevation: 2,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(film.Film_image),
              //network image is an image loaded from the internet
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: const Color.fromARGB(132, 0, 0, 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                  child: Column(
                    children: [
                      Text(
                        film.Film_name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FilmTrait(
                            name: film.Release_date,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          FilmTrait(name: film.genre),
                          const SizedBox(
                            width: 12,
                          ),
                          FilmTrait(name: film.duration),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
