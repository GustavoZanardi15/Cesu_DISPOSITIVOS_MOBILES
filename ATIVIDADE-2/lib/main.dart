void main() {
  var conta = Conta<String>('1234', 100.0, 'João');

  print('Saldo inicial: ${conta.getSaldo()}');

  conta.depositar(50.0);
  print('Saldo após depósito: ${conta.getSaldo()}');

  conta.sacar(30.0);
  print('Saldo após saque: ${conta.getSaldo()}');

  try {
    conta.sacar(150.0);
  } catch (e) {
    print(e);
  }

  try {
    conta.depositar(-20.0);
  } catch (e) {
    print(e);
  }
}