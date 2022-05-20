import 'package:flutter/material.dart';

import '../../../utils/app_text_styles.dart';
import '../../../widgets/ripple.dart';
import 'order_type_view.dart';

class DeliveryDateView extends StatelessWidget {
  final Function()? onTap;
  final OrderType orderType;
  const DeliveryDateView({this.onTap, required this.orderType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      color: Colors.white,
      child: Ripple(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.schedule,
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
                            orderType.isDelivery
                                ? 'Delivery Time'
                                : 'Pick-up Time',
                            style: AppTextStyles.medium(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text('28 Apr 2022 ( 9:00 am - 10:00 am )'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (onTap != null)
                Center(
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
