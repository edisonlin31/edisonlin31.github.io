import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cart.dart';
import '../repositories/order_repository.dart';
import 'cart_list_controller.dart';

final orderControllerProvider =
    StateNotifierProvider<OrderController, AsyncValue<List<Cart>>>((ref) {
  return OrderController(ref.read);
});

class OrderController extends StateNotifier<AsyncValue<List<Cart>>> {
  final Reader _read;

  OrderController(this._read) : super(const AsyncValue.loading()) {
    get();
  }

  get() {
    final data = _read(orderRepositoryProvider).getOrderList();
    state = AsyncData(data);
  }

  addOrder(Cart cart) {
    final data = _read(orderRepositoryProvider).addOrder(cart);
    _read(cartListControllerProvider.notifier).removeCart(cart);
    state = AsyncData(data);
  }
}
