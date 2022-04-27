 import 'package:flutter/material.dart';

import 'hello_listvew.dart';

class DogDetails extends StatelessWidget {
  final Dog dog;
  const DogDetails({Key? key, required this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog: ${dog.nome}"),
        centerTitle: true,
      ),
      body: Image.asset("assets/images/${dog.foto}"),
    );
  }
}
