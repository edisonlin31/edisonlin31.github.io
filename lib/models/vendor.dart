import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wholesale/models/menu.dart';
import 'package:wholesale/models/vendor_location.dart';

part 'vendor.freezed.dart';
part 'vendor.g.dart';

@freezed
class Vendor with _$Vendor {
  const Vendor._();
  factory Vendor({
    required int id,
    required String name,
    String? code,
    @Default('') String category,
    @Default('https://cdn.shopify.com/s/files/1/0520/4502/1376/t/24/assets/umamibannermobile7-1646288494220.jpg?v=1646288496')
        String image,
    @Default([]) List<Menu> foodList,
  }) = _Vendor;

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
}

extension VendorExtension on Vendor {
  String get imageUrl {
    return name.toLowerCase() == 'umami'
        ? image
        : 'https://www.pawoon.com/wp-content/uploads/2021/08/Header-18.jpg';
  }
}
