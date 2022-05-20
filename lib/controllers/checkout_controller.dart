import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkoutControllerProvider =
    StateNotifierProvider<CheckoutController, bool>((ref) {
  return CheckoutController(ref.read);
});

class CheckoutController extends StateNotifier<bool> {
  final Reader _read;

  CheckoutController(this._read) : super(false);

  setValid() {
    state = true;
  }
}
