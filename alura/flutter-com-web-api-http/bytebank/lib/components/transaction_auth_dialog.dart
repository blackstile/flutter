import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TransactionAuthDialog extends StatefulWidget {

  final Function(String password) onConfirm;

  TransactionAuthDialog({Key? key, required this.onConfirm}) : super(key: key);

  @override
  State<TransactionAuthDialog> createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _authenticateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Authenticate"),
      content: TextField(
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(border: OutlineInputBorder()),
        controller: _authenticateController,
        style: TextStyle(
          fontSize: 64,
          letterSpacing: 24,
        ),
        keyboardType:
            TextInputType.numberWithOptions(decimal: true, signed: false),
        maxLength: 4,
      ),
      actions: [
        TextButton(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            color: Colors.red[500],
            child: Text("Cancel",
              style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text("Confirm", style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),),
          onPressed: ()=> widget.onConfirm(_authenticateController.text),
        ),
      ],
    );
  }
}
