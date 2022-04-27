import 'package:flutter/material.dart';

class ResponsivdadeColumnAndRow extends StatefulWidget {
  const ResponsivdadeColumnAndRow({Key? key}) : super(key: key);

  @override
  _ResponsivdadeColumnAndRowState createState() =>
      _ResponsivdadeColumnAndRowState();
}

class _ResponsivdadeColumnAndRowState extends State<ResponsivdadeColumnAndRow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsividade Widget Column e Row"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Text('Top Bar'),
              color: Colors.amber,
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.purpleAccent,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.greenAccent,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: Text('Bottom Bar', style: TextStyle(color: Colors.white),),
              color: Colors.purple,
            ),
          )
        ],
      ),
    );
  }
}
