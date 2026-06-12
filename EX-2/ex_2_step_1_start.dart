import 'package:flutter/material.dart';

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({
    super.key,
    this.title = 'title',
    this.description = 'description',
  });

  final String title;
  final String description;

  @override
  State<StatefulWidget> createState() {
    return _FavoriteCardState();
  }
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  @override
  void toggle() {
    setState(() {
      if (isFavorite) {
        isFavorite = false;
      } else {
        isFavorite = true;
      }
    });
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        spacing: 20,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(widget.title, style: TextStyle(color: Colors.blue)),
                Text(widget.description),
              ],
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.favorite, color: Colors.red),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(children: [FavoriteCard(), FavoriteCard()]),
    ),
  ),
);
