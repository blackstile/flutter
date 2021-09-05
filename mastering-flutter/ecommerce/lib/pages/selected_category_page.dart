import 'package:ecommerce/blocs/cart_bloc.dart';
import 'package:ecommerce/blocs/products_bloc.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/widgets/bloc_provider.dart';
import 'package:ecommerce/widgets/cart_button.dart';
import 'package:flutter/material.dart';

class SelectedCategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ProductsBloc _productBloc =  BlocProvider.of<ProductsBloc>(context);
    final CartBloc _cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text("New product"),
        actions: <Widget>[
          CartButton()
        ],
      ),
      body: StreamBuilder<List<Product>>(
        stream: _productBloc.outProducts,
        builder: (context, snapshot){
          if (snapshot.hasData){
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                final product = snapshot.data[index];
                return InkWell(
                  onTap: ()=> _cartBloc.addProduct(product),
                  child: Center(
                    child: Text(product.name),
                  ),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }

}