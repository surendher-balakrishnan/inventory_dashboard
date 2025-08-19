import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductForm extends StatefulWidget {
  final Product? product;

  const ProductForm({super.key, this.product});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _priceController;
  late TextEditingController _stockController;
  late TextEditingController _imageController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.product?.title ?? "");
    _priceController = TextEditingController(text: widget.product?.price.toString() ?? "");
    _stockController = TextEditingController(text: widget.product?.stock.toString() ?? "");
    _imageController = TextEditingController(text: widget.product?.image ?? "");
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final newProduct = Product(
        id: widget.product?.id ?? DateTime.now().millisecondsSinceEpoch, // Fake ID
        title: _titleController.text,
        price: double.tryParse(_priceController.text) ?? 0,
        stock: int.tryParse(_stockController.text) ?? 0,
        image: _imageController.text.isNotEmpty
            ? _imageController.text
            : "https://via.placeholder.com/150",
      );

      Navigator.pop(context, newProduct); // Return the new product object
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: "Product Name"),
            validator: (val) => val!.isEmpty ? "Enter product name" : null,
          ),
          TextFormField(
            controller: _priceController,
            decoration: const InputDecoration(labelText: "Price"),
            keyboardType: TextInputType.number,
            validator: (val) => val!.isEmpty ? "Enter price" : null,
          ),
          TextFormField(
            controller: _stockController,
            decoration: const InputDecoration(labelText: "Stock"),
            keyboardType: TextInputType.number,
            validator: (val) => val!.isEmpty ? "Enter stock" : null,
          ),
          TextFormField(
            controller: _imageController,
            decoration: const InputDecoration(labelText: "Image URL"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _saveForm,
            child: Text(widget.product == null ? "Add Product" : "Update Product"),
          ),
        ],
      ),
    );
  }
}