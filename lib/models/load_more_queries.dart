import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wholesale/models/menu.dart';
import 'package:wholesale/models/vendor.dart';

part 'load_more_queries.freezed.dart';
part 'load_more_queries.g.dart';

@freezed
class LoadMoreQueries with _$LoadMoreQueries {
  const LoadMoreQueries._();
  factory LoadMoreQueries({
    @JsonKey(name: "cursor") String? cursor,
  }) = _MenuResponse;

  factory LoadMoreQueries.fromJson(Map<String, dynamic> json) =>
      _$LoadMoreQueriesFromJson(json);
}
