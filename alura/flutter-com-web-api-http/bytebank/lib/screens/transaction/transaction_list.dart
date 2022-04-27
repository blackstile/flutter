import 'package:bytebank/components/not_found.dart';
import 'package:bytebank/components/progress.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/web/http/webclients/transaction_webclient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final TransactionWebClient _webClient = TransactionWebClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transações"),
      ),
      body: FutureBuilder<List<Transaction>>(
        initialData: [],
        future: Future.delayed(Duration(seconds: 1)).then((value) => _webClient.findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress(text: "Carregando transações");
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              List<Transaction> transctions = [];
              if (snapshot.data != null) {
                transctions = snapshot.data as List<Transaction>;
                return ListView.builder(
                    itemCount: transctions.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Transaction transaction = transctions[index];
                      return _TransactionItem(transaction);
                });
              }
          }
          return NotFound("Nenhuma Transação encontrada", Icons.warning);
        },
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final Transaction _transaction;

  _TransactionItem(this._transaction);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(
            _transaction.contact.nome,
            style: TextStyle(fontSize: 16.0),
          ),
          subtitle: Text("R\$ ${_transaction.value.toString()}",
              style: TextStyle(fontSize: 24.0)),
          trailing: Column(
            children: [
              Text("Conta:"),
              Text(_transaction.contact.numeroConta.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
