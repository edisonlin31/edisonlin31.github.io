// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'load_more_queries.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoadMoreQueries _$LoadMoreQueriesFromJson(Map<String, dynamic> json) {
  return _MenuResponse.fromJson(json);
}

/// @nodoc
class _$LoadMoreQueriesTearOff {
  const _$LoadMoreQueriesTearOff();

  _MenuResponse call({@JsonKey(name: "cursor") String? cursor}) {
    return _MenuResponse(
      cursor: cursor,
    );
  }

  LoadMoreQueries fromJson(Map<String, Object> json) {
    return LoadMoreQueries.fromJson(json);
  }
}

/// @nodoc
const $LoadMoreQueries = _$LoadMoreQueriesTearOff();

/// @nodoc
mixin _$LoadMoreQueries {
  @JsonKey(name: "cursor")
  String? get cursor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadMoreQueriesCopyWith<LoadMoreQueries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadMoreQueriesCopyWith<$Res> {
  factory $LoadMoreQueriesCopyWith(
          LoadMoreQueries value, $Res Function(LoadMoreQueries) then) =
      _$LoadMoreQueriesCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: "cursor") String? cursor});
}

/// @nodoc
class _$LoadMoreQueriesCopyWithImpl<$Res>
    implements $LoadMoreQueriesCopyWith<$Res> {
  _$LoadMoreQueriesCopyWithImpl(this._value, this._then);

  final LoadMoreQueries _value;
  // ignore: unused_field
  final $Res Function(LoadMoreQueries) _then;

  @override
  $Res call({
    Object? cursor = freezed,
  }) {
    return _then(_value.copyWith(
      cursor: cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MenuResponseCopyWith<$Res>
    implements $LoadMoreQueriesCopyWith<$Res> {
  factory _$MenuResponseCopyWith(
          _MenuResponse value, $Res Function(_MenuResponse) then) =
      __$MenuResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: "cursor") String? cursor});
}

/// @nodoc
class __$MenuResponseCopyWithImpl<$Res>
    extends _$LoadMoreQueriesCopyWithImpl<$Res>
    implements _$MenuResponseCopyWith<$Res> {
  __$MenuResponseCopyWithImpl(
      _MenuResponse _value, $Res Function(_MenuResponse) _then)
      : super(_value, (v) => _then(v as _MenuResponse));

  @override
  _MenuResponse get _value => super._value as _MenuResponse;

  @override
  $Res call({
    Object? cursor = freezed,
  }) {
    return _then(_MenuResponse(
      cursor: cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuResponse extends _MenuResponse {
  _$_MenuResponse({@JsonKey(name: "cursor") this.cursor}) : super._();

  factory _$_MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MenuResponseFromJson(json);

  @override
  @JsonKey(name: "cursor")
  final String? cursor;

  @override
  String toString() {
    return 'LoadMoreQueries(cursor: $cursor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MenuResponse &&
            (identical(other.cursor, cursor) ||
                const DeepCollectionEquality().equals(other.cursor, cursor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cursor);

  @JsonKey(ignore: true)
  @override
  _$MenuResponseCopyWith<_MenuResponse> get copyWith =>
      __$MenuResponseCopyWithImpl<_MenuResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuResponseToJson(this);
  }
}

abstract class _MenuResponse extends LoadMoreQueries {
  factory _MenuResponse({@JsonKey(name: "cursor") String? cursor}) =
      _$_MenuResponse;
  _MenuResponse._() : super._();

  factory _MenuResponse.fromJson(Map<String, dynamic> json) =
      _$_MenuResponse.fromJson;

  @override
  @JsonKey(name: "cursor")
  String? get cursor => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MenuResponseCopyWith<_MenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
