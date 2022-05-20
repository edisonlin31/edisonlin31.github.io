import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_text_styles.dart';

enum OrderType { selfPickup, delivery }

extension OrderTypeExtension on OrderType {
  bool get isDelivery => this == OrderType.delivery;
}

class OrderTypeView extends StatelessWidget {
  final OrderType selectedValue;
  final Function(OrderType) onChanged;
  const OrderTypeView(
      {required this.selectedValue, required this.onChanged, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Order Type',
            style: AppTextStyles.medium(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CupertinoSegmentedControl(
            padding: EdgeInsets.zero,
            children: {
              OrderType.delivery: Text(
                'Delivery',
                style: AppTextStyles.medium(
                  fontSize: 14,
                ),
              ),
              OrderType.selfPickup: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Self Pick-up',
                  style: AppTextStyles.medium(
                    fontSize: 14,
                  ),
                ),
              ),
            },
            onValueChanged: onChanged,
            groupValue: selectedValue,
          )
        ],
      ),
    );
  }
}
