
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          CircularProgressIndicator(
            color: Colors.deepOrange,
            backgroundColor: Colors.deepPurpleAccent,
          ),
          // Text("Carregando a configuração da aplicação"),
        ],
      ),
    );
  }
}
