import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lojinha_alura/components/text_detail.dart';
import 'package:lojinha_alura/main.dart';
import 'package:lojinha_alura/model/item_cart.dart';
import 'package:lojinha_alura/model/movel.dart';

class ProductDetailCard extends StatelessWidget {
  final Movel movel;
  final Function atualizaPagina;

  ProductDetailCard({Key? key, required this.movel, required this.atualizaPagina}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextDetail(text: movel.titulo, style: Theme.of(context).textTheme.headline1),
          TextDetail(text: movel.descricao),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Inicio.currencyFormat.format(movel.preco), style: Theme.of(context).textTheme.headline1,),
                ElevatedButton(onPressed: (){
                  _checkListItemCart(ItemCart(movel, 1));
                }, child: Text("Comprar", style: TextStyle(color: Colors.white),),),
              ],
            ),
          )
        ],
      ),
    );
  }
  
  _addItemCart(ItemCart item){
    Inicio.itemsCart.add(item);
    atualizaPagina();
  }
  void _checkListItemCart(ItemCart item){
    List<ItemCart> itens = Inicio.itemsCart;
    var indexMovel = itens.indexWhere((currentItem) => currentItem.movel == item.movel);
    if (indexMovel >=0){
      itens[indexMovel].quantidade++;
    }else{
      _addItemCart(item);
    }
  }
}
