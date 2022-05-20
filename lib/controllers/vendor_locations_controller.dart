import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/models/vendor_location.dart';
import 'package:wholesale/models/vendor_location_response.dart';
import '../models/vendor.dart';
import '../repositories/vendor_repository.dart';

final vendorLocationsControllerProvider = StateNotifierProvider.autoDispose
    .family<VendorLocationsController, AsyncValue<List<VendorLocation>>,
        Vendor>((ref, vendor) {
  return VendorLocationsController(ref.read, vendor);
});

class VendorLocationsController
    extends StateNotifier<AsyncValue<List<VendorLocation>>> {
  final Vendor vendor;
  final Reader _read;

  VendorLocationsController(this._read, this.vendor)
      : super(const AsyncValue.loading()) {
    get();
  }

  get() async {
    VendorLocationResponse response = await _read(vendorRepositoryProvider)
        .service
        .getVendorLocations(vendor.id);
    state = AsyncData(response.data);
  }
}
