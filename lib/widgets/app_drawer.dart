import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';
import '../screens/products_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.purple),
            child: Text("Inventory Dashboard", style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          ListTile(
            title: const Text("Dashboard"),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx) => const DashboardScreen()));
            },
          ),
          ListTile(
            title: const Text("Products"),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx) => const ProductsScreen()));
            },
          ),
          ListTile(
            title: const Text("Logout"),
            onTap: () {
              Navigator.pop(context);
              debugPrint("User logged out!");
            },
          ),
        ],
      ),
    );
  }
}