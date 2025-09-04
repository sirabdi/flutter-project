import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rpg/models/product/product.dart';
import 'package:flutter_rpg/providers/cart_provider.dart';
import 'package:flutter_rpg/providers/products_provider.dart';
import 'package:flutter_rpg/screens/product/product_screen.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedProduct = ref.watch(cartNotifierProvider).toList();
    final totalProduct = ref.watch(cartTotalProvider);

    return Scaffold(
      appBar: AppBar(
        title: StyledHeading('My Cart'),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (ctx) => ProductScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: selectedProduct.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: ValueKey(selectedProduct[index].id),
                    child: ListTile(
                      title: StyledTitle(selectedProduct[index].title),
                      subtitle: StyledTitle('${selectedProduct[index].qty}'),
                      tileColor: AppColors.secondaryColor,
                      trailing: StyledText(
                        'Rp. ${selectedProduct[index].price.toString()},-',
                      ),
                    ),
                  );
                },
              ),
            ),
            StyledTitle('Total Price: $totalProduct'),
          ],
        ),
      ),
    );
  }
}
