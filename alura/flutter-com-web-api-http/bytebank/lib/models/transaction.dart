import 'contact.dart';

class Transaction {
  final String id;
  final double value;
  final Contact contact;
  Transaction(this.value, this.contact, this.id);

  static List<Transaction> fromJsonList(List<dynamic> maps){
    return maps.map((transactionMap) => Transaction.fromJson(transactionMap)).toList();
  }

  Transaction.fromJson(Map<String, dynamic> map) :
    value = map['value'],
    id = map['id'],
    contact = Contact.fromJson( map['contact']);

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'value' : value,
      'contact': contact.toJson(),
    };
  }
}