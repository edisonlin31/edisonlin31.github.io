// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vendor_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VendorResponse _$VendorResponseFromJson(Map<String, dynamic> json) {
  return _VendorResponse.fromJson(json);
}

/// @nodoc
class _$VendorResponseTearOff {
  const _$VendorResponseTearOff();

  _VendorResponse call({required List<Vendor> data}) {
    return _VendorResponse(
      data: data,
    );
  }

  VendorResponse fromJson(Map<String, Object> json) {
    return VendorResponse.fromJson(json);
  }
}

/// @nodoc
const $VendorResponse = _$VendorResponseTearOff();

/// @nodoc
mixin _$VendorResponse {
  List<Vendor> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorResponseCopyWith<VendorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorResponseCopyWith<$Res> {
  factory $VendorResponseCopyWith(
          VendorResponse value, $Res Function(VendorResponse) then) =
      _$VendorResponseCopyWithImpl<$Res>;
  $Res call({List<Vendor> data});
}

/// @nodoc
class _$VendorResponseCopyWithImpl<$Res>
    implements $VendorResponseCopyWith<$Res> {
  _$VendorResponseCopyWithImpl(this._value, this._then);

  final VendorResponse _value;
  // ignore: unused_field
  final $Res Function(VendorResponse) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vendor>,
    ));
  }
}

/// @nodoc
abstract class _$VendorResponseCopyWith<$Res>
    implements $VendorResponseCopyWith<$Res> {
  factory _$VendorResponseCopyWith(
          _VendorResponse value, $Res Function(_VendorResponse) then) =
      __$VendorResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<Vendor> data});
}

/// @nodoc
class __$VendorResponseCopyWithImpl<$Res>
    extends _$VendorResponseCopyWithImpl<$Res>
    implements _$VendorResponseCopyWith<$Res> {
  __$VendorResponseCopyWithImpl(
      _VendorResponse _value, $Res Function(_VendorResponse) _then)
      : super(_value, (v) => _then(v as _VendorResponse));

  @override
  _VendorResponse get _value => super._value as _VendorResponse;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_VendorResponse(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vendor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VendorResponse extends _VendorResponse {
  _$_VendorResponse({required this.data}) : super._();

  factory _$_VendorResponse.fromJson(Map<String, dynamic> json) =>
      _$$_VendorResponseFromJson(json);

  @override
  final List<Vendor> data;

  @override
  String toString() {
    return 'VendorResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VendorResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$VendorResponseCopyWith<_VendorResponse> get copyWith =>
      __$VendorResponseCopyWithImpl<_VendorResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VendorResponseToJson(this);
  }
}

abstract class _VendorResponse extends VendorResponse {
  factory _VendorResponse({required List<Vendor> data}) = _$_VendorResponse;
  _VendorResponse._() : super._();

  factory _VendorResponse.fromJson(Map<String, dynamic> json) =
      _$_VendorResponse.fromJson;

  @override
  List<Vendor> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VendorResponseCopyWith<_VendorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
