import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Course',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Frase do Dia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _numeroAleatorio = Random().nextInt(7);
  List _frases = [
    'O importante não é vencer todos os dias, mas lutar sempre.',
    'É melhor conquistar a sim mesmo do que vencer mil batalhas',
    'O medo de perder tira a vontade de vencer',
    'Perder para a razão, sempre é ganhar',
    'Nas grandes batalhas, o primeiro passo para a vitória é o desejo de vençer',
    'Nenhum obstáculo será grande, se sua vontade de vencer for maior',
    'A luta não começa quando você entra no ringue, mas sim na sua preparação'
  ];

  void __gerarFrase() {
    setState(() {
      int anterior = _numeroAleatorio;
      while (anterior == _numeroAleatorio){
        _numeroAleatorio = Random().nextInt(7);
        print("Numero selecionado: $_numeroAleatorio");
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pressione o botão para gerar uma frase:',
            ),
            Text(
              _frases[_numeroAleatorio],
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: __gerarFrase,
        tooltip: 'Gerador de frase',
        child: Icon(Icons.comment),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
