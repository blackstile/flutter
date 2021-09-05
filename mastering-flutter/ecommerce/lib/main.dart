import 'package:ecommerce/blocs/cart_bloc.dart';
import 'package:ecommerce/blocs/categories_bloc.dart';
import 'package:ecommerce/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() => runApp(BlocProvider<CartBloc>(child: MyApp(), bloc: CartBloc(),));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CategoriesBloc>(
        bloc: CategoriesBloc(),
        child: HomePage()),
    );
  }
}