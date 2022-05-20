import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../models/cart.dart';
import '../router/router.gr.dart';
import '../utils/app_text_styles.dart';

class CheckoutButton extends StatelessWidget {
  final Cart cart;
  const CheckoutButton({required this.cart, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        label: const Text('Checkout'),
        icon: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.white,
          size: 24,
        ),
        style: TextButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textStyle: AppTextStyles.bold(
            fontSize: 16,
            color: Theme.of(context).primaryColor,
          ),
        ),
        onPressed: () => context.pushRoute(
          CheckoutRoute(cart: cart),
        ),
      ),
    );
  }
}
