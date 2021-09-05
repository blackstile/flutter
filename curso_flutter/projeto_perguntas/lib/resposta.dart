import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;
  final Function callback;

  Resposta(this.resposta, this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(this.resposta), 
        onPressed: callback)
    );
  }
}
