import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/registro_model.dart';

class ApiService {
  final String apiUrl = 'http://localhost:3000/registros';

  Future<List<Registro>> getRegistros() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Iterable lista = json.decode(response.body);
      return lista.map((json) => Registro.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar registros');
    }
  }

  Future<Registro> createRegistro(Registro registro) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(registro.toJson()),
    );
    if (response.statusCode == 201) {
      return Registro.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro ao criar registro');
    }
  }

  Future<Registro> updateRegistro(Registro registro) async {
    final response = await http.put(
      Uri.parse('$apiUrl/${registro.id}'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(registro.toJson()),
    );
    if (response.statusCode == 200) {
      return Registro.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro ao atualizar registro');
    }
  }

  Future<void> deleteRegistro(int id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Erro ao deletar registro');
    }
  }
}
