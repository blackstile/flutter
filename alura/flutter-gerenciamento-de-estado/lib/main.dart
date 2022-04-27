import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transferencias_list.dart';
import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Saldo(0),),
          ChangeNotifierProvider(create: (context) => TransferenciasList(),),
        ],
        child: BytebankApp(),
      ),
    );

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.green[900],
            secondary: Colors.blueAccent[700],
          ),
          buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.green,
              secondary: Colors.blue,
            ),
            textTheme: ButtonTextTheme.primary,
          )),
      home: Dashboard(),
    );
  }
}
