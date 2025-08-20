class Product {
  const Product({
    required this.id,
    required this.title,
    required this.qty,
    required this.description,
    required this.price,
  });

  final int id;
  final String title;
  final int qty;
  final String description;
  final double price;
}
