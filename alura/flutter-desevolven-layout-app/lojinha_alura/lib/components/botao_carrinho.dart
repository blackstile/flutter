import 'package:flutter/material.dart';
import 'package:lojinha_alura/components/badge_cart_button.dart';
import 'package:lojinha_alura/main.dart';

class BotaoCarrinho extends StatefulWidget {
  const BotaoCarrinho({Key? key}) : super(key: key);

  @override
  State<BotaoCarrinho> createState() => _BotaoCarrinhoState();
}

class _BotaoCarrinhoState extends State<BotaoCarrinho> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/carrinho',
        ).then((value) => setState((){}));
      },
      child: Container(
        alignment: Alignment.centerRight,
        height: 40,
        padding: EdgeInsets.only(right: 20, left: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            )),
        child: Stack(
          children: [
            Image.asset(
              'utilidades/assets/icones/carrinho.png',
              height: 30,
            ),
            Inicio.itemsCart.length > 0 ? BadgeCartButton() : BadgeCartButton.transparentBadge(),
          ],
        ),
      ),
    );
  }
}
