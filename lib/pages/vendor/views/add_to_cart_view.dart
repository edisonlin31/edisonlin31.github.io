import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/models/menu.dart';
import 'package:wholesale/models/vendor.dart';

import '../../../controllers/cart_controller.dart';
import '../../../controllers/cart_list_controller.dart';
import '../../../models/vendor_location.dart';
import '../../../widgets/ripple.dart';

class AddToCartView extends ConsumerWidget {
  final int total;
  final VendorLocation? vendorLocation;
  final Vendor vendor;
  final Menu menu;
  const AddToCartView({
    required this.total,
    required this.vendor,
    required this.menu,
    this.vendorLocation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        if (total == 0) ...[
          const SizedBox.shrink()
        ] else ...[
          ClipOval(
            child: Ripple(
              onTap: () {
                ref
                    .read(cartControllerProvider(vendor).notifier)
                    .substractItem(menu: menu);
                ref.refresh(cartListControllerProvider.notifier).get();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.remove_circle_outline,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Text('    $total   '),
        ],
        ClipOval(
          child: Ripple(
            onTap: () {
              ref.read(cartControllerProvider(vendor).notifier).addItem(
                    menu: menu,
                    vendorLocation: vendorLocation,
                  );
              ref.refresh(cartListControllerProvider.notifier).get();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.add_circle,
                size: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
