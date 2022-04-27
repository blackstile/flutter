import 'package:flutter/material.dart';

class ImageItemProductGrid extends StatelessWidget {
  final String imagem;

  const ImageItemProductGrid({Key? key, required this.imagem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        'utilidades/assets/imagens/$imagem',
        fit: BoxFit.cover,
      ),
    );
  }
}
