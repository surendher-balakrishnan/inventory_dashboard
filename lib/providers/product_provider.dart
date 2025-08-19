import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  /// Load products from API (only once usually)
  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await ApiService.fetchProducts();
    } catch (e) {
      debugPrint("Error fetching products: $e");
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Local add (mock)
  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  /// Local update (mock)
  void updateProduct(Product product) {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
      notifyListeners();
    }
  }

  /// Local delete (mock)
  void deleteProduct(int id) {
    _products.removeWhere((p) => p.id == id);
    notifyListeners();
  }
}