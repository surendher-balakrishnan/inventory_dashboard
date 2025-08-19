import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const String baseUrl = "https://fakestoreapi.com/products";

  /// GET: Fetch product list
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }

  /// POST: Mock add product
  static Future<Product> addProduct(Product product) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": product.title,
        "price": product.price,
        "image": product.image,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to add product");
    }
  }

  /// PUT: Mock update product
  static Future<Product> updateProduct(Product product) async {
    final response = await http.put(
      Uri.parse("$baseUrl/${product.id}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": product.title,
        "price": product.price,
        "image": product.image,
      }),
    );

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update product");
    }
  }

  /// DELETE: Mock delete product
  static Future<void> deleteProduct(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));
    if (response.statusCode != 200) {
      throw Exception("Failed to delete product");
    }
  }
}