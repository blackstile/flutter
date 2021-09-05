import 'package:cloud_firestore/cloud_firestore.dart';

class Category {

  static const NAME_KEY = "name";

  String id;
  String name;

  Category(){
    name = "motherboard";
  }

  Category.fromFirebase(Map<String, dynamic> json){
    name =  json[NAME_KEY];
  }

  static List<Category> toListFromFirestoreSnapshot(Stream<QuerySnapshot> data){
    List<Category> categories =  List();
    data.listen((snapshot){
      print(snapshot.documents.length);
      for (DocumentSnapshot doc in snapshot.documents) {
        final category = Category.fromFirebase(doc.data);
        category.id =  doc.documentID;
        categories.add(category);
      }
    });
    return categories;
  }
}