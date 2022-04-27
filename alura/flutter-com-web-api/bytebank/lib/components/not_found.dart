

import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {

  final String message;
  final IconData icon;

  const NotFound(this.message, this.icon);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,  size: 56.0, color: Colors.red[900],),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(message, style: TextStyle(fontSize: 24.0,  color: Colors.red[900]),),
            )
          ],
        ),
      ),
    );
  }
}
