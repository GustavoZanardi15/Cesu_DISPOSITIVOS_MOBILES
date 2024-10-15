import 'package:flutter/material.dart';
import 'package:atividade4/screens/accountListScreens.dart';

void main() {
  runApp(AplicacaoBancaria());
}

class AplicacaoBancaria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AccountListScreen(),
    );
  }
}
