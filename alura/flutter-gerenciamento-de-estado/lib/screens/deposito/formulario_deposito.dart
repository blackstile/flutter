import 'package:bytebank/components/editor.dart';
import 'package:bytebank/components/saldo_card.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FormularioDeposito extends StatelessWidget {
  final  _tituloAppBar = "Receber Depósito";
  final _dicaCampoValor = '0.0';
  final TextEditingController _controladorCampoValor =  TextEditingController();

  FormularioDeposito({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                  dica: _dicaCampoValor,
                  controlador: _controladorCampoValor,
                  rotulo: "Valor",
                  icone: Icons.monetization_on),
              ElevatedButton(
                onPressed: ()=> _critaDeposito(context),
                child: Text("Confirmar"),
              )
            ],
          ),
        ));
  }

  _critaDeposito(BuildContext context) {
    final double valorDeposito =  double.tryParse(_controladorCampoValor.text);
    final depositoValido =  _validaDeposito(valorDeposito);
    if (depositoValido) {
      _atualizaEstado(context, valorDeposito);
      Navigator.pop(context);
    }
  }
  bool _validaDeposito(valor){
    return valor != null;
  }

  void _atualizaEstado(BuildContext context, double valorDeposito) {
    Provider.of<Saldo>(context, listen: false).adiciona(valorDeposito);
  }
}
