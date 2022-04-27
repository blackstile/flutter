import 'package:flutter/material.dart';

class BadgeCartButton extends StatelessWidget {

  bool? isTransparent;

  BadgeCartButton({Key? key, this.isTransparent=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: isTransparent! ? Colors.transparent : Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  static Widget transparentBadge(){
    return BadgeCartButton(isTransparent: true,);
  }
}
