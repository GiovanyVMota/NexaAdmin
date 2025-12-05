import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/client.dart';

class ClientService {
  static const String baseUrl = "http://localhost:3000";

  static Future<List<ClientModel>> getClients() async {
    final res = await http.get(Uri.parse("$baseUrl/clients"));
    final data = json.decode(res.body);
    return data.map<ClientModel>((e) => ClientModel.fromJson(e)).toList();
  }

  static Future<void> createClient(ClientModel client) async {
    await http.post(
      Uri.parse("$baseUrl/clients"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(client.toJson()),
    );
  }

  static Future<void> updateClient(int id, ClientModel c) async {
    await http.put(
      Uri.parse("$baseUrl/clients/$id"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(c.toJson()),
    );
  }

  static Future<void> deleteClient(int id) async {
    await http.delete(Uri.parse("$baseUrl/clients/$id"));
  }
}
