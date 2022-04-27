import 'package:flutter/material.dart';

class ResponsividadeMediaQuery extends StatefulWidget {
  const ResponsividadeMediaQuery({Key? key}) : super(key: key);

  @override
  _ResponsividadeMediaQueryState createState() =>
      _ResponsividadeMediaQueryState();
}

class _ResponsividadeMediaQueryState extends State<ResponsividadeMediaQuery> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var appBarSize = AppBar().preferredSize.height;
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var itemHeight = (screenHeight - appBarSize - statusBarHeight) / 2;
    var itemWidth = screenWidth / 3;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsividade"),
      ),
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: itemHeight,
            child: Row(
              children: [
                Container(
                  width: itemWidth,
                  height: itemHeight,
                  color: Colors.red,
                  child: const Text(
                    "Coluna 1",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Container(
                  width: itemWidth,
                  height: itemHeight,
                  color: Colors.black,
                  child: const Text(
                    "Coluna 2",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                Container(
                  width: itemWidth,
                  height: itemHeight,
                  color: Colors.yellow,
                  child: const Text(
                    "Coluna 3",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: itemHeight,
                width: screenWidth,
                color: Colors.purple,
                child: const Text("Container", textAlign: TextAlign.center),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
