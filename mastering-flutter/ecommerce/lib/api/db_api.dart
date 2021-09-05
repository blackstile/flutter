import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/category.dart';
import 'package:ecommerce/models/product.dart';

class DbApi {
  
  final Firestore database =  Firestore.instance;
  
  List<Category> getCategories(){
    try{
      return Category.toListFromFirestoreSnapshot(database.collection("Categories").snapshots());
    }catch(e){
      print(e);
      throw e;
    }
    
  }

  List<Product> getProducts(Category category){
    List<Product> tempList = [
                        Product.create("product 1"),
                        Product.create("product 2"),
                        Product.create("product 3"),
                        Product.create("product 4"),
                        Product.create("product 5"),
                      ];
    return tempList;
  }
}