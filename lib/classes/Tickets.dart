import 'package:cinema/classes/film_data.dart';

class Tickets {
  const Tickets({required this.film, required this.date, required this.time});
  final Film_data film;
  final String date;
  final String time;
}
