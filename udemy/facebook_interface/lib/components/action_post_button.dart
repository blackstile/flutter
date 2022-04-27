import 'package:flutter/material.dart';

class ActionPostButton extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final String label;
  final Color labelColor;

  const ActionPostButton(
      {Key? key,
      required this.icon,
      required this.color,
      required this.label,
      this.labelColor=Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(
        icon,
        color: color,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: labelColor,
        ),
      ),
    );
  }
}
