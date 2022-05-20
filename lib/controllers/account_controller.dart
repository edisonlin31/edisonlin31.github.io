import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/models/vendor.dart';
import 'package:wholesale/models/vendor_response.dart';
import 'package:wholesale/repositories/account_repository.dart';

import '../repositories/vendor_repository.dart';

final accountControllerProvider =
    StateNotifierProvider<VendorController, Vendor?>((ref) {
  return VendorController(ref.read);
});

class VendorController extends StateNotifier<Vendor?> {
  final Reader _read;

  VendorController(this._read) : super(null);

  getCurrentAccount() {
    return state;
  }

  setAccount(Vendor account) {
    state = account;
  }
}
