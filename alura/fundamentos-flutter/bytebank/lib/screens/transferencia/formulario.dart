import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormularioTransferenciaState();
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();


  @override
  Widget build(BuildContext context) {
    const _rotuloCampoNumeroConta = "Numero da Conta";
    const _dicaCampoNumeroConta = "0000";
    const _rotuloCampoValor = "valor";
    const _dicaCampoValor = "0.00";
    final _labelButtonConfirmar = "Confirmar";

    final _titleScreenFormulario = "Criando Transferência";
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleScreenFormulario),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              _controladorNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
            ),
            Editor(
              _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text(_labelButtonConfirmar),
              onPressed: () => _criarTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    final _labelBotaoFecharSnackBar = 'Fechar';

    if (valor != null && numeroConta != null) {
      final Transferencia transferenciaCriada =
      Transferencia(valor, numeroConta);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(transferenciaCriada.toString()),
          action: SnackBarAction(
            label: _labelBotaoFecharSnackBar,
            onPressed: () {},
          ),
        ),
      );
      Navigator.pop(context, transferenciaCriada);
    }
  }
}