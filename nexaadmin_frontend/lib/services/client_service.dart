import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/client.dart';

class ClientService {
  static const String baseUrl = "http://localhost:3000";

  static Future<List<ClientModel>> getClients() async {
    final res = await http.get(Uri.parse("$baseUrl/clients"));
    if (res.statusCode != 200) throw Exception("Erro ao buscar clientes");
    
    final data = json.decode(res.body);
    return data.map<ClientModel>((e) => ClientModel.fromJson(e)).toList();
  }

  static Future<void> createClient(ClientModel client) async {
    final res = await http.post(
      Uri.parse("$baseUrl/clients"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(client.toJson()),
    );

    if (res.statusCode != 200 && res.statusCode != 201) {
      // Tenta pegar a mensagem de erro do backend (ex: Duplicate entry)
      throw Exception(res.body); 
    }
  }

  static Future<void> updateClient(int id, ClientModel c) async {
    final res = await http.put(
      Uri.parse("$baseUrl/clients/$id"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(c.toJson()),
    );

    if (res.statusCode != 200) {
      throw Exception("Erro ao atualizar: ${res.body}");
    }
  }

  static Future<void> deleteClient(int id) async {
    final res = await http.delete(Uri.parse("$baseUrl/clients/$id"));
    if (res.statusCode != 200) {
      throw Exception("Erro ao deletar");
    }
  }
}