import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/models/transferencias_list.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Transferências';


class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: Consumer<TransferenciasList>(
        builder: (context, transferenciaLista, child) {
          return ListView.builder(
            itemCount: transferenciaLista.transferencias.length,
            itemBuilder: (context, indice) {
              final transferencia = transferenciaLista.transferencias[indice];
              return ItemTransferencia(transferencia);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.valorToString()),
      subtitle: Text(_transferencia.numeroDaContaToString()),
    ));
  }
}
