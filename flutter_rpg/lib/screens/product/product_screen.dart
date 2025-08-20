import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rpg/providers/cart_provider.dart';
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
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

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
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            return ProductCard(
              cartProducts: cartProducts,
              allProducts: allProducts,
              index: index,
            );
          },
        ),
      ),
    );
  }
}
