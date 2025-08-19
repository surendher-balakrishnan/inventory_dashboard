class Product {
  final int id;
  final String title;
  final String image;
  final double price;
  final int stock;

  Product({required this.id, required this.title, required this.image, required this.price, required this.stock});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      stock: json['rating']?['count'] ?? 0, // FakeStoreAPI uses rating.count as stock
    );
  }
}