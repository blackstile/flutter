
import 'dart:convert';

import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/web/http/webclients/webclient.dart';
import 'package:http/http.dart';

class TransactionWebClient{

  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(url).timeout(Duration(seconds: 25));
    return Transaction.fromJsonList(jsonDecode(response.body));
  }

  Future<Response> save(Transaction transaction) async {
    Response response = await client.post(
      url,
      headers: {'Content-type': 'application/json', 'password': '1000'},
      body: jsonEncode(transaction.toJson()),
    );
    return response;
  }
}