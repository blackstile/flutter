
import 'dart:convert';

import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/web/http/webclients/webclient.dart';
import 'package:http/http.dart';

class TransactionWebClient{

  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(url);
    return Transaction.fromJsonList(jsonDecode(response.body));
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    print("ip localhost: $localhost");
    print("password: $password");

    await Future.delayed(Duration(seconds: 5));

    Response response = await client.post(
      url,
      headers: {'Content-type': 'application/json', 'password': password},
      body: jsonEncode(transaction.toJson()),
    );

    if (response.statusCode == 200){
      return Transaction.fromJson(jsonDecode(response.body));
    }

    throw _getExceptionHttpError(response.statusCode);
  }

  Exception _getExceptionHttpError(int statusCode) => HttpException(_mapStatusCodeReponseError[statusCode]?? "Unknown Exception");

  static final Map<int, String> _mapStatusCodeReponseError = {
    400 : "Transcation Invalid.",
    401 : "Authentication Failed",
    409 : "Transaction Always Exists",
    500 : "Generic Exception",
  };
}

class HttpException implements Exception {
  final String message;
  HttpException(this.message);
}