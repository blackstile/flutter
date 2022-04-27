import 'package:cozinhando_casa/telas/home/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const CozinhandoEmCasaApp());

class CozinhandoEmCasaApp extends StatelessWidget {
  const CozinhandoEmCasaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          )),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
