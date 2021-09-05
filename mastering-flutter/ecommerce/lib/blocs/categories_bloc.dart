import 'dart:async';

import 'package:ecommerce/models/category.dart';
import 'package:ecommerce/widgets/bloc_provider.dart' show BlocBase;

class CategoriesBloc extends BlocBase{
  
  List<Category> _categories = List();

  StreamController<List<Category>> _categoriesController =  StreamController<List<Category>>();
  Sink<List<Category>> get _inCategories => _categoriesController.sink;
  Stream<List<Category>> get outCategories => _categoriesController.stream;

  CategoriesBloc(){
    getCategories();
  }

  void getCategories(){
    _categories = this.dbApi.getCategories();
    _inCategories.add(_categories);
  }

  @override
  void dispose() {
    _categoriesController.close();
  }

}