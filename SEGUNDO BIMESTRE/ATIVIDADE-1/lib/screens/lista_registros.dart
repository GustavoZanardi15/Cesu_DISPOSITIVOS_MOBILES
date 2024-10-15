import 'package:flutter/material.dart';
import '../models/registro_model.dart';
import '../services/api_service.dart';
import 'formulario.dart';

class ListaRegistros extends StatefulWidget {
  @override
  _ListaRegistrosState createState() => _ListaRegistrosState();
}

class _ListaRegistrosState extends State<ListaRegistros> {
  late Future<List<Registro>> _listaRegistros;

  _carregarRegistros() {
    setState(() {
      _listaRegistros = ApiService().getRegistros();
    });
  }

  @override
  void initState() {
    super.initState();
    _carregarRegistros();
  }

  _deletarRegistro(int id) async {
    await ApiService().deleteRegistro(id);
    _carregarRegistros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registros Bancários')),
      body: FutureBuilder(
        future: _listaRegistros,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Registro registro = snapshot.data![index];
                return ListTile(
                  title: Text(registro.nome),
                  subtitle: Text('Valor: ${registro.valor}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Formulario(
                              registro: registro,
                              atualizaLista: _carregarRegistros,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deletarRegistro(registro.id!),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Formulario(atualizaLista: _carregarRegistros),
          ),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
