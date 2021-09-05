import 'package:ecommerce/blocs/cart_bloc.dart';
import 'package:ecommerce/blocs/products_bloc.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartPage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Cart"),),
      body: StreamBuilder<List<Product>>(
        stream: _cartBloc.outProducts,
        initialData: [],
        builder: (context, snapshot){
          if(snapshot.data.isEmpty){
            return Center(
              child: Text("no items in cart"),
            );
          }
      
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                final product = snapshot.data[index];
                return ListTile(
                  title: Text(product.name),
                  trailing: Text(product.amount.toString()),
                );
              },
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

}