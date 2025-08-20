import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_rpg/models/product/product.dart';

part 'products_provider.g.dart';

const List<Product> allProducts = [
  Product(
    id: 1,
    title: 'Engraved Glass Cup',
    description:
        "A transparent drinking glass with elegant floral engravings all around. Its ergonomic shape makes it comfortable to hold, perfect for serving various hot or cold beverages. It's heat-resistant and easy to clean.",
    price: 2.50,
  ),
  Product(
    id: 2,
    title: 'Synthetic Leather Notebook',
    description:
        "An A5-sized notebook with a dark brown synthetic leather cover. It contains 150 sheets of high-quality blank paper, ideal for sketching, journaling, or jotting down ideas. It also includes a ribbon bookmark.",
    price: 5.50,
  ),
  Product(
    id: 3,
    title: 'Minimalist Desk Lamp',
    description:
        "A modern and minimalist desk lamp with a pine wood base and a cylindrical white lampshade. It emits a soft light, making it perfect for reading or working at night. Its simple design fits any decor.",
    price: 10.00,
  ),
  Product(
    id: 4,
    title: 'All-Purpose Wrench',
    description:
        "A durable and strong tool made of carbon steel. It's designed to adjust to various bolt and nut sizes, making it a practical multi-purpose wrench for home repairs. The handle has a non-slip rubber grip.",
    price: 5.00,
  ),
];

// generated provider
@riverpod
List<Product> products(ref) {
  return allProducts;
}

@riverpod
List<Product> reduceProducts(ref) {
  return allProducts.where((p) => p.price < 6).toList();
}
