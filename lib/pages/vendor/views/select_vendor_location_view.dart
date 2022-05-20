import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wholesale/models/vendor.dart';

import '../../../models/vendor_location.dart';
import '../../../utils/app_text_styles.dart';
import '../../../widgets/ripple.dart';

class SelectVendorLocationView extends StatelessWidget {
  final List<VendorLocation> locations;
  final Function(VendorLocation) onLocationChanged;
  const SelectVendorLocationView({
    required this.locations,
    required this.onLocationChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 12,
                  top: 12,
                ),
                child: Text(
                  'Select Store Location',
                  style: AppTextStyles.medium(
                    fontSize: 16,
                  ),
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView.separated(
                  itemCount: locations.length,
                  itemBuilder: ((context, index) {
                    final location = locations[index];
                    return Ripple(
                      onTap: () {
                        context.popRoute();
                        onLocationChanged(location);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              location.name,
                              style: AppTextStyles.medium(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              location.location,
                              style: AppTextStyles.regular(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 1,
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
