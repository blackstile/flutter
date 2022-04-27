class Contact {
  final int? id;
  final String nome;
  final int numeroConta;

  static const TABLE_NAME = 'contacts';
  static const String FIELD_ID = 'id';
  static const String FIELD_NAME = 'name';
  static const String FIELD_ACCOUNT_NUMBER = 'account_number';

  Contact({this.id, required this.nome, required this.numeroConta});

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> contactMap = Map();
    contactMap[FIELD_NAME] = this.nome;
    contactMap[FIELD_ACCOUNT_NUMBER] = this.numeroConta;
    return contactMap;
  }

  static Contact fromMap(Map<String, dynamic> contactMap) {
    return Contact(
        id: contactMap[FIELD_ID],
        nome: contactMap[FIELD_NAME],
        numeroConta: contactMap[FIELD_ACCOUNT_NUMBER]);
  }

  @override
  String toString() {
    return "Contact {Id: $id Nome: $nome \r\n Numero da conta: $numeroConta}";
  }
}
