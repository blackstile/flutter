import 'package:flutter/material.dart';
import 'package:loja_virtual_web/widgets/app_bar_mobile.dart';
import 'package:loja_virtual_web/widgets/app_bar_web.dart';
import 'package:loja_virtual_web/widgets/product_item.dart';

class LojaVirtual extends StatefulWidget {
  const LojaVirtual({Key? key}) : super(key: key);

  @override
  _LojaVirtualState createState() => _LojaVirtualState();
}

class _LojaVirtualState extends State<LojaVirtual> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        final double largura = constraint.maxWidth;
        return Scaffold(
          appBar: _appBar(largura),
          body: _body(largura),
        );
      },
    );
  }

  Widget _body(double largura) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: _getTotalNumColumn(largura),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: const [
          ProductItem(descricao: "Kit Multimidia", preco: "2.200,00", imagem: "p1.jpg"),
          ProductItem(descricao: "Pneu Goodyear aro 16", preco: "800,00", imagem: "p2.jpg"),
          ProductItem(descricao: "Samsung 9", preco: "4.100,00", imagem: "p3.jpg"),
          ProductItem(descricao: "Samsung Edge", preco: "2.150,00", imagem: "p4.jpg"),
          ProductItem(descricao: "Galaxy 10", preco: "6.200,00", imagem: "p5.jpg"),
          ProductItem(descricao: "iPhone 10", preco: "7.500,00", imagem: "p6.jpg"),
          ProductItem(descricao: "Kit Multimidia", preco: "2.200,00", imagem: "p1.jpg"),
          ProductItem(descricao: "Pneu Goodyear aro 16", preco: "800,00", imagem: "p2.jpg"),
          ProductItem(descricao: "Samsung 9", preco: "4.100,00", imagem: "p3.jpg"),
          ProductItem(descricao: "Samsung Edge", preco: "2.150,00", imagem: "p4.jpg"),
          ProductItem(descricao: "Galaxy 10", preco: "6.200,00", imagem: "p5.jpg"),
          ProductItem(descricao: "iPhone 10", preco: "7.500,00", imagem: "p6.jpg"),
          ProductItem(descricao: "Kit Multimidia", preco: "2.200,00", imagem: "p1.jpg"),
          ProductItem(descricao: "Pneu Goodyear aro 16", preco: "800,00", imagem: "p2.jpg"),
          ProductItem(descricao: "Samsung 9", preco: "4.100,00", imagem: "p3.jpg"),
          ProductItem(descricao: "Samsung Edge", preco: "2.150,00", imagem: "p4.jpg"),
          ProductItem(descricao: "Galaxy 10", preco: "6.200,00", imagem: "p5.jpg"),
          ProductItem(descricao: "iPhone 10", preco: "7.500,00", imagem: "p6.jpg"),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar(largura) {
    if (largura < 600) {
      return const MobileAppBar();
    }
    return const WebAppBar();
  }

  _getTotalNumColumn(double largura) {
    if (largura <= 600){
      return 2;
    }else if (largura <= 960){
      return 4;
    }
    return 6;
  }
}
