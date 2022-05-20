import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cart.dart';

final orderRepositoryProvider = Provider((ref) => OrderRepository());

class OrderRepository {
  List<Cart> orderList = [];
  OrderRepository();

  List<Cart> getOrderList() {
    return orderList;
  }

  List<Cart> addOrder(Cart cart) {
    cart = cart.copyWith(
      orderID: DateTime.now().millisecondsSinceEpoch,
      dateTime: DateTime.now(),
    );
    orderList.insert(0, cart);
    return orderList;
  }
}
