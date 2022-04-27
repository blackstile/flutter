import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {

  final String label;
  final String hint;
  final bool password;
  final VoidCallback? onEnterKeyPressed;
  TextEditingController? controller;
  FormFieldValidator<String>? validator;
  FocusNode? focusNode;
  FocusNode? nextFocus;
  TextInputAction? textInputAction;
  TextInputType? textInputType;

  AppInput(this.label, this.hint, {Key? key,  this.password = false,
    required this.controller,
    this.onEnterKeyPressed,
    this.validator,
    this.focusNode,
    this.nextFocus,
    this.textInputAction,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: password,
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
        if (onEnterKeyPressed != null){
          onEnterKeyPressed!.call();
        }

      },
      validator: validator,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      controller: controller,
      style: const TextStyle(fontSize: 25, color: Colors.blue),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: label,
          hintText: hint,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 25,
          ),
          hintStyle: const TextStyle(fontSize: 16, color: Colors.green)),
    );
  }
}
