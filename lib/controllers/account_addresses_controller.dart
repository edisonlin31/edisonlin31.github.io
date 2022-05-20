import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/controllers/account_controller.dart';
import 'package:wholesale/models/vendor_location.dart';
import 'package:wholesale/models/vendor_location_response.dart';
import 'package:wholesale/repositories/account_repository.dart';

final accountAddressesControllerProvider = StateNotifierProvider.autoDispose
    .family<AccountAddressesController, AsyncValue<List<VendorLocation>>, int>(
        (ref, accountId) {
  return AccountAddressesController(ref.read, accountId);
});

class AccountAddressesController
    extends StateNotifier<AsyncValue<List<VendorLocation>>> {
  final Reader _read;
  final int accountId;

  AccountAddressesController(this._read, this.accountId)
      : super(const AsyncValue.loading()) {
    get();
  }

  get() async {
    VendorLocationResponse response =
        await _read(accountRepositoryProvider).service.getLocations(accountId);
    state = AsyncData(response.data);
  }
}
