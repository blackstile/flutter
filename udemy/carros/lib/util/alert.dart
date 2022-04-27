import 'package:flutter/material.dart';

alert(BuildContext context, String msg) {
  showDialog(context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
              title: const Text("Alerta"),
              content: Text(msg),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context),
                    child: const Text("Ok")),
              ]
          ),
        );
      });
}