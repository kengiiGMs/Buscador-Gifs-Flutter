import 'dart:convert';
import 'package:buscador_gifs/components/gif_list_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _key = "";

  String? _search;
  int _offset = 0;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await getFileEnv();
    await _getGifs();
  }

  Future<void> getFileEnv() async {
    await dotenv.load(fileName: "assets/.env");
    setState(() {
      _key = dotenv.env['API_KEY'] ?? "";
    });
  }

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null || _search!.isEmpty) {
      response = await http.get(
        Uri.parse(
          "https://api.giphy.com/v1/gifs/trending?api_key=$_key&limit=20&offset=20&rating=g&bundle=messaging_non_clips",
        ),
      );
    } else {
      response = await http.get(
        Uri.parse(
          "https://api.giphy.com/v1/gifs/search?api_key=$_key&q=$_search&limit=19&offset=$_offset&rating=g&lang=en&bundle=messaging_non_clips",
        ),
      );
    }
    return jsonDecode(response.body);
  }

  int _getCount(List data) {
    if (_search == null) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  void _loadMore() {
    setState(() {
      _offset += 19;
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
              onSubmitted: (text) {
                setState(() {
                  _search = text;
                  _offset = 0;
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _getGifs(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 5.0,
                      ),
                    );
                  default:
                    if (snapshot.hasError) {
                      return Container();
                    } else {
                      return gifListCustom(
                        context,
                        snapshot,
                        _getCount,
                        _search,
                        _loadMore,
                      );
                    }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
