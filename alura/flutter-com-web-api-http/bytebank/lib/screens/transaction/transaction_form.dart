import 'dart:async';
import 'dart:io';

import 'package:bytebank/components/progress.dart';
import 'package:bytebank/components/response_dialog.dart';
import 'package:bytebank/components/transaction_auth_dialog.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/screens/transaction/transaction_list.dart';
import 'package:bytebank/web/http/webclients/transaction_webclient.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TransactionForm extends StatefulWidget {

  final Contact _contact;
  TransactionForm(this._contact);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {

  final TextEditingController _valueController = TextEditingController();
  final TransactionWebClient _webClient = TransactionWebClient();
  final String _transactionId =  Uuid().v4();
  bool _sending = false;

  @override
  Widget build(BuildContext context) {
    print("Transaction Form Id: $_transactionId");
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Transaction"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Progress(text: 'Sending Transaction...', progressIndicator: CircularProgressIndicator(),),
              ),
              visible: _sending,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: ListTile(
                  title: Text(
                    this.widget._contact.nome,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  subtitle: Text(
                    this.widget._contact.numeroConta.toString(),
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                enabled: !_sending,
                controller: _valueController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: "Value",
                  hintText: "0.00",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext contextDialog) {
                          return TransactionAuthDialog(
                            onConfirm: (password) {
                              print(password);
                              final double? value =
                                  double.tryParse(_valueController.text);
                              _save(value, password, contextDialog);
                            },
                          );
                        });
                  },
                  child: Text("Transferir"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _save(
    double? value,
    String password,
    BuildContext context,
  ) async {
    await _send(value, password, context);
    await _onSuccessTransaction();
  }

  Future<void> _onSuccessTransaction() async {
    await showDialog(
          context: context,
          builder: (contextDialog) {
            return SuccessDialog("Successful Transaction");
          });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (builder) {
        return TransactionList();
      }),
    );
  }

  Future<Transaction> _send(double? value, String password, BuildContext contextDialog) async {
    _showProgress();
    Navigator.of(contextDialog).pop();
    return await _webClient.save(Transaction(value!.toDouble(), widget._contact, _transactionId), password)
        .catchError((e) => _catchErrorTransaction(message: e.message),
          test: (e) => e is HttpException)
        .catchError((ex) => _catchErrorTransaction(message: "Connection Failed Check Your Network!!!"),
          test: (e) =>  e is TimeoutException || e is SocketException)
        .catchError((e) => _catchErrorTransaction(), test: (e) => e is Exception )
      .whenComplete(() => _hideProgress());
  }

  void _hideProgress(){
    _showProgress(show: false);
  }
  void _showProgress({show = true}) {
    setState((){
      _sending = show;
    });
  }

  FutureOr<Transaction> _catchErrorTransaction({String message = "Unknown Error"}) async{
    return await showDialog(
      context: context,
      builder: (contextDialog) {
        return FailureDialog(message);
    });
  }
}
