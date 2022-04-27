import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CircleButton extends StatelessWidget {

  final VoidCallback onPressed;
  final Icon icon;
  final double iconSize;

  const CircleButton({Key? key, required this.onPressed, required this.icon, required this.iconSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        iconSize: iconSize,
        color: Colors.black,
      ),
    );
  }
}
