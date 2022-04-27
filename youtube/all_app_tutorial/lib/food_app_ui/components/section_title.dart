import 'package:flutter/material.dart';

import '../constants.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback press;

  const SectionTitle({Key? key, required this.title, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        TextButton(
            onPressed: press,
            style: TextButton.styleFrom(
              primary: kActiveColor,
            ),
            child: const Text(
              "See all",
            ))
      ],
    );
  }
}
