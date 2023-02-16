import 'package:flutter/material.dart';

import 'detailpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Container> daftarFilm = [];

  var listMovie = [
    {"Ant Man", "antman.jpeg"},
    {"Avengers", "avanger.jpeg"},
    {"Avatar", "avatar.jpeg"},
    {"Buzz Lightyear", "buzz.png"},
    {"Coco", "coco.jpeg"},
    {"Harry Potter", "harrypotter.jpeg"},
    {"Minions", "minions.jpeg"},
    {"Soekarno", "soekarno.jpeg"},
    {"Spiderman", "spiderman.png"},
    {"wakanda", "wakanda.jpeg"},
  ];

  dataListMovie() {
    for (var i = 0; i < listMovie.length; i++) {
      final Set<String> film = listMovie[i];
      final String title = film.elementAt(0);
      final String images = film.elementAt(1);

      daftarFilm.add(
        Container(
          padding: const EdgeInsets.all(10),
          child: Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailPage(
                    title: title,
                    image: "assets/$images",
                  );
                }));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: "film",
                    child: Image(
                      image: AssetImage(
                        "assets/$images",
                      ),
                      fit: BoxFit.cover,
                      height: 150,
                      width: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    dataListMovie();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        childAspectRatio: (itemWidth / itemHeight),
        children: daftarFilm,
      ),
    );
  }
}
