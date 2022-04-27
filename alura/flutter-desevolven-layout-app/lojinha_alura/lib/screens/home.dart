import 'package:flutter/material.dart';
import 'package:lojinha_alura/components/app_bar_customizada.dart';
import 'package:lojinha_alura/model/movel.dart';
import 'package:lojinha_alura/screens/product_details.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBarCustomizada(
        titulo: 'Lojinha Alura',
      ),
      body: TextButton(
        child: Text("Ir para página de detalhes"),
        onPressed: () {
          final Movel movel = Movel(titulo: "Meu produto", foto: "uma foto", descricao: "uma descricao", preco: 0);
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProductDetails(movel: movel,)),
          );
        },
      ),
    );
  }
}
