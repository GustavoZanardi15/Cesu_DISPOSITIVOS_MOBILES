import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/registro_model.dart';

class ApiService {
 
  final String apiUrl = 'http://localhost:3000/registros';  


  Future<List<Registro>> getRegistros() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        Iterable lista = json.decode(response.body);
        try {
          return lista.map((json) => Registro.fromJson(json)).toList();
        } catch (e) {
          throw Exception('Erro ao converter registros: $e');
        }
      } else {
        throw Exception('Erro ao carregar registros: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Erro ao se comunicar com o servidor: $e');
    }
  }


  Future<Registro> createRegistro(Registro registro) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(registro.toJson()),
      );
      if (response.statusCode == 201) {
        try {
          return Registro.fromJson(json.decode(response.body));
        } catch (e) {
          throw Exception('Erro ao processar registro criado: $e');
        }
      } else {
        throw Exception('Erro ao criar registro: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Erro ao se comunicar com o servidor: $e');
    }
  }

  
  Future<Registro> updateRegistro(Registro registro) async {
    try {
      final response = await http.put(
        Uri.parse('$apiUrl/${registro.id}'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(registro.toJson()),
      );
      if (response.statusCode == 200) {
        try {
          return Registro.fromJson(json.decode(response.body));
        } catch (e) {
          throw Exception('Erro ao processar atualização do registro: $e');
        }
      } else {
        throw Exception('Erro ao atualizar registro: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Erro ao se comunicar com o servidor: $e');
    }
  }


  Future<void> deleteRegistro(int id) async {
    try {
      final response = await http.delete(Uri.parse('$apiUrl/$id'));
      if (response.statusCode != 200) {
        throw Exception('Erro ao deletar registro: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Erro ao se comunicar com o servidor: $e');
    }
  }
}
