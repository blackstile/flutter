import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/screens/transaction/transaction_list.dart';
import 'package:bytebank/web/http/webclients/transaction_webclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TransactionForm extends StatelessWidget {
  final TextEditingController _valueController = TextEditingController();
  final Contact _contact;
  final TransactionWebClient _webClient =  TransactionWebClient();
  TransactionForm(this._contact);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Transaction"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: ListTile(
                  title: Text(
                    this._contact.nome,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  subtitle: Text(
                    this._contact.numeroConta.toString(),
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
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
                    final double? value =  double.tryParse(_valueController.text);
                    if (double != null){
                      _webClient.save(Transaction(value!.toDouble(), _contact));
                      Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                        return TransactionList();
                      }),);
                    }
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
}
