import 'package:flutter/material.dart';
import 'package:flutter_essential/widget/button_azul.dart';
import 'package:flutter_essential/widget/drawer_list.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'hello_listvew.dart';
import 'hello_page2.dart';
import 'hello_page3.dart';

import 'package:getwidget/getwidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: "Home", icon: Icon(Icons.home)),
              Tab(text: "Tab 2", icon: Icon(Icons.help)),
              Tab(text: "Tab 3", icon: Icon(Icons.favorite)),
            ],
          ),
          title: const Text(
            "Flutter App Widgets",
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            _body(context),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.deepPurple,
            ),
          ],
        ),
        drawer: const DrawerList(),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            FloatingActionButton(
              onPressed: _onClickFab,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.favorite),
              heroTag: "#favorite",
            ),
            SizedBox(
              width: 8,
            ),
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: _onClickFab,
              child: Icon(Icons.help),
              heroTag: "#help",
            ),
          ],
        ),
      ),
    );
  }
}

_onClickFab() {
  print('Action Button');
}

_body(context) {
  return SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _text(),
          _pageView(),
          _buttons(context),
        ],
      ),
    ),
  );
}

_pageView() {
  // ignore: sized_box_for_whitespace
  return Container(
    height: 300,
    color: Colors.yellow,
    margin: const EdgeInsets.only(top: 20, bottom: 20),
    child: PageView(
      children: [
        _imageAssets(image: 'dog1.png'),
        _imageAssets(image: 'dog2.png'),
        _imageAssets(image: 'dog3.png'),
        _imageAssets(image: 'dog4.png'),
        _imageAssets(image: 'dog5.png'),
      ],
    ),
  );
}

_buttons(final context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
              onClick: () =>
                  _buttonNavigationPage(context, const HelloListView()),
              label: "ListView"),
          CustomButton(
              onClick: () => _buttonNavigationPage(context, const HelloPage2()),
              label: "Page 2"),
          CustomButton(
              onClick: () => _buttonNavigationPage(context, const HelloPage3()),
              label: "Page 3"),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
              onClick: () => _onClickSnackButton(context), label: "Snack"),
          CustomButton(
              onClick: () => _onClickDialogButton(context), label: "Dialog"),
          CustomButton(
              onClick: () => _onClickToastButton(context), label: "Toast"),
        ],
      ),
    ],
  );
}

_button(Function onPressed, {String label = "OK"}) {
  return TextButton(
    style: TextButton.styleFrom(
      backgroundColor: Colors.green,
    ),
    child: Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    onPressed: () {
      onPressed();
    },
  );
}

_buttonNavigationPage(BuildContext context, Widget page) async {
  final result =
      await Navigator.push(context, MaterialPageRoute(builder: (context) {
    return page;
  }));
  print(">> $result");
}

_imageAssets({String image = 'dog1.png'}) {
  return SizedBox.expand(
    child: Image.asset(
      'assets/images/$image',
      fit: BoxFit.cover,
    ),
  );
}

// _imageNetwork() {
//   return Center(
//     child: Image.network(
//       'https://conviteasaude.com.br/wp-content/uploads/2017/08/pastor-alemao.jpg',
//       fit: BoxFit.cover,
//     ),
//   );
// }

_text() {
  return const Center(
    child: Text(
      "Flutter Essential",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decorationStyle: TextDecorationStyle.wavy,
      ),
    ),
  );
}

_onClickSnackButton(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.deepPurpleAccent,
      content: Text("Um snackbar"),
      action: SnackBarAction(
        label: "Fechar",
        textColor: Colors.yellow,
        onPressed: () {
          print("Ok Fechou");
        },
      ),
    ),
  );
  print("Snack Button");
}

_onClickDialogButton(context) {
  showDialog(
      context: context,
      barrierDismissible: false, //nao fechar o dialog ao clicar fora do dialog
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          //nao fechar o dialog ao clicar no botao voltar no android
          child: AlertDialog(
            title: const Text("Alert Dialog"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  print("clicou em cancelar");
                },
                child: const Text("Cancelar"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  print("clicou em ok");
                },
                child: const Text("OK"),
              )
            ],
          ),
        );
      });
  print("Dialog Button");
}

_onClickToastButton(context) {
  GFToast.showToast(
    "Um toast basico",
    context,
    toastPosition: GFToastPosition.BOTTOM,
    textStyle: const TextStyle(fontSize: 24, color: GFColors.DARK),
    backgroundColor: GFColors.LIGHT,
    toastDuration: 5,
    trailing: const Icon(
      Icons.notifications,
      color: GFColors.SUCCESS,
    ),
  );
  print('Toast Button');
}
