import 'package:carros/page/login_page.dart';
import 'package:flutter/material.dart';

import 'page/home_page.dart';

void main() {
  runApp(const CarrosApp());
}

class CarrosApp extends StatelessWidget {
  const CarrosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carros',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginPage(),
    );
  }
}
