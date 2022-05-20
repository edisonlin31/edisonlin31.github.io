import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/models/cart.dart';
import 'package:wholesale/utils/extensions/date_extensions.dart';
import 'package:wholesale/utils/extensions/double_extensions.dart';

import '../../controllers/order_controller.dart';
import '../../router/router.gr.dart';
import '../../utils/app_text_styles.dart';
import '../../widgets/ripple.dart';
import '../home/home_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final asyncValue = ref.watch(orderControllerProvider);
          return asyncValue.when(data: ((data) {
            return ListView.builder(
              itemCount: data.length,
              padding: EdgeInsets.zero,
              itemBuilder: ((context, index) {
                final order = data[index];
                final vendor = order.vendor;
                final items = order.items;
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  color: Colors.white,
                  child: Ripple(
                    onTap: () => context.pushRoute(
                      OrderDetailRoute(order: order),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Order ID ${order.orderID ?? '-'}',
                                style: AppTextStyles.regular(fontSize: 14),
                              ),
                              const Spacer(),
                              Text(
                                order.dateTime!.formatString(),
                                style: AppTextStyles.regular(
                                    fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          VendorItem(
                            vendor: vendor,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                children: [
                                  Text(
                                    order.total.toPriceFormat,
                                    style: AppTextStyles.regular(fontSize: 14),
                                  ),
                                  Text(
                                    '  (${items.length} menu${items.length == 1 ? '' : 's'})',
                                    style: AppTextStyles.regular(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Divider(),
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
                  ),
                );
              }),
            );
          }), error: (_, err) {
            return const SizedBox.shrink();
          }, loading: () {
            return const SizedBox.shrink();
          });
        },
      ),
    );
  }
}
