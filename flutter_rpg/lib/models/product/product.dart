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

  Product copyWith({
    int? id,
    String? title,
    int? qty,
    String? description,
    double? price,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      qty: qty ?? this.qty,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
