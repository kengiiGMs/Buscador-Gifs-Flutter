import 'package:flutter/material.dart';

class GifPage extends StatelessWidget {
  const GifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Texto do Gif", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(
          "https://media.giphy.com/media/OYbeDEzHWFU28nLOJC/giphy.gif",
        ),
      ),
    );
  }
}
