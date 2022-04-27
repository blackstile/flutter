import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                boxShadow: [BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                  blurRadius: 16
                )]
              ),
              margin: EdgeInsets.only(bottom: 16),
              accountName: Text("William Miranda", style: TextStyle(fontSize: 24),textAlign: TextAlign.center,),
              accountEmail: Text("blackstile@hotmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://t4.ftcdn.net/jpg/02/30/31/15/360_F_230311582_UvB0ZYoJNKW0NJwxnPKZ2FtvXJWAZJ8t.jpg"),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favoritos'),
              subtitle: const Text("Adicione a sua lista de favoritos"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                print("Favoritos");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Ajuda'),
              subtitle: const Text("Mais informações..."),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                print("Ajuda");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                print("Logout App");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
