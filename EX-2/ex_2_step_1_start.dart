import 'package:flutter/material.dart';

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FavoriteCardState();
  }
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;
  IconData get getIcon => isFavorite ? Icons.favorite : Icons.favorite_border;
  Color? get getIconColor => isFavorite ? Colors.red : null;

  @override
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
                Text('title', style: TextStyle(color: Colors.blue)),
                Text('description'),
              ],
            ),
          ),
          IconButton(
            onPressed: () => {
              setState(() {
                if (isFavorite) {
                  isFavorite = false;
                } else {
                  isFavorite = true;
                }
              }),
            },
            icon: Icon(getIcon, color: getIconColor,),
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
