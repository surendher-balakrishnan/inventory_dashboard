import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_form.dart';

class AddEditProductScreen extends StatelessWidget {
  final Product? product; // null means "Add", not null means "Edit"

  const AddEditProductScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product == null ? "Add Product" : "Edit Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProductForm(product: product),
      ),
    );
  }
}