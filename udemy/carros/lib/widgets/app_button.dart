import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  VoidCallback? onPressed;
  FocusNode? buttonFocus;
  bool showProgressIndicator;

  AppButton(this.label,
      {Key? key,
      this.showProgressIndicator = false,
      this.onPressed,
      this.buttonFocus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: ElevatedButton(
        onPressed: onPressed,
        focusNode: buttonFocus,
        child: showProgressIndicator
            ? const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                label,
                style: const TextStyle(fontSize: 22, color: Colors.white),
              ),
      ),
    );
  }
}
