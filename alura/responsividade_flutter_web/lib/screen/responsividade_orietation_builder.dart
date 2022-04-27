import 'package:flutter/material.dart';

class ResponsividadeOrientationBuilder extends StatelessWidget {
  const ResponsividadeOrientationBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Responsividade Orientation Builder Widget"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          var isPortrait = Orientation.portrait == orientation;
          return GridView.count(
            crossAxisCount: isPortrait ? 2 : 3,
            children: [
              Container(
                color: Colors.purple,
              ),
              Container(
                color: Colors.greenAccent,
              ),
              Container(
                color: Colors.orange,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.lightGreen,
              ),
            ],
          );
        },
      ),
    );
  }
}
