import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wholesale/models/menu.dart';
import 'package:wholesale/models/vendor.dart';
import 'package:wholesale/models/vendor_location.dart';
import 'package:wholesale/pages/checkout/views/order_type_view.dart';

part 'cart.freezed.dart';

@freezed
class Cart with _$Cart {
  const Cart._();
  factory Cart({
    required Vendor vendor,
    required List<Menu> items,
    VendorLocation? vendorLocation,
    VendorLocation? deliveryLocation,
    int? orderID,
    DateTime? dateTime,
    @Default(OrderType.delivery) OrderType orderType,
  }) = _Cart;
}

extension CartExtension on Cart {
  double get subTotal {
    double tmp = 0;
    for (var row in items) {
      tmp += row.price * row.cartQty;
    }
    String inString = tmp.toStringAsFixed(2);
    return double.parse(inString);
  }

  double get total {
    return subTotal + 2.0;
  }

  int get totalItems {
    int tmp = 0;
    for (var row in items) {
      tmp += row.cartQty;
    }
    return tmp;
  }
}
