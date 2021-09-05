import 'dart:async';

import 'package:ecommerce/models/category.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/widgets/bloc_provider.dart';

class ProductsBloc extends BlocBase{
  
  List<Product> _products;
  StreamController<List<Product>> _productsController = StreamController<List<Product>>();
  Sink<List<Product>> get _inProducts => _productsController.sink;
  Stream<List<Product>> get outProducts => _productsController.stream;
  
  ProductsBloc(Category category){
    getProducts(category);
  }
  
  void getProducts(Category category){
    _products = this.dbApi.getProducts(category);
    _inProducts.add(_products);
  }

  @override
  void dispose() {
    _productsController.close();
  }

}