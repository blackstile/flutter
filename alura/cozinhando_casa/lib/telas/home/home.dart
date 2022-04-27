import 'dart:convert';

import 'package:cozinhando_casa/models/receita.dart';
import 'package:cozinhando_casa/telas/detalhes/detalhes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) => _createHome();

  Widget _createHome() {
    return Scaffold(
      appBar: _createAppBar(),
      body: _createListCard(),
    );
  }

  AppBar _createAppBar() => AppBar(title: const Text("Cozinhando em Casa"));

  Widget _createListCard() {
    return FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString("assets/receitas.json"),
        builder: (context, snapshot) {
          List<dynamic> receitas = json.decode(snapshot.data.toString());
          return ListView.builder(
            itemBuilder: (context, index) =>
                _createCard(Receita.fromJson(receitas[index])),
            itemCount: receitas.length,
          );
        });
  }

  Widget _createCard(Receita receita) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return DetalhesReceita(receita);
            }),
          );
        },
        child: SizedBox(
          height: 300,
          child: Card(
            margin: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    _createImageCard(receita.foto),
                    _createGradient(),
                    _createTextCard(receita.titulo),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }

  Widget _createGradient() {
    return Container(
      height: 268,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Colors.transparent, Colors.deepOrange],
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
        ),
      ),
    );
  }

  Widget _createTextCard(String name) {
    return Positioned(
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 24.0,
          color: Colors.white,
        ),
      ),
      bottom: 10,
      left: 10,
    );
  }

  Widget _createImageCard(String photo) {
    return Image.asset(
      photo,
      fit: BoxFit.fill,
      height: 268,
    );
  }
}
