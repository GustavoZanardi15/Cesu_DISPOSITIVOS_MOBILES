import 'package:flutter/material.dart';
import '../models/account.dart';
import 'package:atividade4/screens/accountFormScreens.dart';


class AccountListScreen extends StatefulWidget {
  @override
  _AccountListScreenState createState() => _AccountListScreenState();
}

class _AccountListScreenState extends State<AccountListScreen> {
  List<Account> accounts = [];

  void _addOrEditAccount({Account? account}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AccountFormScreen(account: account),
      ),
    );

    if (result != null) {
      setState(() {
        if (account == null) {
          accounts.add(result);
        } else {
          int index = accounts.indexWhere((a) => a.id == account.id);
          if (index != -1) {
            accounts[index] = result;
          }
        }
      });
    }
  }

  void _deleteAccount(String id) {
    setState(() {
      accounts.removeWhere((account) => account.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contas Bancárias'),
        ),
        body: ListView.builder(
          itemCount: accounts.length,
          itemBuilder: (context, index) {
            final account = accounts[index];
            return ListTile(
              title: Text(account.name),
              subtitle: Text('Saldo: R\$ ${account.balance.toStringAsFixed(2)}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _addOrEditAccount(account: account),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteAccount(account.id),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addOrEditAccount(),
          child: Icon(Icons.add),
        ));
  }
}
