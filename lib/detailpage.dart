import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final String image;

  const DetailPage({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: "film",
                  child: Image(
                    image: AssetImage(widget.image),
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.star, color: Color(0XFFdbcd07)),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "4",
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Menu(),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      textAlign: TextAlign.justify,),
                )
              ],
            )
          ],
        ));
  }
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: const [
            Icon(Icons.favorite, color: Colors.grey),
            SizedBox(
              height: 5,
            ),
            Text(
              "Favorite",
            )
          ],
        ),
        Column(
          children: const [
            Icon(
              Icons.share,
              color: Colors.grey,
            ),
            SizedBox(
              height: 5,
            ),
            Text("Share")
          ],
        ),
        Column(
          children: const [
            Icon(Icons.bookmark, color: Colors.grey),
            SizedBox(
              height: 5,
            ),
            Text("Bookmark")
          ],
        ),
      ],
    );
  }
}
