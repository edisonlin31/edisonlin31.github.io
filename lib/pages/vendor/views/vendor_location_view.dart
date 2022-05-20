import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/pages/vendor/views/select_vendor_location_view.dart';

import '../../../controllers/cart_controller.dart';
import '../../../controllers/cart_list_controller.dart';
import '../../../controllers/vendor_locations_controller.dart';
import '../../../models/vendor.dart';
import '../../../models/vendor_location.dart';
import '../../../utils/app_text_styles.dart';

class VendorLocationView extends ConsumerWidget {
  final Vendor vendor;
  final Function(VendorLocation) onLocationChanged;
  final VendorLocation? selectedVendorLocation;
  const VendorLocationView({
    Key? key,
    required this.onLocationChanged,
    required this.vendor,
    this.selectedVendorLocation,
  }) : super(key: key);

  void _modalBottomSheetMenu(
    BuildContext context,
    WidgetRef ref,
    List<VendorLocation> locations,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return SelectVendorLocationView(
          locations: locations,
          onLocationChanged: (val) {
            onLocationChanged(val);
            ref
                .read(cartControllerProvider(vendor).notifier)
                .updateVendorLocation(
                  vendorLocation: val,
                );
            ref.refresh(cartListControllerProvider.notifier).get();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncValue = ref.watch(
      vendorLocationsControllerProvider(vendor),
    );
    return asyncValue.maybeWhen(data: ((data) {
      if (data.isEmpty) {
        return const Text('-');
      }
      final location = selectedVendorLocation ?? data[0];
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
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
          const SizedBox(
            width: 12,
          ),
          TextButton(
            onPressed: () => _modalBottomSheetMenu(context, ref, data),
            child: const Text('Change'),
          ),
        ],
      );
    }), loading: () {
      return Center(
          child: Text(
        'Getting vendor locations...',
        style: AppTextStyles.medium(
          fontSize: 12,
          color: Colors.grey,
        ),
      ));
    }, orElse: () {
      return const SizedBox.shrink();
    });
  }
}
