import 'package:carros/model/usuario.dart';
import 'package:carros/page/login_page.dart';
import 'package:carros/util/app_navigator.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {

  final bool isAdmin;

  const DrawerList({Key? key, this.isAdmin = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<Usuario> userFuture =  Usuario.load();
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            FutureBuilder<Usuario>(
              future: userFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _buildUserAccountsDrawerHeader(snapshot.data!);
                }
                return const LinearProgressIndicator();
            },),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text("Favoritos"),
              subtitle: const Text("mais informações"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: (){
                print("Favoritos Clicado");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text("Ajuda"),
              subtitle: const Text("mais informações"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: (){
                print("Ajuda Clicado");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Logout"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: (){
                Usuario.clearPrefs();
                Navigator.pop(context);
                navigate(context, LoginPage(), replace: true);
              },
            )
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _buildUserAccountsDrawerHeader(Usuario user){
    return UserAccountsDrawerHeader(
            accountName: Text(user.nome),
            accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(user.urlFoto),
            ),
          );
  }
}
