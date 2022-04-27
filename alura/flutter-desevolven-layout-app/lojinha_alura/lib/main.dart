import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lojinha_alura/color_palettes.dart';
import 'package:lojinha_alura/components/app_bar_customizada.dart';
import 'package:lojinha_alura/screens/shopping_cart.dart';

import 'components/product_grid.dart';
import 'model/item_cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/carrinho": (context) => ShoppingCart(),
      },
      title: 'Lojinha Alura',
      theme: ThemeData(
        primarySwatch: ColorPalettes.lilas,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 20, fontFamily: 'Alata', fontWeight: FontWeight.bold, color: Colors.black),
          headline2: TextStyle(fontSize: 20, fontFamily: 'Alata', fontWeight: FontWeight.bold, color: Colors.white),
          headline3: TextStyle(fontSize: 16, fontFamily: 'Alata', fontWeight: FontWeight.bold, color: ColorPalettes.lilas),
          headline4: TextStyle(fontSize: 20, fontFamily: 'Alata', fontWeight: FontWeight.bold, color: Colors.black),
          headline5: TextStyle(fontSize: 20, fontFamily: 'Alata', fontWeight: FontWeight.w500, color: ColorPalettes.lilas),
        )
      ),
      home: Inicio(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Inicio extends StatefulWidget {
  static List<ItemCart> itemsCart = [];
  static final NumberFormat currencyFormat =  NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final List moveis = [
    {
      "titulo": "Mesa",
      "preco": 300.0,
      "foto": "movel1.jpeg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Cadeira",
      "preco": 120.0,
      "foto": "movel2.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Manta",
      "preco": 200.0,
      "foto": "movel3.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Sofá Cinza",
      "preco": 800.0,
      "foto": "movel4.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Mesa de cabeceira",
      "preco": 400.0,
      "foto": "movel5.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Jogo de Cama",
      "preco": 250.0,
      "foto": "movel6.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Sofá Branco",
      "preco": 90.0,
      "foto": "movel7.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBarCustomizada(
        titulo: "Lojinha Alura",
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Divider(),
                  margin:
                      EdgeInsets.only(left: 30, right: 20, bottom: 10, top: 10),
                ),
              ),
              Text(
                "Produtos",
                style: TextStyle(fontSize: 16),
              ),
              Expanded(
                child: Container(
                  child: Divider(),
                  margin:
                      EdgeInsets.only(left: 20, right: 30, bottom: 10, top: 10),
                ),
              ),
            ],
          ),
          Flexible(
            child: ProductGrid(moveis: moveis, onUpdate: _onUpdate),
          ),
        ],
      ),
    );
  }

  _onUpdate(){
    setState(() {

    });
  }
}
