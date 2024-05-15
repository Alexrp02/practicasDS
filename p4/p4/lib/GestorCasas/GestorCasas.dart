
import 'dart:convert';

import '../modelo/Casa.dart';
import 'package:http/http.dart' as http;


class GestorCasas {
  List<Casa> casas = [];
  final String apiUrl = "http://localhost:3000/casas";

  GestorCasas(this.casas);


  Future<void> cargarCasas(String propietario) async{
    final response = await http.get(Uri.parse('$apiUrl?propietario=$propietario'));
    if (response.statusCode == 200) {
      List<dynamic> casasJson = json.decode(response.body);
      casas.clear();
      casas.addAll(casasJson.map((json) => Casa.fromJson(json)).toList());
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<void> addCasa(Casa c) async{
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(c.toJson()),
    );
    if (response.statusCode == 201) {
      casas.add(Casa.fromJson(json.decode(response.body)));
    } else {
      throw Exception('Failed to add task: ${response.body}');
    }
  }

  Future<void> eliminar(Casa c) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/${c.id}'),
    );
    if (response.statusCode == 200) {
      casas.removeWhere((t) => t.id == c.id);
    } else {
      throw Exception('Failed to delete task');
    }
  }

  Future<void> updateCasa(Casa c) async {

    final response = await http.patch(
      Uri.parse('$apiUrl/${c.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(c.toJson()),
    );

    if (response.statusCode == 200) {

    } else {
      throw Exception('Failed to update task');
    }
  }
}