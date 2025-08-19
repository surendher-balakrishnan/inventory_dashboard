import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';
import 'add_edit_product_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    // Only fetch from API if not already loaded
    Future.microtask(() {
      final provider = context.read<ProductProvider>();
      if (provider.products.isEmpty) {
        provider.fetchProducts();
      }
    });
  }

  void _addProduct() async {
    final newProduct = await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => const AddEditProductScreen()),
    );
    if (newProduct != null && newProduct is Product) {
      context.read<ProductProvider>().addProduct(newProduct);
    }
  }

  void _editProduct(Product product) async {
    final updatedProduct = await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => AddEditProductScreen(product: product)),
    );
    if (updatedProduct != null && updatedProduct is Product) {
      context.read<ProductProvider>().updateProduct(updatedProduct);
    }
  }

  void _deleteProduct(Product product) {
    context.read<ProductProvider>().deleteProduct(product.id);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: _addProduct,
                icon: const Icon(Icons.add),
                label: const Text("Add Product"),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.products.length,
              itemBuilder: (ctx, i) {
                final p = provider.products[i];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.network(p.image, width: 40, height: 40, fit: BoxFit.cover),
                    title: Text(p.title),
                    subtitle: Text("\$${p.price.toStringAsFixed(2)} | Stock: ${p.stock}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _editProduct(p),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteProduct(p),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}