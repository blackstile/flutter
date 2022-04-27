import 'package:flutter/material.dart';

class WebAppBar extends StatelessWidget with PreferredSizeWidget {
  const WebAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Image.asset(
            "assets/img/logo.png",
            fit: BoxFit.contain,
          ),
          Expanded(child: Container()),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_rounded),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text("Cadastrar"),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
              primary: Colors.white,
            ),
          ),
          const SizedBox(width: 10,),
          OutlinedButton(
            onPressed: () {},
            child: const Text("Entrar"),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.orange,
              primary: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
