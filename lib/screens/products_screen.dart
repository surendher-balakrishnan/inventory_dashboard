import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/product_table.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      drawer: const AppDrawer(),
      body: const ProductTable(),
    );
  }
}