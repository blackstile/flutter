import 'package:flutter/material.dart';
import 'package:lojinha_alura/components/title_item_product_grid.dart';
import 'package:lojinha_alura/model/movel.dart';
import 'package:lojinha_alura/screens/product_details.dart';

import 'degrade_item_product_grid.dart';
import 'image_item_prodcut_grid.dart';

class ItemProductGrid extends StatelessWidget {

  final Movel movel;
  final Function? onUpdate;
  const ItemProductGrid({Key? key, required this.movel, this.onUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ProductDetails(movel: movel);
        })).then((value){
          if (onUpdate != null){
            onUpdate!();
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 8,
              color: Colors.black12,
            )
          ]
        ),
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ImageItemProductGrid(
                imagem: movel.foto,
              ),
              DegradeItemProductGrid(),
              TitleItemProductGrid(title: movel.titulo),
            ],
          ),
        ),
      ),
    );
  }
}
