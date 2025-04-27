import 'package:flutter/material.dart';
import 'package:buscador_gifs/ui/gif_page.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:share_plus/share_plus.dart';

Widget gifListCustom(
  BuildContext context,
  AsyncSnapshot snapshot,
  int Function(List) getCount,
  String? search,
  VoidCallback loadMore,
) {
  return GridView.builder(
    padding: EdgeInsets.all(10.0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
    ),
    itemCount: getCount(snapshot.data["data"]),
    itemBuilder: (context, index) {
      if (search == null || index < snapshot.data["data"].length) {
        return GestureDetector(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image:
                snapshot.data["data"][index]["images"]["fixed_height"]["url"],
            height: 300.0,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GifPage(snapshot.data["data"][index]),
              ),
            );
          },
          onLongPress: () {
            Share.share(
              snapshot.data["data"][index]["images"]["fixed_height"]["url"],
            );
          },
        );
      } else {
        return GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white, size: 70.0),
              Text(
                "Carregar mais...",
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
            ],
          ),
          onTap: () {
            loadMore();
          },
        );
      }
    },
  );
}
