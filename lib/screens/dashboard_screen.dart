import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'products_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      drawer: const AppDrawer(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => const ProductsScreen()));
          },
          child: const Text("Go to Products"),
        ),
      ),
    );
  }
}