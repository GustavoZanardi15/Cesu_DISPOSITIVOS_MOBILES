import 'package:flutter/material.dart';
import 'package:atividade2/back_account.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BankAccountPage(),
    );
  }
}

class BankAccountPage extends StatefulWidget {
  @override
  _BankAccountPageState createState() => _BankAccountPageState();
}

class _BankAccountPageState extends State<BankAccountPage> {
  final BankAccount<double> account = BankAccount<double>(1000.0);
  final TextEditingController depositController = TextEditingController();
  final TextEditingController withdrawController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicação Bancária'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Saldo: R\$ ${account.balance.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: depositController,
              decoration: InputDecoration(labelText: 'Valor para Depósito'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                double amount = double.tryParse(depositController.text) ?? 0;
                if (amount > 0) {
                  setState(() {
                    account.deposit(amount);
                  });
                  depositController.clear();
                }
              },
              child: Text('Depositar'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: withdrawController,
              decoration: InputDecoration(labelText: 'Valor para Saque'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                double amount = double.tryParse(withdrawController.text) ?? 0;
                if (amount > 0) {
                  try {
                    setState(() {
                      account.withdraw(amount);
                    });
                    withdrawController.clear();
                  } catch (e) {
                    // Aqui você pode mostrar um alerta ou mensagem de erro
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.toString())),
                    );
                  }
                }
              },
              child: Text('Sacar'),
            ),
          ],
        ),
      ),
    );
  }
}
