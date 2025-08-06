import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.title, required this.price});

  final String title;
  final double price;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
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
                child: StyledTitle(widget.title, textAlign: TextAlign.center),
              ),
              Center(
                child: StyledText(
                  'Rp. ${widget.price.toString()},-',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
