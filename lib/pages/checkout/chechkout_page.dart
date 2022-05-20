import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/widgets/ripple.dart';
import '../../controllers/account_addresses_controller.dart';
import '../../controllers/account_controller.dart';
import '../../controllers/dashboard_controller.dart';
import '../../controllers/order_controller.dart';
import '../../models/cart.dart';
import '../../models/vendor_location.dart';
import '../../router/router.gr.dart';
import '../../utils/app_text_styles.dart';
import '../address/address_item_view.dart';
import '../cart/cart_item_view.dart';
import '../vendor/views/vendor_location_view.dart';
import 'views/delivery_date_view.dart';
import 'views/order_type_view.dart';
import 'views/price_summary_view.dart';

class CheckoutPage extends StatefulWidget {
  final Cart cart;
  const CheckoutPage({required this.cart, Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  OrderType _selectedOrderType = OrderType.delivery;
  VendorLocation? _selectedVendorLocation;
  VendorLocation? _selectedDeliveryAddress;

  @override
  void initState() {
    _selectedVendorLocation = widget.cart.vendorLocation;
    super.initState();
  }

  onMakeOrderTap() {
    final order = widget.cart.copyWith(
      vendorLocation: _selectedVendorLocation,
      orderType: _selectedOrderType,
      deliveryLocation: _selectedDeliveryAddress,
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _AlertSuccess(
          order: order,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      bottomNavigationBar: _BottomBarView(
        onMakeOrderTap: () => onMakeOrderTap(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 8),
              child: VendorLocationView(
                selectedVendorLocation: _selectedVendorLocation,
                onLocationChanged: (val) {
                  setState(() {
                    _selectedVendorLocation = val;
                  });
                },
                vendor: widget.cart.vendor,
              ),
            ),
            OrderTypeView(
              selectedValue: _selectedOrderType,
              onChanged: (val) {
                setState(() {
                  _selectedOrderType = val;
                });
              },
            ),
            Consumer(
              builder: ((context, ref, child) {
                final account = ref
                    .read(accountControllerProvider.notifier)
                    .getCurrentAccount();
                final asyncData =
                    ref.watch(accountAddressesControllerProvider(account.id));
                if (_selectedOrderType.isDelivery) {
                  return asyncData.maybeWhen(
                    data: ((data) {
                      if (data.isNotEmpty) {
                        _selectedDeliveryAddress ??= data[0];
                        return AddressView(
                          isCheckout: true,
                          location: _selectedDeliveryAddress!,
                          onTap: (val) => context.pushRoute(
                            AddressListRoute(onSelect: (val) {
                              context.popRoute();
                              setState(() {
                                _selectedDeliveryAddress = val;
                              });
                            }),
                          ),
                        );
                      }
                      return Container(
                        color: Colors.white,
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Ripple(
                          onTap: () => context.pushRoute(AddressListRoute()),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              'Add New Address',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.medium(
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    loading: () {
                      return Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Center(
                            child: Text(
                          'Getting vendor locations...',
                          style: AppTextStyles.medium(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        )),
                      );
                    },
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ),
            DeliveryDateView(
              orderType: _selectedOrderType,
              onTap: () => context.pushRoute(
                DeliveryDateRoute(orderType: _selectedOrderType),
              ),
            ),
            CartItemView(
              cart: widget.cart,
            ),
            PriceSummaryView(
              cart: widget.cart,
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomBarView extends ConsumerWidget {
  final Function() onMakeOrderTap;
  const _BottomBarView({required this.onMakeOrderTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      child: ElevatedButton(
        onPressed: onMakeOrderTap,
        child: Text(
          'Make Order',
          style: AppTextStyles.bold(fontSize: 16),
        ),
      ),
    );
  }
}

class _AlertSuccess extends ConsumerWidget {
  final Cart order;
  const _AlertSuccess({required this.order, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget okButton = TextButton(
      child: const Text("Ok"),
      onPressed: () {
        context.popRoute();
        ref.refresh(orderControllerProvider.notifier).addOrder(order);
        ref.refresh(dashboardControllerProvider.notifier).setSelectedTabs(2);
        context.router.popUntilRoot();
      },
    );

    return AlertDialog(
      title: const Text("Order Successful"),
      content: const Text(""),
      actions: [
        okButton,
      ],
    );
  }
}
