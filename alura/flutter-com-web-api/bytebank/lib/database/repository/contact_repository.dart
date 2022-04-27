import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ContactRepository {



  static const String sqlCreateTable = 'CREATE TABLE ${Contact.TABLE_NAME} ( '
      '${Contact.FIELD_ID} INTEGER PRIMARY KEY, '
      '${Contact.FIELD_NAME} TEXT, '
      '${Contact.FIELD_ACCOUNT_NUMBER} INTEGER )';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase(sqlCreateTable);
    return db.insert(Contact.TABLE_NAME, contact.toMapDB());
  }

  Future<List<Contact>> findAll() async{
    final Database db = await getDatabase(sqlCreateTable);
    final List<Map<String, dynamic>> result =  await db.query(Contact.TABLE_NAME);
    debugPrint("result findAll ${result}");
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      contacts.add(Contact.fromMapDB(row));
    }
    return contacts;
  }

}