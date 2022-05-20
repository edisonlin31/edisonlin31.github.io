import 'package:flutter/material.dart';
import 'package:wholesale/models/vendor_location.dart';

import '../../utils/app_text_styles.dart';
import '../../widgets/ripple.dart';

class AddressView extends StatelessWidget {
  final bool isCheckout;
  final Function(VendorLocation)? onTap;
  final VendorLocation location;
  const AddressView({
    this.isCheckout = false,
    this.onTap,
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      color: Colors.white,
      child: Ripple(
        onTap: onTap != null ? () => onTap!(location) : null,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.pin_drop,
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
                          if (isCheckout) ...[
                            Text(
                              'Delivery Address',
                              style: AppTextStyles.medium(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                          Text('${location.name} | ${location.phone ?? ''}'),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(location.location)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (isCheckout) ...[
                if (onTap != null)
                  Center(
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  ),
              ] else ...[
                Text(
                  'Edit',
                  style: AppTextStyles.medium(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
