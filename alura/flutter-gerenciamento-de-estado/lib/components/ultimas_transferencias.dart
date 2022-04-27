import 'package:bytebank/models/transferencias_list.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UltimasTransferencias extends StatelessWidget {
  final int quantidadeMaximoTransferencia;

  UltimasTransferencias({Key key, this.quantidadeMaximoTransferencia = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "Últimas Transfêrencias",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Consumer<TransferenciasList>(
          builder: (context, tranferenciaList, child) {
            if (tranferenciaList.isEmpty()) {
              return CardSemTransferencias();
            }
            final ultimasTransferencias =
                tranferenciaList.transferencias.reversed.toList();
            final itemCount = ultimasTransferencias.length;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: itemCount <= quantidadeMaximoTransferencia
                  ? itemCount
                  : quantidadeMaximoTransferencia,
              itemBuilder: (context, index) {
                return ItemTransferencia(ultimasTransferencias[index]);
              },
            );
          },
        ),
        Consumer<TransferenciasList>(
            builder: (context, tranferenciaList, child) {
          return Visibility(
            visible: tranferenciaList.isNotEmpty(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListaTransferencias(),
                    ),
                  );
                },
                child: Text("Ver todas Transferencias"),
              ),
            ),
          );
        }),
      ],
    );
  }
}

class CardSemTransferencias extends StatelessWidget {
  const CardSemTransferencias({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Você ainda não efetuou nenhuma transfência.",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
