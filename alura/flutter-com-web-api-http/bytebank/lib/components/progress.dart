
import 'package:flutter/material.dart';

class Progress extends StatelessWidget {

  final String text;
  final ProgressIndicator progressIndicator;

  const Progress({this.text = "Loading...", this.progressIndicator = const LinearProgressIndicator()});


  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          progressIndicator,
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
