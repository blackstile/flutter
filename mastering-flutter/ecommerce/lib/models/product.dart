class Product {
  
  static const KEY_NAME = "name";
  
  Product.create(this.name);

  String id;
  String name;
  int amount;

  Product.fromFirestore(Map<String, dynamic> json){
    name =  json[KEY_NAME];
  }

  @override
  bool operator == (o) => o is Product && o.name == name && o.id == id;

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}