import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/models/menu.dart';

import '../models/cart.dart';
import '../models/vendor.dart';
import '../models/vendor_location.dart';
import '../repositories/cart_repository.dart';

final cartControllerProvider = StateNotifierProvider.autoDispose
    .family<CartController, AsyncValue<Cart?>, Vendor>((ref, restaurant) {
  return CartController(ref.read, restaurant);
});

class CartController extends StateNotifier<AsyncValue<Cart?>> {
  final Reader _read;
  final Vendor vendor;

  CartController(this._read, this.vendor) : super(AsyncData(null)) {
    print('goherer');
    find();
  }

  find() {
    final data = _read(cartRepositoryProvider).getCartByRestId(vendor.id);

    state = AsyncData(data);
  }

  updateVendorLocation({required VendorLocation vendorLocation}) {
    final data = state.value?.copyWith(vendorLocation: vendorLocation);
    if (data != null) {
      _read(cartRepositoryProvider).updateCart(data);
    }
    state = AsyncData(data);
  }

  addItem({required Menu menu, VendorLocation? vendorLocation}) {
    Cart? data = state.value;
    menu = menu.copyWith(cartQty: menu.cartQty + 1);
    if (data != null) {
      int existingFoodIndex =
          data.items.indexWhere((element) => element.id == menu.id);
      if (!existingFoodIndex.isNegative) {
        Menu tmp = data.items[existingFoodIndex].copyWith(
          cartQty: data.items[existingFoodIndex].cartQty + 1,
        );
        data.items[existingFoodIndex] = tmp;
      } else {
        data.items.add(menu);
      }
    } else {
      data = Cart(
        vendor: vendor,
        items: List.of([menu]),
        vendorLocation: vendorLocation,
      );
    }
    _read(cartRepositoryProvider).updateCart(data);
    state = AsyncData(data);
  }

  substractItem({required Menu menu}) {
    Cart? data = state.value;
    menu = menu.copyWith(cartQty: menu.cartQty - 1);
    if (data != null) {
      int existingFoodIndex =
          data.items.indexWhere((element) => element.id == menu.id);
      if (!existingFoodIndex.isNegative) {
        Menu tmp = data.items[existingFoodIndex].copyWith(
          cartQty: data.items[existingFoodIndex].cartQty - 1,
        );
        data.items[existingFoodIndex] = tmp;
      }
      if (data.items[existingFoodIndex].cartQty == 0) {
        data.items.removeAt(existingFoodIndex);
      }
      if (data.items.isEmpty) {
        _read(cartRepositoryProvider).removeCart(data);
        state = AsyncData(null);
      } else {
        _read(cartRepositoryProvider).updateCart(data);
        state = AsyncData(data);
      }
    }
  }
}
