import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wholesale/models/menu.dart';
import 'package:wholesale/models/vendor.dart';

part 'menu_response.freezed.dart';
part 'menu_response.g.dart';

@freezed
class MenuResponse with _$MenuResponse {
  const MenuResponse._();
  factory MenuResponse({
    required List<Menu> data,
    @JsonKey(name: "next_cursor") String? nextCursor,
  }) = _MenuResponse;

  factory MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseFromJson(json);
}
