import 'package:bytebank/database/repository/contact_repository.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorConta = TextEditingController();
  final ContactRepository _repository =  ContactRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Contato"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controladorNome,
                autofocus: true,
                keyboardType: TextInputType.name,
                style: TextStyle(
                  fontSize: 24.0
                ),
                decoration: InputDecoration(
                    labelText: "Nome", hintText: "Seu nome aqui"),
              ),
              TextField(
                controller: _controladorConta,
                style: TextStyle(
                    fontSize: 24.0
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Numero da Conta",
                  hintText: "1000",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("Salvar"),
                    onPressed: (){
                      final numeroConta = int.tryParse(_controladorConta.text);
                      final nome = _controladorNome.text;
                      if (numeroConta != null){
                        var newContact = Contact(nome: nome, numeroConta: numeroConta);
                        _repository.save(newContact).then((value) => Navigator.pop(context));
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
