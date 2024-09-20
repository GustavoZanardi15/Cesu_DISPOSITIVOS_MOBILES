import 'package:test/test.dart';
import 'conta.dart';

void main() {
  group('Teste de Conta', () {
    test('Depositar valor positivo', () {
      var conta = Conta<String>('1234', 100.0, 'João');
      conta.depositar(50.0);
      expect(conta.getSaldo(), 150.0);
    });

    test('Sacar valor válido', () {
      var conta = Conta<String>('1234', 100.0, 'João');
      conta.sacar(30.0);
      expect(conta.getSaldo(), 70.0);
    });

    test('Sacar valor inválido', () {
      var conta = Conta<String>('1234', 100.0, 'João');
      expect(() => conta.sacar(150.0), throwsException);
    });

    test('Depositar valor negativo', () {
      var conta = Conta<String>('1234', 100.0, 'João');
      expect(() => conta.depositar(-20.0), throwsException);
    });
  });
}
