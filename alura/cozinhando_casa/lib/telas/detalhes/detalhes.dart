import 'package:cozinhando_casa/models/receita.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DetalhesReceita extends StatelessWidget {
  final Receita _receita;

  const DetalhesReceita(this._receita, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_receita.titulo),
      ),
      body: ListView(
        children: [
            _createImageTop(_receita.foto),
            _createTitleReceipe(_receita.titulo),
            _createRowDetail(_receita.porcoes, _receita.tempoPreparo),
            _createSubTitle("Ingredientes"),
            _createTextBody(_receita.ingredientes),
            _createSubTitle("Modo de preparo"),
            _createTextBody(_receita.modoPreparo),
        ],
      ),
    );
  }

  Widget _createImageTop(String image) {
    return SizedBox(
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
      height: 200,
    );
  }

  Widget _createTextBody(String text){
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Text(text, style: const TextStyle(
        fontSize: 18.0,
      ),),
    );
  }

  Widget _createTitleReceipe(String title) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
          title,
          style: const TextStyle(
            color: Colors.deepOrange,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
    ),
        ),
      );
  }

  Widget _createSubTitle(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(text, style: const TextStyle(fontSize: 24.0)),
      ),
    );
  }

  Widget _createRowDetail(String qtde, String timeToFinish) {
    return Row(
      children: [
        _createColumnIconDetails(Icons.timer, timeToFinish),
        _createColumnIconDetails(Icons.restaurant, "$qtde porções"),
      ],
    );
  }

  Widget _createColumnIconDetails(IconData icon, String text) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: Colors.deepOrange),
          Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.deepOrange),
          ),
        ],
      ),
    );
  }
}
