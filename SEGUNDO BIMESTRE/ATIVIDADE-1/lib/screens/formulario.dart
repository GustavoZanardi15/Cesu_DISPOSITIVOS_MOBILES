import 'package:flutter/material.dart';
import '../models/registro_model.dart';
import '../services/api_service.dart';

class Formulario extends StatefulWidget {
  final Registro? registro;
  final Function atualizaLista;

  Formulario({this.registro, required this.atualizaLista});

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  String? _nome;
  double? _valor;

  _salvarRegistro() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (widget.registro == null) {
        await ApiService().createRegistro(Registro(nome: _nome!, valor: _valor!));
      } else {
        await ApiService().updateRegistro(Registro(id: widget.registro!.id, nome: _nome!, valor: _valor!));
      }
      widget.atualizaLista();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.registro == null ? 'Novo Registro' : 'Editar Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.registro?.nome ?? '',
                decoration: InputDecoration(labelText: 'Nome'),
                onSaved: (value) => _nome = value!,
                validator: (value) => value!.isEmpty ? 'Informe um nome' : null,
              ),
              TextFormField(
                initialValue: widget.registro?.valor.toString() ?? '',
                decoration: InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _valor = double.parse(value!),
                validator: (value) => value!.isEmpty ? 'Informe um valor' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _salvarRegistro,
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
