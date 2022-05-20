import 'package:flutter/material.dart';
import 'package:wholesale/utils/extensions/double_extensions.dart';

import '../../../models/cart.dart';
import '../../../utils/app_text_styles.dart';

class PriceSummaryView extends StatelessWidget {
  final Cart cart;
  final double deliveryFee;
  const PriceSummaryView({
    required this.cart,
    this.deliveryFee = 12,
    Key? key,
  }) : super(key: key);

  Widget _getRowLabel({
    required String title,
    required String value,
    TextStyle? textStyle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textStyle,
        ),
        Text(
          value,
          style: textStyle,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      color: Colors.white,
      child: Column(
        children: [
          _getRowLabel(title: 'Subtotal', value: cart.subTotal.toPriceFormat),
          const SizedBox(
            height: 6,
          ),
          _getRowLabel(title: 'Delivery Fee', value: deliveryFee.toPriceFormat),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(),
          ),
          _getRowLabel(
            title: 'Total Payment',
            value: (cart.subTotal + deliveryFee).toPriceFormat,
            textStyle: AppTextStyles.bold(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
