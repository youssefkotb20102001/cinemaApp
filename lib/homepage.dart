import 'package:cinema/classes/AllFilms.dart';
import 'package:cinema/classes/film_data.dart';
import 'package:cinema/classes/homepage_listview.dart';
import 'package:cinema/client_details.dart';
import 'package:cinema/films.dart';
import 'package:cinema/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage(
      {super.key,
      required this.favourite,
      required this.clientkey,
      required this.client});
  final List<Film_data> favourite;
  final String clientkey;
  final Client_details client;
  @override
  State<Homepage> createState() {
    return _HomepageState();
  }
}

class _HomepageState extends State<Homepage> {
  var selectedcategory = 'All';

  changecategory(text) {
    setState(() {
      selectedcategory = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 67, 67, 67),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.05),
                child: const SizedBox(height: 70, child: Homepage_SearchBar()),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                "Category",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
                        changecategory('All');
                      },
                      child: Container(
                        width: width * 0.3,
                        height: 30,
                        decoration: BoxDecoration(
                          color: selectedcategory == 'All'
                              ? Colors.pink
                              : Colors.transparent,
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'all',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        changecategory("Action");
                      },
                      child: Container(
                        width: width * 0.3,
                        height: 30,
                        decoration: BoxDecoration(
                            color: selectedcategory == 'Action'
                                ? Colors.pink
                                : Colors.transparent,
                            border: Border.all(color: Colors.pink),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'Action',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        changecategory("Horror");
                      },
                      child: Container(
                        width: width * 0.3,
                        height: 30,
                        decoration: BoxDecoration(
                            color: selectedcategory == 'Horror'
                                ? Colors.pink
                                : Colors.transparent,
                            border: Border.all(color: Colors.pink),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'horror',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        changecategory("Adventure");
                      },
                      child: Container(
                        width: width * 0.3,
                        height: 30,
                        decoration: BoxDecoration(
                            color: selectedcategory == 'Adventure'
                                ? Colors.pink
                                : Colors.transparent,
                            border: Border.all(color: Colors.pink),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'adventure',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    "Now Playing",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Films(
                                    favourite: widget.favourite,
                                    clientkey: widget.clientkey,
                                    client: widget.client,
                                  )),
                        );
                      },
                      child: const Text(
                        "view all",
                        style: TextStyle(color: Colors.pink),
                      ))
                ],
              ),
              SizedBox(
                  height: 100,
                  child: Homepage_listview(
                    genre: selectedcategory,
                    films: nowplaying,
                    favourite: widget.favourite,
                    clientkey: widget.clientkey,
                    client: widget.client,
                  )),
              Row(
                children: [
                  const Text(
                    "coming Soon",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "view all",
                        style: TextStyle(color: Colors.pink),
                      ))
                ],
              ),
              SizedBox(
                height: 100,
                child: Homepage_listview(
                  genre: selectedcategory,
                  films: comingSoon,
                  favourite: widget.favourite,
                  clientkey: widget.clientkey,
                  client: widget.client,
                ),
              ),
              Row(
                children: [
                  const Text(
                    "Top Movies",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "View all",
                        style: TextStyle(color: Colors.pink),
                      ))
                ],
              ),
              SizedBox(
                  height: 100,
                  child: Homepage_listview(
                    genre: selectedcategory,
                    favourite: widget.favourite,
                    films: topMovies,
                    clientkey: widget.clientkey,
                    client: widget.client,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
