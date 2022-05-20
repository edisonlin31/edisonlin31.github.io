import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/controllers/account_controller.dart';
import 'package:wholesale/models/vendor.dart';
import 'package:wholesale/models/vendor_response.dart';
import 'package:wholesale/repositories/account_repository.dart';

import '../repositories/vendor_repository.dart';

final accountListControllerProvider =
    StateNotifierProvider<VendorListController, AsyncValue<List<Vendor>>>(
        (ref) {
  return VendorListController(ref.read);
});

class VendorListController extends StateNotifier<AsyncValue<List<Vendor>>> {
  final Reader _read;

  VendorListController(this._read) : super(const AsyncValue.loading()) {
    get();
  }

  get() async {
    VendorResponse response =
        await _read(accountRepositoryProvider).service.getVendors();
    final account =
        _read(accountControllerProvider.notifier).getCurrentAccount();
    if (account == null && response.data.isNotEmpty) {
      _read(accountControllerProvider.notifier).setAccount(response.data[0]);
    }
    state = AsyncData(response.data);
  }
}
