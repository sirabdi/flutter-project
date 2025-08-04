import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/product/product-card.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledHeading('Our Products'), centerTitle: false),
      body: Container(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return ProductCard(title: 'Baju Polos', price: 180000);
          },
        ),
      ),
    );
  }
}
