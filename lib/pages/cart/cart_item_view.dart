import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wholesale/models/menu.dart';
import 'package:wholesale/utils/extensions/double_extensions.dart';

import '../../models/cart.dart';
import '../../router/router.gr.dart';
import '../../utils/app_text_styles.dart';
import '../../widgets/ripple.dart';
import '../vendor/views/add_to_cart_view.dart';
import '../vendor/views/food_item_view.dart';

class CartItemView extends StatelessWidget {
  final Cart cart;
  final Widget? bottomWidget;
  final Function()? ontap;
  final bool isQtyEditAble;
  const CartItemView({
    required this.cart,
    this.bottomWidget,
    this.ontap,
    this.isQtyEditAble = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Ripple(
            onTap: ontap,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    cart.vendor.name,
                    style: AppTextStyles.medium(
                      fontSize: 16,
                    ),
                  ),
                ),
                if (ontap != null)
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).primaryColor,
                  )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: cart.items.length,
            physics: const ScrollPhysics(),
            itemBuilder: ((context, index) {
              final menu = cart.items[index];
              return Row(
                children: [
                  Expanded(
                    child: FoodItemView(
                      menu: menu,
                      onTap: isQtyEditAble
                          ? () {
                              context.pushRoute(FoodDetailRoute(
                                id: menu.id,
                                vendorId: cart.vendor.id,
                                menu: menu,
                                vendor: cart.vendor,
                                selectedVendorLocation: cart.vendorLocation,
                              ));
                            }
                          : null,
                      child: Padding(
                        padding: EdgeInsets.only(top: isQtyEditAble ? 0 : 12),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              menu.basePrice.toPriceFormat,
                              style: AppTextStyles.regular(
                                fontSize: 12,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              menu.price.toPriceFormat,
                              style: AppTextStyles.regular(),
                            ),
                            if (isQtyEditAble) ...[
                              const Spacer(),
                              AddToCartView(
                                total: menu.cartQty,
                                menu: menu,
                                vendor: cart.vendor,
                                vendorLocation: cart.vendorLocation,
                              ),
                            ]
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (!isQtyEditAble) ...[
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '${menu.cartQty}x',
                      style: AppTextStyles.regular(
                        fontSize: 14,
                        color: Colors.orange,
                      ),
                    ),
                  ]
                ],
              );
            }),
            separatorBuilder: (context, _) {
              return const Divider();
            },
          ),
          if (bottomWidget != null) bottomWidget!,
        ],
      ),
    );
  }
}
