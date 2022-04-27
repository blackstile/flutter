import 'package:flutter/material.dart';
import 'package:lojinha_alura/components/item_product_grid.dart';
import 'package:lojinha_alura/model/movel.dart';


class ProductGrid extends StatelessWidget {

  final List moveis;

  final Function? onUpdate;
  const ProductGrid({Key? key, required this.moveis, this.onUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemCount: moveis.length,
      itemBuilder: (BuildContext context, int index){
        final movel = Movel.fromJson(moveis[index]);
        return ItemProductGrid(movel: movel, onUpdate: onUpdate);
      },
    );
  }
}
