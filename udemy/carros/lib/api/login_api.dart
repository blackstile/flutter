import 'dart:convert';

import 'package:carros/api/api_response.dart';
import 'package:carros/model/usuario.dart';
import 'package:http/http.dart' as http;


class LoginApi {

  static Future<ApiResponse<Usuario>> authentication(String login, String senha) async {
    // var url = Uri.parse("http://livrowebservices.com.br/rest/login");
    try {
      var url = Uri.parse(
          "https://carros-springboot.herokuapp.com/api/v2/login");
      String body = json.encode({
        'username': login,
        'password': senha,
      });

      var response = await http.post(url, body: body, headers: {
        "Content-Type": 'application/json'
      });
      Map<String, dynamic> bodyResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        print(Usuario.fromJson(bodyResponse));
        return ApiResponse.ok(Usuario.fromJson(bodyResponse));
      }

      return ApiResponse.error(bodyResponse["error"]);
    }catch(error, exception){
      print("Erro no login $error > $exception");
      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}