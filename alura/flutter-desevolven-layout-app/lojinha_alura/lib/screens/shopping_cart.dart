import 'package:flutter/material.dart';
import 'package:lojinha_alura/components/app_bar_customizada.dart';
import 'package:lojinha_alura/components/list_cart.dart';
import 'package:lojinha_alura/main.dart';
import 'package:lojinha_alura/model/item_cart.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBarCustomizada(
        titulo: "Carrinho de Compras",
        showChartIcon: false,
      ),
      body: _body(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(24),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total: ", style: Theme.of(context).textTheme.headline4,),
            Text(Inicio.currencyFormat.format(_calculaTotal()), style: Theme.of(context).textTheme.headline5)
          ],
        ),
      ),
    );
  }

  Widget _body(){
    return Inicio.itemsCart.isNotEmpty ? _showListCart() : _showCartEmpty();
  }

  Center _showCartEmpty() {
    return Center(
    child: Container( padding: EdgeInsets.all(24),
        child: Text("Você ainda não adicionou nenhum produto :(",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5,),
    ),
  );
  }

  ListCart _showListCart() {
    return ListCart(
      onUpdate: _atualiza,
    );
  }
  void _atualiza(){
    setState(() {
    });
  }

  double _calculaTotal(){
    final List<ItemCart> itens =  Inicio.itemsCart;
    if (itens.isNotEmpty){
      return itens.map((item) => item.quantidade *  item.movel.preco).reduce((currentValue, newValue) => currentValue + newValue);
    }
    return 0;

  }
}
