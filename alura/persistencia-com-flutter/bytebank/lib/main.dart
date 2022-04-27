import 'package:bytebank/screens/dashboard.dart';
import "package:flutter/material.dart";

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        appBarTheme: AppBarTheme(
          centerTitle: true,
        ),
      ),
      home: Dashboard(),
    );
  }
}
