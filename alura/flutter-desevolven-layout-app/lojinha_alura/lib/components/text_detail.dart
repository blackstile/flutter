import 'package:flutter/material.dart';

class TextDetail extends StatelessWidget {

  final String text;
  TextStyle? style;
  TextDetail({Key? key, required this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.only(
      top: 10, left: 16, right: 16
    ),child: style== null ? Text(text) : Text(text, style: style,));
  }
}
