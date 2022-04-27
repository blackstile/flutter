import 'package:bytebank/screens/contacts/contacts_list.dart';
import 'package:bytebank/screens/transaction/transaction_list.dart';
import 'package:bytebank/screens/transfer/transfer_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Byte Bank Dashboard"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _FeatureItem(
                  'Contacts',
                  Icons.people,
                  onClick: () => _showScreen(context, ContactsList()),
                ),
                _FeatureItem(
                  'Transfer',
                  Icons.monetization_on,
                  onClick: () => _showScreen(context, TransferList()),
                ),
                _FeatureItem(
                  'Transaction Feed',
                  Icons.description,
                  onClick: () => _showScreen(context, TransactionList()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _showNoImplementedAction(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Funcionalidade não implementada"),
      action: SnackBarAction(
        label: 'Fechar',
        onPressed: () {},
      ),
    ));
  }

  _showScreen(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onClick;

  _FeatureItem(this.label, this.icon, {required this.onClick})
      : assert(icon != null),
        assert(onClick != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        child: InkWell(
          onTap: () => this.onClick(),
          child: Container(
            width: 150,
            height: 100,
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(
                    label,
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
