import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/models/vendor.dart';
import 'package:wholesale/models/vendor_response.dart';

import '../repositories/vendor_repository.dart';

final vendorControllerProvider =
    StateNotifierProvider<VendorController, AsyncValue<List<Vendor>>>((ref) {
  return VendorController(ref.read);
});

class VendorController extends StateNotifier<AsyncValue<List<Vendor>>> {
  final Reader _read;

  VendorController(this._read) : super(const AsyncValue.loading()) {
    get();
  }

  get() async {
    VendorResponse response =
        await _read(vendorRepositoryProvider).service.getVendors();
    state = AsyncData(response.data);
  }
}
