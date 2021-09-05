import 'package:flutter/material.dart';

main() {
  runApp(HomeApp());
}

class HomeApp extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeApp> {
  int totalPessoas = 0;
  final int limite = 15;

  _addPessoas() {
    if (totalPessoas < limite) {
      setState(() {
        totalPessoas++;
      });
    }
  }

  _subPessoas() {
    setState(() {
      totalPessoas--;
    });
  }

  String get status {
    if (totalPessoas < limite){
      return "Pode entrar!";
    }
    return "Lotado!";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Contador de Pessoas',
        home: Stack(
          children: <Widget>[
            Image.asset(
              "images/restaurant.jpg",
              fit: BoxFit.cover,
              height: double.maxFinite,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Pessoas $totalPessoas",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        onPressed: () {
                          debugPrint("+1");
                          _addPessoas();
                        },
                        child: Text(
                          "+1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        onPressed: () {
                          debugPrint("-1");
                          _subPessoas();
                        },
                        child: Text(
                          "-1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  status,
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 30),
                )
              ],
            ),
          ],
        ));
  }
}
