import 'dart:convert';

import 'package:buscador_de_gifs/ui/gif_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

final String _apiKey = "Hf1w2SwbFishPoPm0JjrVHHuQGuHLKQq";
final String _baseUrl = "https://api.giphy.com/v1/gifs";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offset = 0;
  int _limit = 7;

  Future<Map> _getGifs() async {
    String url = "$_baseUrl/trending?api_key=$_apiKey&limit=$_limit&rating=G";
    if (_search != null) {
      url =
          "$_baseUrl/search?api_key=$_apiKey&q=$_search&limit=$_limit&offset=$_offset&rating=G&lang=en";
    }
    print(url);
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    // _getGifs().then((resp) => print(resp));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
            "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Pesquisar Imagens",
                labelStyle: TextStyle(color: Colors.white),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              onSubmitted: (text) {
                setState(() {
                  if (text.isNotEmpty) {
                    _search = text;
                  } else {
                    _search = null;
                  }
                  _offset = 0;
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
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
                        strokeWidth: 5,
                      ),
                    );
                  default:
                    if (snapshot.hasError) {
                      return Container();
                    }
                    return _createGridView(context, snapshot);
                }
              },
              future: _getGifs(),
            ),
          ),
        ],
      ),
    );
  }

  int _getCount(List data) {
    if (_search == null) {
      return data.length;
    }
    return data.length + 1;
  }

  Widget _createGridView(BuildContext context, AsyncSnapshot snapshot) {
    List listGifs = snapshot.data["data"];
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: _getCount(listGifs),
      itemBuilder: (context, index) {
        String url = "";
        if (_search == null || listGifs.length > index) {
          url = listGifs[index]["images"]["fixed_height"]["url"];
          return GestureDetector(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,              
              image: url,
              height: 300.0,
              fit: BoxFit.cover,
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PageGif( listGifs[index])));
            },
            onLongPress: (){
              Share.share(url);
            },
          );
        }
        return Container(
          child: GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.add_a_photo, size: 70.0, color: Colors.white),
                Text(
                  "Carregar Mais...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                  ),
                ),
              ],
            ),
            onTap: () {
              setState(() {
                _offset += _limit;
              });
            },
          ),
        );
      },
    );
  }
}
