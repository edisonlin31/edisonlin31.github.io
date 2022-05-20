// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vendor_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VendorLocation _$VendorLocationFromJson(Map<String, dynamic> json) {
  return _VendorLocation.fromJson(json);
}

/// @nodoc
class _$VendorLocationTearOff {
  const _$VendorLocationTearOff();

  _VendorLocation call(
      {required int id,
      required String name,
      @JsonKey(name: "default") required bool isDefault,
      String? phone,
      String? zip,
      String? address1,
      String? address2}) {
    return _VendorLocation(
      id: id,
      name: name,
      isDefault: isDefault,
      phone: phone,
      zip: zip,
      address1: address1,
      address2: address2,
    );
  }

  VendorLocation fromJson(Map<String, Object> json) {
    return VendorLocation.fromJson(json);
  }
}

/// @nodoc
const $VendorLocation = _$VendorLocationTearOff();

/// @nodoc
mixin _$VendorLocation {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "default")
  bool get isDefault => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get zip => throw _privateConstructorUsedError;
  String? get address1 => throw _privateConstructorUsedError;
  String? get address2 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorLocationCopyWith<VendorLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorLocationCopyWith<$Res> {
  factory $VendorLocationCopyWith(
          VendorLocation value, $Res Function(VendorLocation) then) =
      _$VendorLocationCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      @JsonKey(name: "default") bool isDefault,
      String? phone,
      String? zip,
      String? address1,
      String? address2});
}

/// @nodoc
class _$VendorLocationCopyWithImpl<$Res>
    implements $VendorLocationCopyWith<$Res> {
  _$VendorLocationCopyWithImpl(this._value, this._then);

  final VendorLocation _value;
  // ignore: unused_field
  final $Res Function(VendorLocation) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isDefault = freezed,
    Object? phone = freezed,
    Object? zip = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: isDefault == freezed
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      zip: zip == freezed
          ? _value.zip
          : zip // ignore: cast_nullable_to_non_nullable
              as String?,
      address1: address1 == freezed
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: address2 == freezed
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$VendorLocationCopyWith<$Res>
    implements $VendorLocationCopyWith<$Res> {
  factory _$VendorLocationCopyWith(
          _VendorLocation value, $Res Function(_VendorLocation) then) =
      __$VendorLocationCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      @JsonKey(name: "default") bool isDefault,
      String? phone,
      String? zip,
      String? address1,
      String? address2});
}

/// @nodoc
class __$VendorLocationCopyWithImpl<$Res>
    extends _$VendorLocationCopyWithImpl<$Res>
    implements _$VendorLocationCopyWith<$Res> {
  __$VendorLocationCopyWithImpl(
      _VendorLocation _value, $Res Function(_VendorLocation) _then)
      : super(_value, (v) => _then(v as _VendorLocation));

  @override
  _VendorLocation get _value => super._value as _VendorLocation;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isDefault = freezed,
    Object? phone = freezed,
    Object? zip = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
  }) {
    return _then(_VendorLocation(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: isDefault == freezed
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      zip: zip == freezed
          ? _value.zip
          : zip // ignore: cast_nullable_to_non_nullable
              as String?,
      address1: address1 == freezed
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: address2 == freezed
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VendorLocation extends _VendorLocation {
  _$_VendorLocation(
      {required this.id,
      required this.name,
      @JsonKey(name: "default") required this.isDefault,
      this.phone,
      this.zip,
      this.address1,
      this.address2})
      : super._();

  factory _$_VendorLocation.fromJson(Map<String, dynamic> json) =>
      _$$_VendorLocationFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: "default")
  final bool isDefault;
  @override
  final String? phone;
  @override
  final String? zip;
  @override
  final String? address1;
  @override
  final String? address2;

  @override
  String toString() {
    return 'VendorLocation(id: $id, name: $name, isDefault: $isDefault, phone: $phone, zip: $zip, address1: $address1, address2: $address2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VendorLocation &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.isDefault, isDefault) ||
                const DeepCollectionEquality()
                    .equals(other.isDefault, isDefault)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.zip, zip) ||
                const DeepCollectionEquality().equals(other.zip, zip)) &&
            (identical(other.address1, address1) ||
                const DeepCollectionEquality()
                    .equals(other.address1, address1)) &&
            (identical(other.address2, address2) ||
                const DeepCollectionEquality()
                    .equals(other.address2, address2)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(isDefault) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(zip) ^
      const DeepCollectionEquality().hash(address1) ^
      const DeepCollectionEquality().hash(address2);

  @JsonKey(ignore: true)
  @override
  _$VendorLocationCopyWith<_VendorLocation> get copyWith =>
      __$VendorLocationCopyWithImpl<_VendorLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VendorLocationToJson(this);
  }
}

abstract class _VendorLocation extends VendorLocation {
  factory _VendorLocation(
      {required int id,
      required String name,
      @JsonKey(name: "default") required bool isDefault,
      String? phone,
      String? zip,
      String? address1,
      String? address2}) = _$_VendorLocation;
  _VendorLocation._() : super._();

  factory _VendorLocation.fromJson(Map<String, dynamic> json) =
      _$_VendorLocation.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "default")
  bool get isDefault => throw _privateConstructorUsedError;
  @override
  String? get phone => throw _privateConstructorUsedError;
  @override
  String? get zip => throw _privateConstructorUsedError;
  @override
  String? get address1 => throw _privateConstructorUsedError;
  @override
  String? get address2 => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VendorLocationCopyWith<_VendorLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
