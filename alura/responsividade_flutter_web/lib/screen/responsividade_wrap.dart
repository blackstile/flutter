import 'package:flutter/material.dart';

class ResponsividadeWrap extends StatelessWidget {
  const ResponsividadeWrap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var largura = 180.0; //MediaQuery.of(context).size.width;
    var altura = 200.0 ;//MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Responsividade Wrap Widget"),
      ),
      body: Container(
        color: Colors.blueGrey[400],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top,
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          runAlignment: WrapAlignment.spaceAround,
          runSpacing: 10,
          spacing: 10,
          children: [
            Container(
              width: largura,
              height: altura,
              color: Colors.purple,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.greenAccent,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.orange,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.blue,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.red,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.lightGreen,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.purple,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.greenAccent,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
