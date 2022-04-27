import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {

  final String descricao;
  final String preco;
  final String imagem;

  const ProductItem({Key? key, required this.descricao, required this.preco, required this.imagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/img/${imagem}', fit: BoxFit.contain,), flex: 8,),
          Expanded(child: Text(this.descricao), flex: 1,),
          Expanded(child: Text("R\$ ${this.preco}"), flex: 1,),
        ],
      ),
    );
  }
}
