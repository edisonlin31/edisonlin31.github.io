import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/models/menu.dart';
import 'package:wholesale/utils/extensions/double_extensions.dart';

import '../../controllers/cart_controller.dart';
import '../../models/vendor.dart';
import '../../models/vendor_location.dart';
import '../../repositories/vendor_repository.dart';
import '../../utils/app_text_styles.dart';
import '../../widgets/app_text_form_field.dart';
import '../../widgets/floating_back_button.dart';
import 'views/add_to_cart_view.dart';
import 'views/cart_view.dart';

class FoodDetailPage extends ConsumerStatefulWidget {
  final Vendor? vendor;
  final Menu? menu;
  final int id;
  final int vendorId;
  final VendorLocation? selectedVendorLocation;
  const FoodDetailPage(
    @PathParam('id') this.id,
    @PathParam('vendorId') this.vendorId, {
    this.menu,
    this.vendor,
    this.selectedVendorLocation,
    Key? key,
  }) : super(key: key);

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends ConsumerState<FoodDetailPage> {
  Vendor? _vendor;
  Menu? _menu;
  @override
  void initState() {
    _vendor = widget.vendor;
    _menu = widget.menu;
    if (_vendor == null) {
      ref
          .read(vendorRepositoryProvider)
          .service
          .getVendorDetail(widget.vendorId)
          .then((value) {
        setState(() {
          _vendor = value;
        });
      });
    }
    if (_menu == null) {
      ref
          .read(vendorRepositoryProvider)
          .service
          .getMenuDetail(widget.id)
          .then((value) {
        setState(() {
          _menu = value;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_vendor == null || _menu == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    final menu = _menu!;
    final vendor = _vendor!;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: const FloatingBackButton(),
      bottomNavigationBar: CartView(
        vendor: vendor,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 200,
                    child: CachedNetworkImage(
                      imageUrl: menu.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          menu.title,
                          style: AppTextStyles.bold(fontSize: 24),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          menu.shortTitle,
                          style: AppTextStyles.regular(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Text(
                              menu.basePrice.toPriceFormat,
                              style: AppTextStyles.regular(
                                fontSize: 16,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              menu.price.toPriceFormat,
                              style: AppTextStyles.medium(fontSize: 20),
                            ),
                            const Spacer(),
                            _AddToCartConsumerView(
                              vendor: vendor,
                              menu: menu,
                              selectedVendorLocation:
                                  widget.selectedVendorLocation,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(top: 16),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Note to restaurant',
                              style: AppTextStyles.bold(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              ' (Optional)',
                              style: AppTextStyles.regular(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 24),
                          child: AppTextFormField(
                            hintText: 'Add your request here..',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddToCartConsumerView extends StatelessWidget {
  final Vendor vendor;
  final Menu menu;
  final VendorLocation? selectedVendorLocation;
  const _AddToCartConsumerView({
    required this.vendor,
    required this.menu,
    this.selectedVendorLocation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: ((context, ref, child) {
        final asyncValue = ref.watch(cartControllerProvider(vendor));
        return asyncValue.when(data: ((cart) {
          Menu? cartItem;
          if (cart != null) {
            final indexFood =
                cart.items.indexWhere((element) => element.id == menu.id);
            if (!indexFood.isNegative) {
              cartItem = cart.items[indexFood];
            }
          }
          return AddToCartView(
            total: cartItem?.cartQty ?? 0,
            vendor: vendor,
            menu: menu,
            vendorLocation: selectedVendorLocation,
          );
        }), error: (_, error) {
          return const SizedBox.shrink();
        }, loading: () {
          return const SizedBox.shrink();
        });
      }),
    );
  }
}
