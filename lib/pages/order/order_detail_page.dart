import 'package:flutter/material.dart';
import 'package:wholesale/models/vendor_location.dart';
import 'package:wholesale/pages/checkout/views/order_type_view.dart';
import 'package:wholesale/utils/extensions/date_extensions.dart';

import '../../models/cart.dart';
import '../../utils/app_text_styles.dart';
import '../address/address_item_view.dart';
import '../cart/cart_item_view.dart';
import '../checkout/chechkout_page.dart';
import '../checkout/views/delivery_date_view.dart';
import '../checkout/views/price_summary_view.dart';

class OrderDetailPage extends StatefulWidget {
  final Cart order;
  const OrderDetailPage({required this.order, Key? key}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Detail'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Order ID ${widget.order.orderID ?? '-'}',
                          style: AppTextStyles.regular(fontSize: 14),
                        ),
                        const Spacer(),
                        Text(
                          widget.order.dateTime!.formatString(),
                          style: AppTextStyles.regular(
                              fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'On Process',
                      style: AppTextStyles.medium(
                        fontSize: 14,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.order.vendorLocation != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 8),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.storefront,
                        color: Theme.of(context).primaryColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              widget.order.vendorLocation!.name,
                              style: AppTextStyles.medium(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              widget.order.vendorLocation!.location,
                              style: AppTextStyles.regular(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              if (widget.order.orderType.isDelivery &&
                  widget.order.deliveryLocation != null)
                AddressView(
                  location: widget.order.deliveryLocation!,
                  isCheckout: true,
                ),
              DeliveryDateView(
                orderType: widget.order.orderType,
              ),
              CartItemView(
                cart: widget.order,
              ),
              PriceSummaryView(
                cart: widget.order,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {},
                  child: Text(
                    'Cancel Order',
                    style: AppTextStyles.bold(fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
