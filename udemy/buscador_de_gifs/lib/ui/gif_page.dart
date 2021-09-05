import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class PageGif extends StatelessWidget {
  Map gifData;
  String _imageUrl;
  String _imageTitle;

  PageGif(Map gifData){
    this.gifData =  gifData;
    _imageUrl = this.gifData["images"]["fixed_height"]["url"];
    _imageTitle = this.gifData["title"];
  }
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(_imageTitle),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(_imageUrl);
            },
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: CachedNetworkImage(
            imageUrl: _imageUrl,
            alignment: Alignment.center,
            placeholder: (context, url) => CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
            ),
            errorWidget: (context, url, error) =>
                Text("Ocorreu um erro ao tentar baixar a imagem."),
          ),
        ),
      ),
    );
  }
}
