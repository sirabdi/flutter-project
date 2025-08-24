import 'package:flutter_rpg/models/product/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Set<Product> build() {
    return {};
  }

  void addProductQty(Product product, int qty) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = {...state}..remove(product);
    }
  }

  void clearCart() {
    state = {};
  }
}
