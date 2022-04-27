import 'package:flutter/material.dart';

class WidgetDifferentSize extends StatefulWidget {
  const WidgetDifferentSize({Key? key}) : super(key: key);

  @override
  _WidgetDifferentSizeState createState() => _WidgetDifferentSizeState();
}

class _WidgetDifferentSizeState extends State<WidgetDifferentSize> {
  @override
  Widget build(BuildContext context) {
    final double largura =  MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Different Size"),
      ),
      body: IntrinsicHeight( //IntrinsicWidth para width
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: largura / 2,
              color: Colors.orange,
              child: Text("Item 1"),
            ),
            Container(
              width: largura / 2,
              color: Colors.green,
              child: Text(
                  "Mussum Ipsum, cacilds vidis litro abertis. Delegadis gente "
                  "finis, bibendum egestas augue arcu ut est. Si num tem leite "
                  "então bota uma pinga aí cumpadi! Não sou faixa preta cumpadi, "),
            ),
          ],
        ),
      ),
    );
  }
}
