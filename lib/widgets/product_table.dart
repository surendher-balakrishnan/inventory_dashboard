import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/add_edit_product_screen.dart';

class ProductTable extends StatefulWidget {
  const ProductTable({super.key});

  @override
  State<ProductTable> createState() => _ProductTableState();
}

class _ProductTableState extends State<ProductTable> {
  final List<Product> _products = [];

  void _addProduct() async {
    final newProduct = await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => const AddEditProductScreen()),
    );
    if (newProduct != null && newProduct is Product) {
      setState(() {
        _products.add(newProduct);
      });
    }
  }

  void _editProduct(Product product) async {
    final updatedProduct = await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => AddEditProductScreen(product: product)),
    );
    if (updatedProduct != null && updatedProduct is Product) {
      setState(() {
        final index = _products.indexWhere((p) => p.id == product.id);
        _products[index] = updatedProduct;
      });
    }
  }

  void _deleteProduct(Product product) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Confirm Delete"),
        content: Text("Delete ${product.title}?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _products.removeWhere((p) => p.id == product.id);
              });
              Navigator.pop(ctx);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: SingleChildScrollView(
            child: DataTable(
              columns: const [
                DataColumn(label: Text("Image")),
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("Price")),
                DataColumn(label: Text("Stock")),
                DataColumn(label: Text("Actions")),
              ],
              rows: _products
                  .map(
                    (p) => DataRow(cells: [
                  DataCell(Image.network(p.image, width: 40, height: 40)),
                  DataCell(Text(p.title)),
                  DataCell(Text("\$${p.price.toStringAsFixed(2)}")),
                  DataCell(Text(p.stock.toString())),
                  DataCell(Row(
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
                  )),
                ]),
              )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}