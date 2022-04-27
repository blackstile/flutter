import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_web/uteis/paleta_cores.dart';
import 'package:whatsapp_web/validadores/cadastro_usuario/cadastro_usuario_form.dart';
import 'package:whatsapp_web/validadores/cadastro_usuario/cadastro_usuario_validation.dart';
import 'package:whatsapp_web/validadores/login/login_form.dart';
import 'package:whatsapp_web/validadores/login/login_validation.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controllerNome =
  TextEditingController(text: "William Miranda");
  final TextEditingController _controllerEmail =
  TextEditingController(text: "williammiranda@email.com");
  final TextEditingController _controllerSenha =
  TextEditingController(text: "senhaSegura");
  bool _cadastroUsuario = false;
  Uint8List? _arquivoSelecionado;
  String? _fileName;
  final _storage =  FirebaseStorage.instance;

  _selecionarImagem() async{
    FilePickerResult? filePickerResult =  await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    setState(() {
      _arquivoSelecionado  =  filePickerResult?.files.single.bytes;
      _fileName = filePickerResult?.files.single.name;
    });
  }

  _uploadImage(String userId){
    print('upload file: ' +  userId );
    Reference ref =  _storage.ref("imagens/perfil").child(userId).child(_fileName!);
    print(ref.fullPath);
    Uint8List? arquivoSelecionado =  _arquivoSelecionado;
    if (arquivoSelecionado != null) {
      var uploadTask = ref.putData(arquivoSelecionado);
      uploadTask.whenComplete(() async{
        final urlFileUpdated = await uploadTask.snapshot.ref.getDownloadURL();
        print(urlFileUpdated);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    double larguraTela = MediaQuery
        .of(context)
        .size
        .width;
    double alturaTela = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      body: Container(
        color: PaletaCores.corFundo,
        width: larguraTela,
        height: alturaTela,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: larguraTela,
                height: alturaTela * 0.5,
                color: PaletaCores.corPrimaria,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Card(
                    elevation: 4,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      width: 500,
                      child: Column(
                        children: [
                          Visibility(
                            visible: _cadastroUsuario,
                            child: ClipOval(
                              child: _arquivoSelecionado != null ?
                              Image.memory(_arquivoSelecionado!,
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              )
                              : Image.asset(
                                "assets/imagens/perfil.png",
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Visibility(
                            visible: _cadastroUsuario,
                            child: OutlinedButton(
                              onPressed: _selecionarImagem,
                              child: const Text("Selecionar Foto"),
                            ),
                          ),
                          Visibility(
                            visible: _cadastroUsuario,
                            child: TextField(
                              keyboardType: TextInputType.text,
                              controller: _controllerNome,
                              decoration: const InputDecoration(
                                  hintText: "Nome",
                                  labelText: "Nome",
                                  suffixIcon: Icon(
                                    Icons.person_outline,
                                  )),
                            ),
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _controllerEmail,
                            decoration: const InputDecoration(
                                hintText: "E-mail",
                                labelText: "E-mail",
                                suffixIcon: Icon(
                                  Icons.mail_outline,
                                )),
                          ),
                          TextField(
                            keyboardType: TextInputType.text,
                            controller: _controllerSenha,
                            obscureText: true,
                            decoration: const InputDecoration(
                                hintText: "Senha",
                                labelText: "Senha",
                                suffixIcon: Icon(
                                  Icons.lock_outline,
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: (){
                                final auth = FirebaseAuth.instance;
                                if (_cadastroUsuario) {
                                  final cadastroForm = CadastroUsuarioForm(
                                      _controllerNome.text, '', _controllerEmail.text,
                                      _controllerSenha.text, _arquivoSelecionado,
                                  );
                                  final validationResult = CadastroUsuarioValidation().validate(cadastroForm);
                                  if (validationResult.isValid()){
                                    auth.createUserWithEmailAndPassword(email: cadastroForm.email, password: cadastroForm.senha)
                                    .then((authResponse){
                                      print(authResponse.user?.uid);
                                      final User? loggedUser = authResponse.user;
                                      if (loggedUser != null){
                                        _uploadImage(loggedUser.uid);
                                      }
                                    });
                                  }else{
                                    print(validationResult.getListMessagesAsString());
                                  }
                                }else{
                                  final  loginForm = LoginForm(_controllerEmail.text, _controllerSenha.text);
                                  final validationResult = LoginValidation().validate(loginForm);
                                  if(validationResult.isValid()){
                                    auth.signInWithEmailAndPassword(
                                        email: loginForm.email!,
                                        password: loginForm.senha)
                                        .then((authResponse) {
                                          print(authResponse.user?.uid);
                                        });
                                  }else{
                                    print(validationResult.getListMessagesAsString());
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: PaletaCores.corPrimaria,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text( _cadastroUsuario ? "Cadastrar" : "Logar",
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Text("Login"),
                              Switch(
                                value: _cadastroUsuario,
                                onChanged: (bool valor) {
                                  setState(() {
                                    _cadastroUsuario = valor;
                                  });
                                },
                                activeColor: PaletaCores.corPrimaria,
                              ),
                              const Text("Cadastro"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
