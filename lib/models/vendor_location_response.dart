import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wholesale/models/vendor_location.dart';

part 'vendor_location_response.freezed.dart';
part 'vendor_location_response.g.dart';

@freezed
class VendorLocationResponse with _$VendorLocationResponse {
  const VendorLocationResponse._();
  factory VendorLocationResponse({
    required List<VendorLocation> data,
    @JsonKey(name: "next_cursor") String? nextCursor,
  }) = _VendorLocationResponse;

  factory VendorLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$VendorLocationResponseFromJson(json);
}
