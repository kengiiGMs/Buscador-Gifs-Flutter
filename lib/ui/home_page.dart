import 'package:buscador_gifs/ui/gif_page.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String key = "";
  String defaultURL = "";
  String specificURL = "";

  String? _search;
  int _offset = 0;

  @override
  void initState() {
    super.initState();
    getFileEnv();
  }

  Future<void> getFileEnv() async {
    await dotenv.load(fileName: ".env");
    setState(() {
      key = dotenv.env['API_KEY'] ?? "";
    });
    setUrls();
  }

  setUrls() {
    setState(() {
      if (key != "") {
        defaultURL =
            "https://api.giphy.com/v1/gifs/trending?api_key=$key&limit=20&offset=20&rating=g&bundle=messaging_non_clips";
        specificURL =
            "https://api.giphy.com/v1/gifs/search?api_key=$key&q=$_search&limit=19&offset=$_offset&rating=g&lang=en&bundle=messaging_non_clips";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset("images/logo.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Pesquise Aqui !",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: GridView(
              padding: EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              children: [
                GestureDetector(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image:
                        "https://media.giphy.com/media/OYbeDEzHWFU28nLOJC/giphy.gif",
                    height: 300.0,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GifPage()),
                    );
                  },
                ),
                GestureDetector(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image:
                        "https://media.giphy.com/media/OYbeDEzHWFU28nLOJC/giphy.gif",
                    height: 300.0,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GifPage()),
                    );
                  },
                ),
                GestureDetector(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image:
                        "https://media.giphy.com/media/OYbeDEzHWFU28nLOJC/giphy.gif",
                    height: 300.0,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GifPage()),
                    );
                  },
                ),
                Text(defaultURL),
                Text(specificURL),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
