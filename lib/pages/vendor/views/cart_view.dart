import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/utils/extensions/double_extensions.dart';

import '../../../controllers/cart_controller.dart';
import '../../../models/cart.dart';
import '../../../models/vendor.dart';
import '../../../utils/app_text_styles.dart';
import '../../../widgets/chechkout_button.dart';

class CartView extends ConsumerWidget {
  final Vendor vendor;
  const CartView({required this.vendor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(cartControllerProvider(vendor));
    return asyncValue.when(data: ((cart) {
      print(cart);
      if (cart == null) {
        return const SizedBox.shrink();
      }
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 20.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: const Offset(
                0.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom + 16),
        child: Row(
          children: [
            Icon(
              Icons.shopping_basket,
              color: Theme.of(context).primaryColor,
              size: 36,
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${cart.totalItems} items',
                  style: AppTextStyles.regular(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Total ${cart.subTotal.toPriceFormat}',
                  style: AppTextStyles.medium(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Spacer(),
            CheckoutButton(
              cart: cart,
            ),
          ],
        ),
      );
    }), error: (_, error) {
      return const SizedBox.shrink();
    }, loading: () {
      return const SizedBox.shrink();
    });
  }
}

class CartView1 extends StatelessWidget {
  final Vendor vendor;
  final WidgetRef ref;
  const CartView1({
    required this.vendor,
    required this.ref,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(cartControllerProvider(vendor));
    return asyncValue.when(data: ((cart) {
      print(cart);
      if (cart == null) {
        return const SizedBox.shrink();
      }
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 20.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: const Offset(
                0.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom + 16),
        child: Row(
          children: [
            Icon(
              Icons.shopping_basket,
              color: Theme.of(context).primaryColor,
              size: 36,
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${cart.totalItems} items',
                  style: AppTextStyles.regular(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Total ${cart.subTotal.toPriceFormat}',
                  style: AppTextStyles.medium(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Spacer(),
            CheckoutButton(
              cart: cart,
            ),
          ],
        ),
      );
    }), error: (_, error) {
      return const SizedBox.shrink();
    }, loading: () {
      return const SizedBox.shrink();
    });
  }
}
