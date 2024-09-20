// bank_account.dart
class BankAccount<T extends num> {
  T _balance;

  BankAccount(this._balance);

  T get balance => _balance;

  void deposit(T amount) {
    if (amount < 0) {
      throw ArgumentError('O valor do depósito deve ser positivo.');
    }
    _balance = (_balance + amount) as T; // Conversão explícita
  }

  void withdraw(T amount) {
    if (amount < 0) {
      throw ArgumentError('O valor do saque deve ser positivo.');
    }
    if (_balance - amount < 0) {
      throw Exception('Saldo insuficiente.');
    }
    _balance = (_balance - amount) as T; // Conversão explícita
  }
}
