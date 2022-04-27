import 'contact.dart';

class Transaction {
  final double value;
  final Contact contact;
  Transaction(this.value, this.contact);

  static List<Transaction> fromJsonList(List<dynamic> maps){
    return maps.map((transactionMap) => Transaction.fromJson(transactionMap)).toList();
  }

  Transaction.fromJson(Map<String, dynamic> map) :
    value = map['value'],
    contact = Contact.fromJson( map['contact']);

  Map<String, dynamic> toJson(){
    return {
      'value' : value,
      'contact': contact.toJson(),
    };
  }
}