import 'package:carros/model/carro.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  final Carro carro;
  const CarDetails({Key? key, required this.carro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome?? "Não especificado"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Image.network(carro.urlFoto?? "https://autohub.ir/static/newapi/web/img/not_found.png"),
        ),
      ),
    );
  }
}
