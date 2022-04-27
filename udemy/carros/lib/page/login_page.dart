
import 'dart:async';

import 'package:carros/api/api_response.dart';
import 'package:carros/api/login_api.dart';
import 'package:carros/model/usuario.dart';
import 'package:carros/util/alert.dart';
import 'package:carros/util/app_navigator.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_input.dart';
import 'package:flutter/material.dart';

import 'home_page_new.dart';

class LoginPage extends StatefulWidget {


  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final StreamController<bool> _progressStreamController =  StreamController();
  final TextEditingController _loginController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode _emailFocus =  FocusNode();
  final FocusNode _passwordFocus =  FocusNode();
  final FocusNode _buttonFocus =  FocusNode();

  @override
  Widget build(BuildContext context) {
    _checkAutomaticAuth();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carros"),
      ),
      body: _body(),
    );
  }

  Future<void> _checkAutomaticAuth() async {
    Usuario user = await Usuario.load();
    _onAthenticationSuccess(user);
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.grey[100],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network("https://www.pngitem.com/pimgs/m/44-442827_cars-clearart-image-disney-cars-logo-png-transparent.png"),
              Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    AppInput(
                      "Login: ",
                      "Digite seu login",
                      controller: _loginController,
                      validator: _loginValidator,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                      focusNode: _emailFocus,
                      nextFocus: _passwordFocus,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppInput(
                      "Senha: ",
                      "Digite sua senha",
                      password: true,
                      controller: _passwordController,
                      focusNode: _passwordFocus,
                      nextFocus: _buttonFocus,
                      textInputType: TextInputType.number,
                      validator: _passwordValidator,
                      textInputAction: TextInputAction.next,
                      onEnterKeyPressed: _loginButtonAction,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<bool>(
                        stream: _progressStreamController.stream,
                        initialData: false,
                        builder:(context, snapshot) {
                          return AppButton("Login", onPressed: _loginButtonAction, showProgressIndicator: snapshot.data!,);
                        }
                    ) ,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _loginButtonAction() async{
    // setState(() {
    //   _showProgress =  true;
    // });
    _progressStreamController.add(true);
    bool? isFormOk = _formKey.currentState!.validate();
    if (!isFormOk) {
      return;
    }
    String login = _loginController.text;
    String senha = _passwordController.text;
    ApiResponse<Usuario> apiResponse =  await LoginApi.authentication(login, senha);
    if (apiResponse.ok!){
      Usuario user = apiResponse.content!;
      user.save();
      _onAthenticationSuccess(user);
    }else{
      alert(context, apiResponse.message!);
    }
    _progressStreamController.add(false);
    // setState(() {
    //   _showProgress = false;
    // });
  }

  void _onAthenticationSuccess(Usuario user) {
    navigate(context, HomePageNew(isAdmin: user.isAdmin(),), replace: true);
  }

  String? _loginValidator(String? value) {
    if (value!.isEmpty) {
      return "O campo login deve ser preenchido";
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "O campo senha deve ser preenchido";
    }
    if (value.length < 3) {
      return "O campo login deve ter ao menos 3 caracteres";
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    _progressStreamController.close();
  }
}
