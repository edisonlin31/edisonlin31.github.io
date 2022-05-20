import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/models/cart.dart';
import 'package:wholesale/utils/extensions/double_extensions.dart';
import '../../controllers/cart_list_controller.dart';
import '../../router/router.gr.dart';
import '../../utils/app_text_styles.dart';
import '../../widgets/chechkout_button.dart';
import 'cart_item_view.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: Consumer(
          builder: ((context, ref, child) {
            final asyncValue = ref.watch(cartListControllerProvider);
            return asyncValue.when(data: ((data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  final cart = data[index];

                  return CartItemView(
                    cart: cart,
                    isQtyEditAble: true,
                    ontap: () => context.pushRoute(
                      VendorDetailRoute(
                        id: cart.vendor.id,
                        vendor: cart.vendor,
                      ),
                    ),
                    bottomWidget: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        children: [
                          const Text('Subtotal:'),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            cart.subTotal.toPriceFormat,
                            style: AppTextStyles.bold(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const Spacer(),
                          CheckoutButton(
                            cart: cart,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            }), error: (_, error) {
              return const SizedBox.shrink();
            }, loading: () {
              return const SizedBox.shrink();
            });
          }),
        ));
  }
}
