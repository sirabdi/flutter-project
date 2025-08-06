import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/product/cart_screen.dart';
import 'package:flutter_rpg/theme.dart';

class CartIcon extends StatefulWidget {
  const CartIcon({super.key});

  @override
  State<CartIcon> createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => CartScreen()),
            );
          },
          icon: Icon(Icons.shopping_bag_outlined, color: AppColors.textColor),
        ),
        Positioned(
          top: 6,
          left: 10,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(9),
            ),
          ),
        ),
      ],
    );
  }
}
