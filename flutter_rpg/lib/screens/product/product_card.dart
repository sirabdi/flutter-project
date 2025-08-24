import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/product/product.dart';
import 'package:flutter_rpg/providers/cart_provider.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCard extends ConsumerStatefulWidget {
  const ProductCard({
    super.key,
    required this.cartProducts,
    required this.allProducts,
    required this.index,
  });

  final Set<Product> cartProducts;
  final List<Product> allProducts;
  final int index;

  @override
  ConsumerState<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends ConsumerState<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Icon(
                  Icons.book_rounded,
                  size: 80,
                  color: AppColors.textColor,
                ),
              ),
              Column(
                children: [
                  Center(
                    child: StyledTitle(
                      widget.allProducts[widget.index].title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: StyledText(
                      'Rp. ${widget.allProducts[widget.index].price.toString()},-',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryAccent,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: StyledText(
                              '${widget.allProducts[widget.index].qty}',
                            ),
                          ),
                        ),
                        StyledButton(
                          onPressed: () {
                            ref
                                .read(cartNotifierProvider.notifier)
                                .addProductQty(
                                  widget.allProducts[widget.index],
                                  widget.allProducts[widget.index].qty + 1,
                                );
                          },
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),

                  if (widget.cartProducts.contains(
                    widget.allProducts[widget.index],
                  ))
                    StyledButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .removeProduct(widget.allProducts[widget.index]);
                      },
                      child: StyledText('Remove'),
                    ),

                  if (!widget.cartProducts.contains(
                    widget.allProducts[widget.index],
                  ))
                    StyledButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .addProduct(widget.allProducts[widget.index]);
                      },
                      child: StyledText('Add to Cart'),
                    ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 50,
              height: 22,
              decoration: BoxDecoration(
                color: AppColors.secondaryAccent,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Center(
                child: StyledText('${widget.allProducts[widget.index].qty}'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
