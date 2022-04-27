import 'package:flutter/material.dart';

class TitleItemProductGrid extends StatelessWidget {

  final String title;
  const TitleItemProductGrid({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(child: Text(title, style: Theme.of(context).textTheme.headline2,), bottom: 10, );
  }
}
