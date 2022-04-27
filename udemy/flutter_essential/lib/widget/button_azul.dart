import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final double size;
  final VoidCallback onClick;
  const CustomButton({Key? key, required this.label,
    this.backgroundColor = Colors.blueAccent,
    this.textColor=Colors.white,
    this.size = 16, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(backgroundColor: backgroundColor),
      child: Text(
        label,
        style: TextStyle(fontSize: size, color: textColor),
      ),
      onPressed: onClick,
    );
  }
}
