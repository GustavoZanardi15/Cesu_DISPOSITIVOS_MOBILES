import 'package:flutter/material.dart';
import '../models/account.dart';
import 'dart:math';

class AccountFormScreen extends StatefulWidget {
  final Account? account;

  AccountFormScreen({this.account});

  @override
  _AccountFormScreenState createState() => _AccountFormScreenState();
}

class _AccountFormScreenState extends State<AccountFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late double _balance;

  @override
  void initState() {
    super.initState();
    _name = widget.account?.name ?? '';
    _balance = widget.account?.balance ?? 0.0;
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newAccount = Account(
        id: widget.account?.id ?? Random().nextDouble().toString(),
        name: _name,
        balance: _balance,
      );
      Navigator.pop(context, newAccount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.account == null ? 'Adicionar Conta' : 'Editar Conta'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  initialValue: _name,
                  decoration: InputDecoration(labelText: 'Nome da Conta'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o nome da conta';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                TextFormField(
                  initialValue: _balance.toString(),
                  decoration: InputDecoration(labelText: 'Saldo Inicial'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o saldo inicial';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Por favor, insira um número válido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _balance = double.parse(value!);
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveForm,
                  child: Text('Salvar'),
                )
              ])),
        ));
  }
}
