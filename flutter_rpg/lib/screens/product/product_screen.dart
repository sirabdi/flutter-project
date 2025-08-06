import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rpg/providers/products_provider.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/screens/product/product_card.dart';
import 'package:flutter_rpg/shared/cart_icon.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({super.key});

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final allProduct = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: StyledHeading('Our Products'),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (ctx) => Home()),
            );
          },
        ),
        actions: [IconButton(onPressed: () {}, icon: CartIcon())],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: allProduct.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return ProductCard(
              title: allProduct[index].title,
              price: allProduct[index].price,
            );
          },
        ),
      ),
    );
  }
}
