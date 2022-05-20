import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cart.dart';
import '../repositories/cart_repository.dart';

final cartListControllerProvider =
    StateNotifierProvider<CartListController, AsyncValue<List<Cart>>>((ref) {
  return CartListController(ref.read);
});

class CartListController extends StateNotifier<AsyncValue<List<Cart>>> {
  final Reader _read;

  CartListController(this._read) : super(const AsyncValue.loading()) {
    get();
  }

  get() {
    final data = _read(cartRepositoryProvider).getCartList();
    state = AsyncData(data);
  }

  removeCart(Cart cart) {
    final data = _read(cartRepositoryProvider).removeCart(cart);
    state = AsyncData(data);
  }
}
