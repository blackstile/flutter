import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _totalPontuacao = 0;
  final _perguntas = [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'Branco', 'pontuacao': 5},
        {'texto': 'Preto', 'pontuacao': 3},
        {'texto': 'Amarelo', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': [
        {'texto':'Cachorro', 'pontuacao': 5},
        {'texto':'Macaco', 'pontuacao': 1},
        {'texto':'Girafa', 'pontuacao': 3},
        {'texto':'Elefante', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
        {'texto':'Maria', 'pontuacao': 1},
        {'texto':'Leo', 'pontuacao': 3},
        {'texto':'William', 'pontuacao': 10},
        {'texto':'João', 'pontuacao': 5},
      ],
    }
  ];
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _totalPontuacao +=  pontuacao;
      });
    }
    print(_totalPontuacao);
  }

  void _onRestart() {
    setState(() {
      _perguntaSelecionada = 0;
      _totalPontuacao = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: this._perguntas,
                perguntaSelecionada: this._perguntaSelecionada,
                quandoResponder: this._responder,
              )
            : Resultado(
                pontuacaoTotal: _totalPontuacao,
                onRestart: _onRestart,
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() {
    return _PerguntaAppState();
  }
}
