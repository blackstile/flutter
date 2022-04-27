import 'dart:io';

import 'package:carros/model/usuario.dart';
import 'package:http/http.dart' as http;
import 'package:carros/model/carro.dart';
import 'dart:convert';

class CarroApi {

  // static const String _baseUrl =  "https://carros-springboot.herokuapp.com/api/v1/carros";
  static const String _baseUrl =  "https://carros-springboot.herokuapp.com/api/v2/carros";

  static Future<List<Carro>>  getAll() async{
    final url = Uri.parse(_baseUrl);
    return _executeRequest(url);
  }

  static Future<List<Carro>> getByType(String type) async {
    if ("todos" == type.toLowerCase()){
      return getAll();
    }
    final uri = Uri.parse("$_baseUrl/tipo/$type");
    print("Uri Request: $uri");
    return _executeRequest(uri);
  }

  static Future<List<Carro>> _executeRequest(Uri uri) async {
    await Future.delayed(const Duration(seconds: 1)); //para simular lentidão
    try {
      Usuario user = await Usuario.load();
      final response = await http.get(uri, headers:{
        "Content-Type": 'application/json',
        "Authorization": "Bearer ${user.token}",
      });
      
      return json.decode(response.body)
          .map<Carro>((carro) => Carro.fromJson(carro))
          .toList();
    }catch(error, excepetion){
      print("$error => $excepetion");
      rethrow;
    }
  }
}