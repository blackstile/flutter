import 'package:bytebank/components/saldo_card.dart';
import 'package:bytebank/components/ultimas_transferencias.dart';
import 'package:bytebank/screens/deposito/formulario_deposito.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ByteBank"),
        ),
        body: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SaldoCard(),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return FormularioDeposito();
                        },
                      ),
                    );
                  },
                  child: Text("Receber Deposito"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormularioTransferencia(),
                      ),
                    );
                  },
                  child: Text("Fazer Transferencia"),
                )
              ],
            ),
            UltimasTransferencias(quantidadeMaximoTransferencia: 5,),
          ],
        ));
  }
}
