import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/models/load_more_queries.dart';
import 'package:wholesale/models/menu.dart';
import 'package:wholesale/models/menu_response.dart';
import 'package:wholesale/models/vendor.dart';

import '../repositories/vendor_repository.dart';

final menuControllerProvider = StateNotifierProvider.autoDispose
    .family<MenuController, AsyncValue<Vendor>, Vendor>((ref, vendor) {
  return MenuController(ref.read, vendor);
});

class MenuController extends StateNotifier<AsyncValue<Vendor>> {
  final Reader _read;
  final Vendor vendor;
  String? nextCursor;
  bool isLoadMore = false;
  MenuController(this._read, this.vendor) : super(const AsyncValue.loading()) {
    get();
  }

  get() async {
    MenuResponse response = await _read(vendorRepositoryProvider)
        .service
        .getMenus(vendor.id, LoadMoreQueries(cursor: nextCursor));
    if (nextCursor != null && state.value != null) {
      List<Menu> foodList = state.value!.foodList;
      foodList.addAll(response.data);
      final data = vendor.copyWith(foodList: foodList);
      state = AsyncData(data);
    } else {
      final data = vendor.copyWith(foodList: response.data);
      state = AsyncData(data);
    }
    nextCursor = response.nextCursor;
  }

  bool canLoadMore() {
    return nextCursor != null && !isLoadMore;
  }

  Future<void> loadMore() async {
    isLoadMore = true;
    await get();
    isLoadMore = false;
  }
}
