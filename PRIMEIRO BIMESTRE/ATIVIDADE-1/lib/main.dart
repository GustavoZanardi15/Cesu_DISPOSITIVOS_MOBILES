import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplicação Bancária'),
        ),
        body: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text('Conta Corrente'),
                subtitle: Text('Saldo: R\$ 1.500,00'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Conta Poupança'),
                subtitle: Text('Saldo: R\$ 2.000,00'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Cartão de Crédito'),
                subtitle: Text('Limite: R\$ 3.000,00'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
