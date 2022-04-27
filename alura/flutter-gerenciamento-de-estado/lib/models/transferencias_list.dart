import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';

class TransferenciasList extends ChangeNotifier{
  final List<Transferencia> _transferencias = [];

  List<Transferencia> get transferencias => _transferencias;

  void adiciona(Transferencia novaTransferencia){
    _transferencias.add(novaTransferencia);
    notifyListeners();
  }

  bool isEmpty() => transferencias.isEmpty;
  bool isNotEmpty() => transferencias.isNotEmpty;
}