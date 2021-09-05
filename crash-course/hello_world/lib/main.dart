import 'package:flutter/material.dart';

main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World')
        ),
        body: Text("This is some text. Welcome to my app!"),
      ),
    )
  );
}