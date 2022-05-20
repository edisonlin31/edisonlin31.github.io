import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:wholesale/controllers/menus_controller.dart';
import 'package:wholesale/models/menu.dart';
import 'package:wholesale/pages/vendor/views/vendor_location_view.dart';
import 'package:wholesale/repositories/vendor_repository.dart';
import 'package:wholesale/utils/extensions/double_extensions.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/cart_list_controller.dart';
import '../../models/vendor.dart';
import '../../models/vendor_location.dart';
import '../../router/router.gr.dart';
import '../../utils/app_text_styles.dart';
import '../../widgets/floating_back_button.dart';
import 'views/add_to_cart_view.dart';
import 'views/cart_view.dart';
import 'views/food_item_view.dart';

class VendorDetailPage extends ConsumerStatefulWidget {
  final Vendor? vendor;
  final int id;
  const VendorDetailPage(
    @PathParam('id') this.id, {
    this.vendor,
    Key? key,
  }) : super(key: key);

  @override
  _RestaurantDetailPageState createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends ConsumerState<VendorDetailPage> {
  Vendor? _vendor;
  final _scrollController = ScrollController();
  VendorLocation? _selectedVendorLocation;
  bool isOnLoadMore = false;
  @override
  void initState() {
    _vendor = widget.vendor;
    if (_vendor == null) {
      ref
          .read(vendorRepositoryProvider)
          .service
          .getVendorDetail(widget.id)
          .then((value) {
        setState(() {
          _vendor = value;
        });
      });
    }
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        if (ref.read(menuControllerProvider(_vendor!).notifier).canLoadMore()) {
          setState(() {
            isOnLoadMore = true;
          });
          await ref.read(menuControllerProvider(_vendor!).notifier).loadMore();
          setState(() {
            isOnLoadMore = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_vendor == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    final vendor = _vendor!;
    return Scaffold(
      bottomNavigationBar: CartView(
        vendor: vendor,
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _HeaderView(
              vendor: vendor,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _RestaurantInformationView(
                  selectedVendorLocation: _selectedVendorLocation,
                  vendor: vendor,
                  onLocationChanged: (val) {
                    setState(() {
                      _selectedVendorLocation = val;
                    });
                  },
                );
              },
              childCount: 1,
            ),
          ),
          Consumer(
            builder: (_, ref, child) {
              var menuAsyncValue = ref.watch(
                menuControllerProvider(vendor),
              );
              return menuAsyncValue.maybeWhen(data: ((data) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final menu = data.foodList[index];
                      Menu? cartItem;
                      var cartAsyncValue = ref.watch(
                        cartControllerProvider(vendor),
                      );
                      return cartAsyncValue.maybeWhen(data: ((cart) {
                        if (cart != null) {
                          final indexFood = cart.items
                              .indexWhere((element) => element.id == menu.id);
                          if (!indexFood.isNegative) {
                            cartItem = cart.items[indexFood];
                          }
                        }
                        final vendorLocation = cart != null
                            ? cart.vendorLocation
                            : _selectedVendorLocation;
                        return FoodItemView(
                          menu: menu,
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 8,
                            bottom: 16,
                          ),
                          onTap: () => context.pushRoute(FoodDetailRoute(
                            id: menu.id,
                            vendorId: vendor.id,
                            menu: menu,
                            vendor: vendor,
                            selectedVendorLocation: vendorLocation,
                          )),
                          child: Row(
                            children: [
                              Text(
                                menu.basePrice.toPriceFormat,
                                style: AppTextStyles.regular(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                menu.price.toPriceFormat,
                                style: AppTextStyles.regular(),
                              ),
                              const Spacer(),
                              AddToCartView(
                                total: cartItem?.cartQty ?? 0,
                                menu: menu,
                                vendor: vendor,
                                vendorLocation: vendorLocation,
                              ),
                            ],
                          ),
                        );
                      }), orElse: () {
                        const SizedBox.shrink();
                      });
                    },
                    childCount: data.foodList.length,
                  ),
                );
              }), loading: () {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    childCount: 1,
                  ),
                );
              }, orElse: () {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return const SizedBox.shrink();
                    },
                    childCount: 1,
                  ),
                );
              });
            },
          ),
          if (isOnLoadMore)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
        ],
      ),
    );
  }
}

class _HeaderView extends SliverPersistentHeaderDelegate {
  final Vendor vendor;
  _HeaderView({required this.vendor});

  double _minExtent = 0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (shrinkOffset > 145) {
          _minExtent = MediaQuery.of(context).padding.top + kToolbarHeight;
          return AppBar(
            title: Text(vendor.name),
          );
        } else {
          _minExtent = 0;
        }
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          floatingActionButton: const FloatingBackButton(),
          body: Container(
            color: Colors.black.withOpacity(0.7),
            height: constraints.maxHeight,
            width: double.infinity,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: vendor.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        vendor.name,
                        style: AppTextStyles.bold(
                          fontSize: 32,
                          color: Colors.white,
                          shadows: <Shadow>[
                            Shadow(
                              offset: const Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            Shadow(
                              offset: const Offset(1.0, 1.0),
                              blurRadius: 8.0,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => 250.0;

  @override
  double get minExtent => _minExtent;
}

class _RestaurantInformationView extends ConsumerWidget {
  final Vendor vendor;
  final VendorLocation? selectedVendorLocation;
  final Function(VendorLocation) onLocationChanged;
  const _RestaurantInformationView({
    required this.vendor,
    required this.onLocationChanged,
    this.selectedVendorLocation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cartAsyncValue = ref.watch(
      cartControllerProvider(vendor),
    );

    return cartAsyncValue.maybeWhen(data: ((data) {
      final vendorLocation =
          data != null ? data.vendorLocation : selectedVendorLocation;
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            VendorLocationView(
              onLocationChanged: onLocationChanged,
              vendor: vendor,
              selectedVendorLocation: vendorLocation,
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              height: 1,
            ),
          ],
        ),
      );
    }), orElse: () {
      return const SizedBox.shrink();
    });
  }
}
