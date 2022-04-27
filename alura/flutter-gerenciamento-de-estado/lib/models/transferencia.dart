class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(
    this.valor,
    this.numeroConta,
  );

  valorToString(){
    return 'R\$ $valor';
  }
  numeroDaContaToString(){
    return "Conta: $numeroConta";
  }
}
