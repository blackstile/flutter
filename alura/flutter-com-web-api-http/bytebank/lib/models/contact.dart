import 'package:flutter/cupertino.dart';

class Contact {
  final String? id;
  final String nome;
  final int numeroConta;

  static const TABLE_NAME = 'contacts';
  static const String FIELD_ID = 'id';
  static const String FIELD_NAME = 'name';
  static const String FIELD_ACCOUNT_NUMBER = 'account_number';
  static const String WS_FIELD_ACCOUNT_NUMBER = 'accountNumber';

  Contact({this.id, required this.nome, required this.numeroConta});

  Map<String, dynamic> toMapDB() {
    final Map<String, dynamic> contactMap = Map();
    contactMap[FIELD_NAME] = this.nome;
    contactMap[FIELD_ACCOUNT_NUMBER] = this.numeroConta;
    return contactMap;
  }

  static Contact fromMapDB(Map<String, dynamic> contactMap) {
    return Contact(
        id: contactMap[FIELD_ID].toString(),
        nome: contactMap[FIELD_NAME],
        numeroConta: contactMap[FIELD_ACCOUNT_NUMBER]);
  }

  Map<String, dynamic> toJson() =>
      {
        FIELD_NAME: this.nome,
        WS_FIELD_ACCOUNT_NUMBER: this.numeroConta
      };

  Contact.fromJson(Map<String, dynamic> contactMap)
      :
        id = contactMap[FIELD_ID],
        nome = contactMap["name"],
        numeroConta = contactMap["accountNumber"];

  @override
  String toString() {
    return "Contact {Id: $id Nome: $nome \r\n Numero da conta: $numeroConta}";
  }
}
