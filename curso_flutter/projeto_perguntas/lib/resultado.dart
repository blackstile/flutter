import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacaoTotal;
  final void Function() onRestart;
  
  Resultado({
    @required this.pontuacaoTotal,
    @required this.onRestart,
  });

  String get fraseResultado {
    if (pontuacaoTotal < 8){
      return 'Parabéns';
    }else if (pontuacaoTotal < 12){
      return 'Você é bom';
    }else if (pontuacaoTotal < 16){
      return 'Você é impressionante';
    }else{
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              fraseResultado,
              style: TextStyle(fontSize: 28),
            ),
          ),
          FlatButton(
            onPressed: onRestart,
            child: Text(
              "Reiniciar?",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
