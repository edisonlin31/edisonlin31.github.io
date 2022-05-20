import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wholesale/models/vendor.dart';

part 'vendor_response.freezed.dart';
part 'vendor_response.g.dart';

@freezed
class VendorResponse with _$VendorResponse {
  const VendorResponse._();
  factory VendorResponse({
    required List<Vendor> data,
  }) = _VendorResponse;

  factory VendorResponse.fromJson(Map<String, dynamic> json) =>
      _$VendorResponseFromJson(json);
}
