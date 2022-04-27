import 'package:bytebank/screens/dashboard.dart';
import 'package:bytebank/web/http/webclients/webclient.dart';
import "package:flutter/material.dart";

import 'models/contact.dart';
import 'models/transaction.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
              primary:  Colors.green[900],
              secondary: Colors.blueAccent[700],
          ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.blueAccent[700])
          ),
        )
      ),home: Dashboard(),
    );
  }
}


/**

    primaryColor: Colors.green[900],
    accentColor: Colors.blueAccent[700],
    appBarTheme: AppBarTheme(
    centerTitle: true,

*/