
import 'package:bytebank/components/not_found.dart';
import 'package:bytebank/components/progress.dart';
import 'package:bytebank/database/repository/contact_repository.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contacts/contact_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactRepository _repository = ContactRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: Future.delayed(Duration(seconds: 1)).then((value) => _repository.findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress(text: "Carregando Contatos");
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Contact> contacts = snapshot.data as List<Contact>;
                if (contacts != null && contacts.isNotEmpty) {
                  return ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Contact contact = contacts[index];
                        return ContactItem(contact);
                      });
                }
              }
          }
          return NotFound("Nenhum contato encontrado", Icons.no_accounts);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ContactForm()))
              .then((value)=> setState((){}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final Contact _contact;

  ContactItem(this._contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          _contact.nome,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(_contact.numeroConta.toString(),
            style: TextStyle(fontSize: 16.0)),
      ),
    );
  }
}
