import 'package:cinema/classes/Tickets.dart';

class Client_details {
  Client_details(
      {required this.phonenumber,
      required this.Password,
      required this.City,
      required this.key,
      required this.ticket});
  String phonenumber;
  String Password;
  String City;
  String key;
  List<Tickets> ticket;
}
