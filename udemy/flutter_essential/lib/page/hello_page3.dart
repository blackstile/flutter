import 'package:flutter/material.dart';
import 'package:flutter_essential/widget/button_azul.dart';

class HelloPage3 extends StatelessWidget {
  const HelloPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Page 3",
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: CustomButton(label: "Voltar", onClick: () => _onClick(context),),
    );
  }

  _onClick(context) {
    return Navigator.pop(context, "Tela 3");
  }
}