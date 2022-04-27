
import 'dart:convert';

import 'package:carros/util/shared_preferences_utils.dart';

class Usuario{
  String login;
  String nome;
  String email;
  String token;
  String urlFoto;
  List<String> roles;

  Usuario.fromJson(Map<String, dynamic> json):
    login =  json["login"],
    nome =  json["nome"],
    email =  json["email"],
    token =  json["token"],
    urlFoto =  json["urlFoto"],
    roles =  json["roles"]?.map<String>((role)=> role.toString()).toList()
  ;

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["login"] = login;
    data["nome"] = nome;
    data["email"] =  email;
    data["token"] = token;
    data["urlFoto"] = urlFoto;
    data["roles"] = roles;
    return data;
  }

  bool isAdmin(){
    return roles.any((r) => r.endsWith("ADMIN"));
  }

  save() {
   SharedPreferencesUtils.setString("user.prefs", jsonEncode(toJson()));
  }

  static Future<Usuario> load() async{
    final String userJson = await SharedPreferencesUtils.getString("user.prefs");
    if (userJson.isNotEmpty){
      return Usuario.fromJson(jsonDecode(userJson));
    }
    return Future.error("Não existe nenhum usuário gravado nas preferencias");
  }

  static clearPrefs(){
    SharedPreferencesUtils.setString("user.prefs", "");
  }

  @override
  String toString() {
    return "Usuario {login: $login, email:$email, token: $token, urlFoto: $urlFoto,  roles:$roles}";
  }
}
