// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;

import '../models/cart.dart' as _i21;
import '../models/menu.dart' as _i19;
import '../models/vendor.dart' as _i18;
import '../models/vendor_location.dart' as _i20;
import '../pages/account/account_page.dart' as _i15;
import '../pages/address/add_address_page.dart' as _i11;
import '../pages/address/address_list_page.dart' as _i10;
import '../pages/cart/cart_page.dart' as _i13;
import '../pages/checkout/chechkout_page.dart' as _i6;
import '../pages/checkout/delivery_date_page.dart' as _i7;
import '../pages/checkout/payment_page.dart' as _i8;
import '../pages/checkout/views/order_type_view.dart' as _i22;
import '../pages/dashboard_page.dart' as _i3;
import '../pages/home/home_page.dart' as _i12;
import '../pages/login/login_page.dart' as _i1;
import '../pages/login/login_phone_page.dart' as _i2;
import '../pages/order/order_detail_page.dart' as _i9;
import '../pages/order/order_page.dart' as _i14;
import '../pages/vendor/food_detail_page.dart' as _i5;
import '../pages/vendor/vendor_detail_page.dart' as _i4;

class AppRouter extends _i16.RootStackRouter {
  AppRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    LoginPhoneRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPhonePage());
    },
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>(
          orElse: () => const DashboardRouteArgs());
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.DashboardPage(key: args.key));
    },
    VendorDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<VendorDetailRouteArgs>(
          orElse: () => VendorDetailRouteArgs(id: pathParams.getInt('id')));
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.VendorDetailPage(args.id,
              vendor: args.vendor, key: args.key));
    },
    FoodDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<FoodDetailRouteArgs>(
          orElse: () => FoodDetailRouteArgs(
              id: pathParams.getInt('id'),
              vendorId: pathParams.getInt('vendorId')));
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.FoodDetailPage(args.id, args.vendorId,
              menu: args.menu,
              vendor: args.vendor,
              selectedVendorLocation: args.selectedVendorLocation,
              key: args.key));
    },
    CheckoutRoute.name: (routeData) {
      final args = routeData.argsAs<CheckoutRouteArgs>();
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.CheckoutPage(cart: args.cart, key: args.key));
    },
    DeliveryDateRoute.name: (routeData) {
      final args = routeData.argsAs<DeliveryDateRouteArgs>();
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i7.DeliveryDatePage(orderType: args.orderType, key: args.key));
    },
    PaymentRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentRouteArgs>();
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.PaymentPage(
              cart: args.cart, totalPayment: args.totalPayment, key: args.key));
    },
    OrderDetailRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailRouteArgs>();
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.OrderDetailPage(order: args.order, key: args.key));
    },
    AddressListRoute.name: (routeData) {
      final args = routeData.argsAs<AddressListRouteArgs>(
          orElse: () => const AddressListRouteArgs());
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.AddressListPage(onSelect: args.onSelect, key: args.key));
    },
    AddAddressRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.AddAddressPage());
    },
    HomeTab.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.HomePage());
    },
    CartTab.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.CartPage());
    },
    OrderTab.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.OrderPage());
    },
    AccountTab.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.AccountPage());
    }
  };

  @override
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        _i16.RouteConfig(LoginRoute.name, path: '/login'),
        _i16.RouteConfig(LoginPhoneRoute.name, path: '/login/phone'),
        _i16.RouteConfig(DashboardRoute.name, path: '/dashboard', children: [
          _i16.RouteConfig(HomeTab.name,
              path: 'home', parent: DashboardRoute.name),
          _i16.RouteConfig(CartTab.name,
              path: 'cart', parent: DashboardRoute.name),
          _i16.RouteConfig(OrderTab.name,
              path: 'order', parent: DashboardRoute.name),
          _i16.RouteConfig(AccountTab.name,
              path: 'account', parent: DashboardRoute.name)
        ]),
        _i16.RouteConfig(VendorDetailRoute.name,
            path: '/vendor/:id', usesPathAsKey: true),
        _i16.RouteConfig(FoodDetailRoute.name,
            path: '/vendor/:vendorId/menus/:id', usesPathAsKey: true),
        _i16.RouteConfig(CheckoutRoute.name, path: '/checkout'),
        _i16.RouteConfig(DeliveryDateRoute.name,
            path: '/checkout/delivery-date'),
        _i16.RouteConfig(PaymentRoute.name, path: '/checkout/payment'),
        _i16.RouteConfig(OrderDetailRoute.name, path: '/order/detail'),
        _i16.RouteConfig(AddressListRoute.name, path: '/account/addresses'),
        _i16.RouteConfig(AddAddressRoute.name, path: '/account/add-address')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.LoginPhonePage]
class LoginPhoneRoute extends _i16.PageRouteInfo<void> {
  const LoginPhoneRoute() : super(LoginPhoneRoute.name, path: '/login/phone');

  static const String name = 'LoginPhoneRoute';
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i16.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({_i17.Key? key, List<_i16.PageRouteInfo>? children})
      : super(DashboardRoute.name,
            path: '/dashboard',
            args: DashboardRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'DashboardRoute';
}

class DashboardRouteArgs {
  const DashboardRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.VendorDetailPage]
class VendorDetailRoute extends _i16.PageRouteInfo<VendorDetailRouteArgs> {
  VendorDetailRoute({required int id, _i18.Vendor? vendor, _i17.Key? key})
      : super(VendorDetailRoute.name,
            path: '/vendor/:id',
            args: VendorDetailRouteArgs(id: id, vendor: vendor, key: key),
            rawPathParams: {'id': id});

  static const String name = 'VendorDetailRoute';
}

class VendorDetailRouteArgs {
  const VendorDetailRouteArgs({required this.id, this.vendor, this.key});

  final int id;

  final _i18.Vendor? vendor;

  final _i17.Key? key;

  @override
  String toString() {
    return 'VendorDetailRouteArgs{id: $id, vendor: $vendor, key: $key}';
  }
}

/// generated route for
/// [_i5.FoodDetailPage]
class FoodDetailRoute extends _i16.PageRouteInfo<FoodDetailRouteArgs> {
  FoodDetailRoute(
      {required int id,
      required int vendorId,
      _i19.Menu? menu,
      _i18.Vendor? vendor,
      _i20.VendorLocation? selectedVendorLocation,
      _i17.Key? key})
      : super(FoodDetailRoute.name,
            path: '/vendor/:vendorId/menus/:id',
            args: FoodDetailRouteArgs(
                id: id,
                vendorId: vendorId,
                menu: menu,
                vendor: vendor,
                selectedVendorLocation: selectedVendorLocation,
                key: key),
            rawPathParams: {'id': id, 'vendorId': vendorId});

  static const String name = 'FoodDetailRoute';
}

class FoodDetailRouteArgs {
  const FoodDetailRouteArgs(
      {required this.id,
      required this.vendorId,
      this.menu,
      this.vendor,
      this.selectedVendorLocation,
      this.key});

  final int id;

  final int vendorId;

  final _i19.Menu? menu;

  final _i18.Vendor? vendor;

  final _i20.VendorLocation? selectedVendorLocation;

  final _i17.Key? key;

  @override
  String toString() {
    return 'FoodDetailRouteArgs{id: $id, vendorId: $vendorId, menu: $menu, vendor: $vendor, selectedVendorLocation: $selectedVendorLocation, key: $key}';
  }
}

/// generated route for
/// [_i6.CheckoutPage]
class CheckoutRoute extends _i16.PageRouteInfo<CheckoutRouteArgs> {
  CheckoutRoute({required _i21.Cart cart, _i17.Key? key})
      : super(CheckoutRoute.name,
            path: '/checkout', args: CheckoutRouteArgs(cart: cart, key: key));

  static const String name = 'CheckoutRoute';
}

class CheckoutRouteArgs {
  const CheckoutRouteArgs({required this.cart, this.key});

  final _i21.Cart cart;

  final _i17.Key? key;

  @override
  String toString() {
    return 'CheckoutRouteArgs{cart: $cart, key: $key}';
  }
}

/// generated route for
/// [_i7.DeliveryDatePage]
class DeliveryDateRoute extends _i16.PageRouteInfo<DeliveryDateRouteArgs> {
  DeliveryDateRoute({required _i22.OrderType orderType, _i17.Key? key})
      : super(DeliveryDateRoute.name,
            path: '/checkout/delivery-date',
            args: DeliveryDateRouteArgs(orderType: orderType, key: key));

  static const String name = 'DeliveryDateRoute';
}

class DeliveryDateRouteArgs {
  const DeliveryDateRouteArgs({required this.orderType, this.key});

  final _i22.OrderType orderType;

  final _i17.Key? key;

  @override
  String toString() {
    return 'DeliveryDateRouteArgs{orderType: $orderType, key: $key}';
  }
}

/// generated route for
/// [_i8.PaymentPage]
class PaymentRoute extends _i16.PageRouteInfo<PaymentRouteArgs> {
  PaymentRoute(
      {required _i21.Cart cart, required double totalPayment, _i17.Key? key})
      : super(PaymentRoute.name,
            path: '/checkout/payment',
            args: PaymentRouteArgs(
                cart: cart, totalPayment: totalPayment, key: key));

  static const String name = 'PaymentRoute';
}

class PaymentRouteArgs {
  const PaymentRouteArgs(
      {required this.cart, required this.totalPayment, this.key});

  final _i21.Cart cart;

  final double totalPayment;

  final _i17.Key? key;

  @override
  String toString() {
    return 'PaymentRouteArgs{cart: $cart, totalPayment: $totalPayment, key: $key}';
  }
}

/// generated route for
/// [_i9.OrderDetailPage]
class OrderDetailRoute extends _i16.PageRouteInfo<OrderDetailRouteArgs> {
  OrderDetailRoute({required _i21.Cart order, _i17.Key? key})
      : super(OrderDetailRoute.name,
            path: '/order/detail',
            args: OrderDetailRouteArgs(order: order, key: key));

  static const String name = 'OrderDetailRoute';
}

class OrderDetailRouteArgs {
  const OrderDetailRouteArgs({required this.order, this.key});

  final _i21.Cart order;

  final _i17.Key? key;

  @override
  String toString() {
    return 'OrderDetailRouteArgs{order: $order, key: $key}';
  }
}

/// generated route for
/// [_i10.AddressListPage]
class AddressListRoute extends _i16.PageRouteInfo<AddressListRouteArgs> {
  AddressListRoute(
      {dynamic Function(_i20.VendorLocation)? onSelect, _i17.Key? key})
      : super(AddressListRoute.name,
            path: '/account/addresses',
            args: AddressListRouteArgs(onSelect: onSelect, key: key));

  static const String name = 'AddressListRoute';
}

class AddressListRouteArgs {
  const AddressListRouteArgs({this.onSelect, this.key});

  final dynamic Function(_i20.VendorLocation)? onSelect;

  final _i17.Key? key;

  @override
  String toString() {
    return 'AddressListRouteArgs{onSelect: $onSelect, key: $key}';
  }
}

/// generated route for
/// [_i11.AddAddressPage]
class AddAddressRoute extends _i16.PageRouteInfo<void> {
  const AddAddressRoute()
      : super(AddAddressRoute.name, path: '/account/add-address');

  static const String name = 'AddAddressRoute';
}

/// generated route for
/// [_i12.HomePage]
class HomeTab extends _i16.PageRouteInfo<void> {
  const HomeTab() : super(HomeTab.name, path: 'home');

  static const String name = 'HomeTab';
}

/// generated route for
/// [_i13.CartPage]
class CartTab extends _i16.PageRouteInfo<void> {
  const CartTab() : super(CartTab.name, path: 'cart');

  static const String name = 'CartTab';
}

/// generated route for
/// [_i14.OrderPage]
class OrderTab extends _i16.PageRouteInfo<void> {
  const OrderTab() : super(OrderTab.name, path: 'order');

  static const String name = 'OrderTab';
}

/// generated route for
/// [_i15.AccountPage]
class AccountTab extends _i16.PageRouteInfo<void> {
  const AccountTab() : super(AccountTab.name, path: 'account');

  static const String name = 'AccountTab';
}
