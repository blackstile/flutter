import 'package:flutter/material.dart';
import 'package:lojinha_alura/components/botao_carrinho.dart';

class AppBarCustomizada extends StatelessWidget with PreferredSizeWidget {
  final String titulo;
  bool showChartIcon;

  AppBarCustomizada({Key? key, required this.titulo, this.showChartIcon = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      title: Text(
        titulo,
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 24.0, fontFamily: 'Alata'),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: showChartIcon ? [BotaoCarrinho()] : [Container()],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
