import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  static const String baseUrl = "http://localhost:3000";

  static Future<List<ProductModel>> getProducts() async {
    final res = await http.get(Uri.parse("$baseUrl/products"));
    if (res.statusCode != 200) throw Exception("Erro ao buscar produtos");
    
    final data = json.decode(res.body);
    return data.map<ProductModel>((e) => ProductModel.fromJson(e)).toList();
  }

  static Future<void> createProduct(ProductModel p) async {
    final res = await http.post(
      Uri.parse("$baseUrl/products"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(p.toJson()),
    );
    if (res.statusCode != 200) {
      throw Exception("Erro ao criar: ${res.body}");
    }
  }

  static Future<void> updateProduct(int id, ProductModel p) async {
    final res = await http.put(
      Uri.parse("$baseUrl/products/$id"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(p.toJson()),
    );
    if (res.statusCode != 200) {
      throw Exception("Erro ao atualizar: ${res.body}");
    }
  }

  static Future<void> deleteProduct(int id) async {
    final res = await http.delete(Uri.parse("$baseUrl/products/$id"));
    if (res.statusCode != 200) {
      throw Exception("Erro ao deletar");
    }
  }
}