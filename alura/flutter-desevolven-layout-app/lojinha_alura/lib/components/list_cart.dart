import 'package:flutter/material.dart';
import 'package:lojinha_alura/main.dart';
import 'package:lojinha_alura/model/item_cart.dart';
import 'package:lojinha_alura/model/movel.dart';

class ListCart extends StatefulWidget {
  final Function? onUpdate;
  ListCart({Key? key, this.onUpdate}) : super(key: key);

  @override
  State<ListCart> createState() => _ListCartState();
}

class _ListCartState extends State<ListCart> {
  final List<ItemCart> _carrinho = Inicio.itemsCart;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Inicio.itemsCart.length,
        itemBuilder: (context, index) {
          ItemCart itemCart = _carrinho[index];
          Movel movel = itemCart.movel;
          return Container(
            margin: EdgeInsets.all(16),
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'utilidades/assets/imagens/${movel.foto}',
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(movel.titulo, style: Theme.of(context).textTheme.headline3,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Inicio.currencyFormat.format(movel.preco)),
                              Row(
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      child: Icon(
                                        Icons.add,
                                        size: 14,
                                      ),
                                    ),
                                    onTap: ()=> _aumentaQuantidade(itemCart),
                                  ),
                                  Text("${itemCart.quantidade}"),
                                  GestureDetector(
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      child: Icon(
                                        Icons.remove,
                                        size: 14,
                                      ),
                                    ),
                                    onTap: ()=> _diminuiQuantidade(itemCart),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _aumentaQuantidade(ItemCart itemCart) {
    setState(() {
      itemCart.quantidade++;
      if (widget.onUpdate != null){
        widget.onUpdate!();
      }
    });
  }

  void _diminuiQuantidade(ItemCart itemCart) {
    if (itemCart.quantidade > 1){
      setState(() {
        itemCart.quantidade--;
        if (widget.onUpdate != null){
          widget.onUpdate!();
        }
      });
    }else{
      _removeMovel(itemCart);
    }
  }
  _removeMovel(ItemCart itemCart){
    Inicio.itemsCart.remove(itemCart);
    setState(() {
      if (widget.onUpdate != null){
        widget.onUpdate!();
      }
    });
  }
}
