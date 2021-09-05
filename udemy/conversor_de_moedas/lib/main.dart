import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const url = "http://localhost:3000/finances/1";
const euroSymbol = "€";
// const url = "https://api.hgbrasil.com/finance?format=json-cors&key=0965c383";

main() async {
  print(await getData());
  runApp(ConversorDeMoedasApp());
}

Future<Map<String, dynamic>> getData() async {
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

class ConversorDeMoedasApp extends StatefulWidget {
  _ConversorDeMoedaState createState() => _ConversorDeMoedaState();
}

class _ConversorDeMoedaState extends State<ConversorDeMoedasApp> {
  double dolar;
  double euro;

  TextEditingController realController = TextEditingController();
  TextEditingController dollarController = TextEditingController();
  TextEditingController euroController = TextEditingController();

  _clearAll() {
    this.realController.text = '';
    this.dollarController.text = '';
    this.euroController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          hintStyle: TextStyle(color: Colors.amber),
        ),
      ),
      title: "Conversor de Modedas",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.amber,
              ),
              onPressed: _clearAll,
            )
          ],
          title: Text(
            "\$ Conversor de Moedas \$",
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: FutureBuilder<Map<String, dynamic>>(
            future: getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: Text(
                      "Carregando Dados",
                      style: TextStyle(fontSize: 25.0, color: Colors.amber),
                      textAlign: TextAlign.center,
                    ),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Erro ao carregar dados :(",
                        style: TextStyle(fontSize: 25.0, color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  this.dolar =
                      snapshot.data['results']['currencies']['USD']['buy'];
                  this.euro =
                      snapshot.data['results']['currencies']['EUR']['buy'];

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Icon(
                          Icons.monetization_on,
                          size: 150.0,
                          color: Colors.amber,
                        ),
                        CurrencyInputText(
                          labelText: "Reais",
                          prefixText: "R\$ ",
                          controller: realController,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              _clearAll();
                              return;
                            }
                            double real = double.parse(value);
                            dollarController.text =
                                (real / this.dolar).toStringAsFixed(2);
                            euroController.text =
                                (real / this.euro).toStringAsFixed(2);
                          },
                        ),
                        Divider(),
                        CurrencyInputText(
                          labelText: "Dolares",
                          prefixText: "US\$ ",
                          controller: dollarController,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              _clearAll();
                              return;
                            }
                            double dollar = double.parse(value);
                            realController.text =
                                (dollar * this.dolar).toStringAsFixed(2);
                            euroController.text =
                                ((dollar * this.dolar) / this.euro)
                                    .toStringAsFixed(2);
                          },
                        ),
                        Divider(),
                        CurrencyInputText(
                          labelText: "Euros",
                          prefixText: "$euroSymbol ",
                          controller: euroController,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              _clearAll();
                              return;
                            }
                            double euro = double.parse(value);
                            realController.text =
                                (euro * this.euro).toStringAsFixed(2);
                            dollarController.text =
                                ((euro * this.euro) / this.dolar)
                                    .toStringAsFixed(2);
                            print(value);                            
                          },
                        ),
                      ],
                    ),
                  );
              }
            }),
      ),
    );
  }
}

class CurrencyInputText extends StatelessWidget {
  final String labelText;
  final String prefixText;
  final TextEditingController controller;
  final void Function(String) onChanged;

  CurrencyInputText(
      {@required this.labelText,
      @required this.prefixText,
      this.controller,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: this.labelText,
        labelStyle: TextStyle(color: Colors.amber),
        border: OutlineInputBorder(),
        prefixText: this.prefixText,
      ),
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      style: TextStyle(
        color: Colors.amber,
        fontSize: 25.0,
      ),
      onChanged: onChanged,
    );
  }
}
