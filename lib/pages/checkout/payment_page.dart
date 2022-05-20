import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controllers/dashboard_controller.dart';
import '../../controllers/order_controller.dart';
import '../../models/cart.dart';
import '../../utils/app_text_styles.dart';

class PaymentPage extends StatefulWidget {
  final Cart cart;
  final double totalPayment;
  const PaymentPage({
    required this.cart,
    required this.totalPayment,
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  onPayTap() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _AlertSuccess(
          cart: widget.cart,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Total Payment \$${widget.totalPayment}'),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () => onPayTap(),
                  child: Text(
                    'Pay Now',
                    style: AppTextStyles.bold(fontSize: 16),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AlertSuccess extends ConsumerWidget {
  final Cart cart;
  const _AlertSuccess({required this.cart, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget okButton = TextButton(
      child: const Text("Ok"),
      onPressed: () {
        context.popRoute();
        ref.refresh(orderControllerProvider.notifier).addOrder(cart);
        ref.refresh(dashboardControllerProvider.notifier).setSelectedTabs(2);
        context.router.popUntilRoot();
      },
    );

    return AlertDialog(
      title: const Text("Payment Successful"),
      content: const Text("This is my message."),
      actions: [
        okButton,
      ],
    );
  }
}
