import 'package:flutter/material.dart';

main() => runApp(
      MaterialApp(
        title: "Calculadora IMC",
        debugShowCheckedModeBanner: false,
        home: CalculadoraImcApp(),
      ),
    );

class CalculadoraImcApp extends StatefulWidget {
  @override
  _CalculadoraImcAppState createState() => _CalculadoraImcAppState();
}

class _CalculadoraImcAppState extends State<CalculadoraImcApp> {
  var _primaryColor = Colors.deepPurple;
  var _secondColor = Colors.pink;
  var _primaryFontColor = Colors.white;
  var _secondaryFontColor = Colors.white;
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double imc = 0.0;

  _resetForm() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  _setColor(int codElm, newColor){
    setState(() {
      if (codElm == 0){
        this._primaryColor = newColor;
      }else if (codElm == 1){
        this._primaryFontColor = newColor;
      }else if (codElm == 2){
        this._secondColor = newColor;
      }else{
        this._secondaryFontColor = newColor;
      }
    });
  }

  _calculate() {
    double weight = double.parse(weightController.text);
    print("weight: $weight");
    double height = double.parse(heightController.text) / 100;
    print("weight: $height");
    setState(() {
      this.imc = weight / (height * height);
      print("imc $imc");
    });
    print("Valor imc: $imc");
  }

  String get infoText {
    String imcStr = imc.toStringAsPrecision(4);
    String info = "Informe os seus dados";
    if (imc > 0 && imc < 18.6) {
      info = "Abaixo do peso ($imcStr)";
    } else if (imc < 24.9) {
      info = "Peso ideal ($imcStr)";
    } else if (imc < 29.9) {
      info = "Levemente acima do peso ($imcStr)";
    } else if (imc < 34.9) {
      info = "Obsidade Grau I ($imcStr)";
    } else if (imc < 39.9) {
      info = "Obesidade Grau II ($imcStr)";
    } else if (imc > 39.9) {
      info = "Obsidade Morbida ($imcStr)";
    }
    return info;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: _primaryColor,
          title: Text(
            "Calculadora IMC",
            style: TextStyle(color: _primaryFontColor, fontSize: 30.0),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: _resetForm)
          ],
        ),
        backgroundColor: _secondColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Icons.person_outline,
                  size: 120.0,
                  color: _secondaryFontColor,
                ),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Peso(kg)",
                    labelStyle: TextStyle(
                      color: _secondaryFontColor,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  controller: weightController,
                  style: TextStyle(color: _secondaryFontColor, fontSize: 25.0),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Por favor informe o seu peso";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: _secondaryFontColor, fontSize: 25.0),
                  controller: heightController,
                  decoration: InputDecoration(
                    labelText: "Altura(cm)",
                    labelStyle: TextStyle(color: _secondaryFontColor),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Por favor informe sua altura";
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _calculate();
                        }
                      },
                      color: _primaryColor,
                      child: Text(
                        "Calcular",
                        style:
                            TextStyle(color: _primaryFontColor, fontSize: 30.0),
                      ),
                    ),
                  ),
                ),
                Text(
                  infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _secondaryFontColor,
                    fontSize: 25.0,
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text("Primary Background Color"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            _setColor(0, Colors.deepOrange);
                          },
                          color: Colors.deepOrange,
                        ),
                        RaisedButton(
                          onPressed: ()=> _setColor(0, Colors.deepPurple),
                          color: Colors.deepPurple,
                        ),
                        RaisedButton(
                          onPressed: ()=>_setColor(0,Colors.pink),
                          color: Colors.pink,
                        ),
                        RaisedButton(
                          onPressed: ()=>_setColor(0, Colors.lightGreen),
                          color: Colors.lightGreen,
                        ),
                      ],
                    ),
                    Text("Primary Font Color"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: ()=>_setColor(1, Colors.yellowAccent),
                          color: Colors.yellowAccent,
                        ),
                        RaisedButton(
                          onPressed: ()=>_setColor(1, Colors.lightBlueAccent),
                          color: Colors.lightBlueAccent,
                        ),
                        RaisedButton(
                          onPressed: ()=>_setColor(1, Colors.white),
                          color: Colors.white,
                        ),
                        RaisedButton(
                          onPressed: ()=>_setColor(1, Colors.black),
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Text("Secondary Background Color"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: ()=>_setColor(2, Colors.deepOrange),
                          color: Colors.deepOrange,
                        ),
                        RaisedButton(
                          onPressed: ()=> _setColor(2, Colors.deepPurple),
                          color: Colors.deepPurple,
                        ),
                        RaisedButton(
                          onPressed: ()=>_setColor(2,Colors.pink),
                          color: Colors.pink,
                        ),
                        RaisedButton(
                          onPressed: ()=>_setColor(2, Colors.lightGreen),
                          color: Colors.lightGreen,
                        ),
                      ],
                    ),
                    Text("Secondary Font Color"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: ()=>_setColor(3, Colors.yellowAccent),
                          color: Colors.yellowAccent,
                        ),
                        RaisedButton(
                          onPressed: ()=>_setColor(3, Colors.lightBlueAccent),
                          color: Colors.lightBlueAccent,
                        ),
                        RaisedButton(
                          onPressed: ()=>_setColor(3, Colors.white),
                          color: Colors.white,
                        ),
                        RaisedButton(
                          onPressed: ()=>_setColor(3, Colors.black),
                          color: Colors.black,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
