// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menu_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) {
  return _MenuResponse.fromJson(json);
}

/// @nodoc
class _$MenuResponseTearOff {
  const _$MenuResponseTearOff();

  _MenuResponse call(
      {required List<Menu> data,
      @JsonKey(name: "next_cursor") String? nextCursor}) {
    return _MenuResponse(
      data: data,
      nextCursor: nextCursor,
    );
  }

  MenuResponse fromJson(Map<String, Object> json) {
    return MenuResponse.fromJson(json);
  }
}

/// @nodoc
const $MenuResponse = _$MenuResponseTearOff();

/// @nodoc
mixin _$MenuResponse {
  List<Menu> get data => throw _privateConstructorUsedError;
  @JsonKey(name: "next_cursor")
  String? get nextCursor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuResponseCopyWith<MenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuResponseCopyWith<$Res> {
  factory $MenuResponseCopyWith(
          MenuResponse value, $Res Function(MenuResponse) then) =
      _$MenuResponseCopyWithImpl<$Res>;
  $Res call(
      {List<Menu> data, @JsonKey(name: "next_cursor") String? nextCursor});
}

/// @nodoc
class _$MenuResponseCopyWithImpl<$Res> implements $MenuResponseCopyWith<$Res> {
  _$MenuResponseCopyWithImpl(this._value, this._then);

  final MenuResponse _value;
  // ignore: unused_field
  final $Res Function(MenuResponse) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? nextCursor = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
      nextCursor: nextCursor == freezed
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MenuResponseCopyWith<$Res>
    implements $MenuResponseCopyWith<$Res> {
  factory _$MenuResponseCopyWith(
          _MenuResponse value, $Res Function(_MenuResponse) then) =
      __$MenuResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Menu> data, @JsonKey(name: "next_cursor") String? nextCursor});
}

/// @nodoc
class __$MenuResponseCopyWithImpl<$Res> extends _$MenuResponseCopyWithImpl<$Res>
    implements _$MenuResponseCopyWith<$Res> {
  __$MenuResponseCopyWithImpl(
      _MenuResponse _value, $Res Function(_MenuResponse) _then)
      : super(_value, (v) => _then(v as _MenuResponse));

  @override
  _MenuResponse get _value => super._value as _MenuResponse;

  @override
  $Res call({
    Object? data = freezed,
    Object? nextCursor = freezed,
  }) {
    return _then(_MenuResponse(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
      nextCursor: nextCursor == freezed
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuResponse extends _MenuResponse {
  _$_MenuResponse(
      {required this.data, @JsonKey(name: "next_cursor") this.nextCursor})
      : super._();

  factory _$_MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MenuResponseFromJson(json);

  @override
  final List<Menu> data;
  @override
  @JsonKey(name: "next_cursor")
  final String? nextCursor;

  @override
  String toString() {
    return 'MenuResponse(data: $data, nextCursor: $nextCursor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MenuResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.nextCursor, nextCursor) ||
                const DeepCollectionEquality()
                    .equals(other.nextCursor, nextCursor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(nextCursor);

  @JsonKey(ignore: true)
  @override
  _$MenuResponseCopyWith<_MenuResponse> get copyWith =>
      __$MenuResponseCopyWithImpl<_MenuResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuResponseToJson(this);
  }
}

abstract class _MenuResponse extends MenuResponse {
  factory _MenuResponse(
      {required List<Menu> data,
      @JsonKey(name: "next_cursor") String? nextCursor}) = _$_MenuResponse;
  _MenuResponse._() : super._();

  factory _MenuResponse.fromJson(Map<String, dynamic> json) =
      _$_MenuResponse.fromJson;

  @override
  List<Menu> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "next_cursor")
  String? get nextCursor => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MenuResponseCopyWith<_MenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
