// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vendor_location_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VendorLocationResponse _$VendorLocationResponseFromJson(
    Map<String, dynamic> json) {
  return _VendorLocationResponse.fromJson(json);
}

/// @nodoc
class _$VendorLocationResponseTearOff {
  const _$VendorLocationResponseTearOff();

  _VendorLocationResponse call(
      {required List<VendorLocation> data,
      @JsonKey(name: "next_cursor") String? nextCursor}) {
    return _VendorLocationResponse(
      data: data,
      nextCursor: nextCursor,
    );
  }

  VendorLocationResponse fromJson(Map<String, Object> json) {
    return VendorLocationResponse.fromJson(json);
  }
}

/// @nodoc
const $VendorLocationResponse = _$VendorLocationResponseTearOff();

/// @nodoc
mixin _$VendorLocationResponse {
  List<VendorLocation> get data => throw _privateConstructorUsedError;
  @JsonKey(name: "next_cursor")
  String? get nextCursor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorLocationResponseCopyWith<VendorLocationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorLocationResponseCopyWith<$Res> {
  factory $VendorLocationResponseCopyWith(VendorLocationResponse value,
          $Res Function(VendorLocationResponse) then) =
      _$VendorLocationResponseCopyWithImpl<$Res>;
  $Res call(
      {List<VendorLocation> data,
      @JsonKey(name: "next_cursor") String? nextCursor});
}

/// @nodoc
class _$VendorLocationResponseCopyWithImpl<$Res>
    implements $VendorLocationResponseCopyWith<$Res> {
  _$VendorLocationResponseCopyWithImpl(this._value, this._then);

  final VendorLocationResponse _value;
  // ignore: unused_field
  final $Res Function(VendorLocationResponse) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? nextCursor = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<VendorLocation>,
      nextCursor: nextCursor == freezed
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$VendorLocationResponseCopyWith<$Res>
    implements $VendorLocationResponseCopyWith<$Res> {
  factory _$VendorLocationResponseCopyWith(_VendorLocationResponse value,
          $Res Function(_VendorLocationResponse) then) =
      __$VendorLocationResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<VendorLocation> data,
      @JsonKey(name: "next_cursor") String? nextCursor});
}

/// @nodoc
class __$VendorLocationResponseCopyWithImpl<$Res>
    extends _$VendorLocationResponseCopyWithImpl<$Res>
    implements _$VendorLocationResponseCopyWith<$Res> {
  __$VendorLocationResponseCopyWithImpl(_VendorLocationResponse _value,
      $Res Function(_VendorLocationResponse) _then)
      : super(_value, (v) => _then(v as _VendorLocationResponse));

  @override
  _VendorLocationResponse get _value => super._value as _VendorLocationResponse;

  @override
  $Res call({
    Object? data = freezed,
    Object? nextCursor = freezed,
  }) {
    return _then(_VendorLocationResponse(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<VendorLocation>,
      nextCursor: nextCursor == freezed
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VendorLocationResponse extends _VendorLocationResponse {
  _$_VendorLocationResponse(
      {required this.data, @JsonKey(name: "next_cursor") this.nextCursor})
      : super._();

  factory _$_VendorLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$$_VendorLocationResponseFromJson(json);

  @override
  final List<VendorLocation> data;
  @override
  @JsonKey(name: "next_cursor")
  final String? nextCursor;

  @override
  String toString() {
    return 'VendorLocationResponse(data: $data, nextCursor: $nextCursor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VendorLocationResponse &&
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
  _$VendorLocationResponseCopyWith<_VendorLocationResponse> get copyWith =>
      __$VendorLocationResponseCopyWithImpl<_VendorLocationResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VendorLocationResponseToJson(this);
  }
}

abstract class _VendorLocationResponse extends VendorLocationResponse {
  factory _VendorLocationResponse(
          {required List<VendorLocation> data,
          @JsonKey(name: "next_cursor") String? nextCursor}) =
      _$_VendorLocationResponse;
  _VendorLocationResponse._() : super._();

  factory _VendorLocationResponse.fromJson(Map<String, dynamic> json) =
      _$_VendorLocationResponse.fromJson;

  @override
  List<VendorLocation> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "next_cursor")
  String? get nextCursor => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VendorLocationResponseCopyWith<_VendorLocationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
