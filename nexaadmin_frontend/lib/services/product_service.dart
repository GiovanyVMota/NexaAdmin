import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  static const String baseUrl = "http://localhost:3000";

  static Future<List<ProductModel>> getProducts() async {
    final res = await http.get(Uri.parse("$baseUrl/products"));
    final data = json.decode(res.body);
    return data.map<ProductModel>((e) => ProductModel.fromJson(e)).toList();
  }

  static Future<void> createProduct(ProductModel p) async {
    await http.post(
      Uri.parse("$baseUrl/products"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(p.toJson()),
    );
  }

  static Future<void> updateProduct(int id, ProductModel p) async {
    await http.put(
      Uri.parse("$baseUrl/products/$id"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(p.toJson()),
    );
  }

  static Future<void> deleteProduct(int id) async {
    await http.delete(Uri.parse("$baseUrl/products/$id"));
  }
}
