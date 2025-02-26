import 'package:cinema/classes/cast.dart';

class Film_data {
  const Film_data({
    required this.Film_name,
    required this.Film_image,
    required this.genre,
    required this.Release_date,
    required this.discription,
    required this.duration,
    required this.rating,
    required this.cast,
  });

  final String Film_name;
  final String Film_image;
  final String genre;
  final String Release_date;
  final String duration;
  final int rating;
  final String discription;
  final List<Cast> cast;
}
