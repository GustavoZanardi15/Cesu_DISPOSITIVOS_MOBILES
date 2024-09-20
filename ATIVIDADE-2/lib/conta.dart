class Conta<T> {
  String numero;
  double saldo;
  T titular;

  Conta(this.numero, this.saldo, this.titular);

  void depositar(double valor) {
    if (valor > 0) {
      saldo += valor;
    } else {
      throw Exception("Valor do depósito deve ser maior que zero.");
    }
  }

  void sacar(double valor) {
    if (valor > 0 && valor <= saldo) {
      saldo -= valor;
    } else {
      throw Exception("Saque inválido.");
    }
  }

  double getSaldo() {
    return saldo;
  }
}