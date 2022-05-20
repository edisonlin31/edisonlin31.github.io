import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_location.freezed.dart';
part 'vendor_location.g.dart';

@freezed
class VendorLocation with _$VendorLocation {
  const VendorLocation._();
  factory VendorLocation(
      {required int id,
      required String name,
      @JsonKey(name: "default") required bool isDefault,
      String? phone,
      String? zip,
      String? address1,
      String? address2}) = _VendorLocation;

  factory VendorLocation.fromJson(Map<String, dynamic> json) =>
      _$VendorLocationFromJson(json);
}

extension VendorLocationExtension on VendorLocation {
  String get location =>
      '${address1 ?? ''}${address2 == null ? '' : '$address2'}${zip == null ? '' : ', $zip'}';
}
