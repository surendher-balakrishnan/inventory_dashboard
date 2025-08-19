A simple Inventory Management Dashboard built with Flutter.
This project demonstrates CRUD operations, API integration, and a clean modular project structure.

🚀 Features

Dashboard UI with AppBar + Drawer (Sidebar)

Product Table (DataTable) with:

Product Image (thumbnail + full view on tap)

Name, Price, Stock, Actions


CRUD Operations:

Add Product (Form with validation)

Edit Product (Pre-filled form)

Delete Product (with confirmation alert)


API Integration:

Products loaded from FakeStoreAPI

GET implemented, POST/PUT/DELETE mocked/logged


State Management using setState (Provider-ready)

Clean Modular Structure for easy scaling

Responsive UI for Web / Tablet



---

📂 Project Structure

lib/
│── main.dart
│
├── screens/
│   ├── dashboard_screen.dart
│   ├── products_screen.dart
│   ├── add_edit_product_screen.dart
│
├── widgets/
│   ├── product_table.dart
│   ├── product_form.dart
│   ├── app_drawer.dart
│
├── models/
│   └── product.dart
│
├── services/
│   └── api_service.dart


---

🛠 Setup Instructions

1. Clone the repo:

git clone https://github.com/your-username/flutter-inventory-dashboard.git
cd flutter-inventory-dashboard


2. Install dependencies:

flutter pub get


3. Run the app:

flutter run




---

📸 Screenshots

## 📸 Screenshots

### Dashboard
![Dashboard Screenshot](https://github.com/surendher-balakrishnan/inventory_dashboard/blob/master/assets/dashboard.jpg?raw=true)

### Add Product
![Add Product Screenshot](https://github.com/surendher-balakrishnan/inventory_dashboard/blob/master/assets/add_product.jpg?raw=true)

### Drawer
![Drawer Screenshot](https://github.com/surendher-balakrishnan/inventory_dashboard/blob/master/assets/drawer.jpg?raw=true)

### Products
![Products Screenshot](https://github.com/surendher-balakrishnan/inventory_dashboard/blob/master/assets/products.jpg?raw=true)
FakeStoreAPI

Only GET is fully implemented.

POST, PUT, DELETE are mocked/logged (can be extended).



---

🎯 Evaluation Criteria

API Integration (GET request and display data)

UI Components (AppBar, Drawer, DataTable)

CRUD Implementation (Add/Edit/Delete flow)

Code Modularity (separated into screens, widgets, services, models)

Clean UI/UX



---

✨ Built with Flutter for practice and demonstration purposes
