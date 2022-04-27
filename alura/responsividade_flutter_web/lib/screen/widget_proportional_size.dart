import 'package:flutter/material.dart';

class WidgetProportionalSize extends StatefulWidget {
  const WidgetProportionalSize({Key? key}) : super(key: key);

  @override
  State<WidgetProportionalSize> createState() => _WidgetProportionalSizeState();
}

class _WidgetProportionalSizeState extends State<WidgetProportionalSize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tamanhos proporcionais"),
      ),
      body: Container(
        color: Colors.orange,
        child: const FractionallySizedBox(
          widthFactor: 0.5,
          heightFactor: 0.5,
          alignment: Alignment.topCenter,
          child: Center(child: Text("Tamanho proporcional")),
        ),
      ),
    );
  }
}
