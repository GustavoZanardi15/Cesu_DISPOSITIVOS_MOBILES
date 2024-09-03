import 'package:exercicio01/AccountCard.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicação Bancária'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[200]!, Colors.orange[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: <Widget>[
              AccountCard(
                title: 'Conta Corrente',
                subtitle: 'Saldo: R\$ 5.000,00',
                icon: Icons.account_balance,
                color: Colors.orangeAccent,
              ),
              AccountCard(
                title: 'Conta Poupança',
                subtitle: 'Saldo: R\$ 20.000,00',
                icon: Icons.savings,
                color: Colors.yellowAccent,
              ),
              AccountCard(
                title: 'Cartão de Crédito',
                subtitle: 'Limite: R\$ 5.000,00',
                icon: Icons.credit_card,
                color: Colors.blueAccent,
              ),
              AccountCard(
                title: 'Empréstimo',
                subtitle: 'Valor: R\$ 90.000,00',
                icon: Icons.monetization_on,
                color: Colors.purpleAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
