import 'package:flutter/material.dart';
import 'package:lojinha_alura/components/app_bar_customizada.dart';
import 'package:lojinha_alura/components/product_detail_card.dart';
import 'package:lojinha_alura/model/movel.dart';

class ProductDetails extends StatefulWidget {

  final Movel movel;
  const ProductDetails({Key? key, required this.movel}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: Image.asset("utilidades/assets/imagens/${widget.movel.foto}").image,
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarCustomizada(
          titulo: "",
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.all(16),
            height: 200,
            child: ProductDetailCard(movel: widget.movel, atualizaPagina: atualiza,),
          ),
        ),
      ),
    );
  }

  atualiza(){
    setState(() {

    });
  }
}
