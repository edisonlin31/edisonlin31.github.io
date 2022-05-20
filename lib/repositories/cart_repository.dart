import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cart.dart';

final cartRepositoryProvider = Provider((ref) => CartRepository());

class CartRepository {
  List<Cart> cartList = [];
  CartRepository();

  List<Cart> getCartList() {
    return cartList;
  }

  Cart? getCartByRestId(int vendorId) {
    final index =
        cartList.indexWhere((element) => element.vendor.id == vendorId);
    return index.isNegative ? null : cartList[index];
  }

  updateCart(Cart cart) {
    final index =
        cartList.indexWhere((element) => element.vendor.id == cart.vendor.id);
    if (!index.isNegative) {
      cartList[index] = cart;
    } else {
      cartList.add(cart);
    }
  }

  List<Cart> removeCart(Cart cart) {
    final index =
        cartList.indexWhere((element) => element.vendor.id == cart.vendor.id);
    if (!index.isNegative) {
      cartList.removeAt(index);
    }
    return cartList;
  }
}
