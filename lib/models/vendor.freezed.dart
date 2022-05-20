// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vendor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Vendor _$VendorFromJson(Map<String, dynamic> json) {
  return _Vendor.fromJson(json);
}

/// @nodoc
class _$VendorTearOff {
  const _$VendorTearOff();

  _Vendor call(
      {required int id,
      required String name,
      String? code,
      String category = '',
      String image =
          'https://cdn.shopify.com/s/files/1/0520/4502/1376/t/24/assets/umamibannermobile7-1646288494220.jpg?v=1646288496',
      List<Menu> foodList = const []}) {
    return _Vendor(
      id: id,
      name: name,
      code: code,
      category: category,
      image: image,
      foodList: foodList,
    );
  }

  Vendor fromJson(Map<String, Object> json) {
    return Vendor.fromJson(json);
  }
}

/// @nodoc
const $Vendor = _$VendorTearOff();

/// @nodoc
mixin _$Vendor {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<Menu> get foodList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorCopyWith<Vendor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorCopyWith<$Res> {
  factory $VendorCopyWith(Vendor value, $Res Function(Vendor) then) =
      _$VendorCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String? code,
      String category,
      String image,
      List<Menu> foodList});
}

/// @nodoc
class _$VendorCopyWithImpl<$Res> implements $VendorCopyWith<$Res> {
  _$VendorCopyWithImpl(this._value, this._then);

  final Vendor _value;
  // ignore: unused_field
  final $Res Function(Vendor) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? category = freezed,
    Object? image = freezed,
    Object? foodList = freezed,
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
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      foodList: foodList == freezed
          ? _value.foodList
          : foodList // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
    ));
  }
}

/// @nodoc
abstract class _$VendorCopyWith<$Res> implements $VendorCopyWith<$Res> {
  factory _$VendorCopyWith(_Vendor value, $Res Function(_Vendor) then) =
      __$VendorCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String? code,
      String category,
      String image,
      List<Menu> foodList});
}

/// @nodoc
class __$VendorCopyWithImpl<$Res> extends _$VendorCopyWithImpl<$Res>
    implements _$VendorCopyWith<$Res> {
  __$VendorCopyWithImpl(_Vendor _value, $Res Function(_Vendor) _then)
      : super(_value, (v) => _then(v as _Vendor));

  @override
  _Vendor get _value => super._value as _Vendor;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? category = freezed,
    Object? image = freezed,
    Object? foodList = freezed,
  }) {
    return _then(_Vendor(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      foodList: foodList == freezed
          ? _value.foodList
          : foodList // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Vendor extends _Vendor {
  _$_Vendor(
      {required this.id,
      required this.name,
      this.code,
      this.category = '',
      this.image =
          'https://cdn.shopify.com/s/files/1/0520/4502/1376/t/24/assets/umamibannermobile7-1646288494220.jpg?v=1646288496',
      this.foodList = const []})
      : super._();

  factory _$_Vendor.fromJson(Map<String, dynamic> json) =>
      _$$_VendorFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? code;
  @JsonKey(defaultValue: '')
  @override
  final String category;
  @JsonKey(
      defaultValue:
          'https://cdn.shopify.com/s/files/1/0520/4502/1376/t/24/assets/umamibannermobile7-1646288494220.jpg?v=1646288496')
  @override
  final String image;
  @JsonKey(defaultValue: const [])
  @override
  final List<Menu> foodList;

  @override
  String toString() {
    return 'Vendor(id: $id, name: $name, code: $code, category: $category, image: $image, foodList: $foodList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Vendor &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.foodList, foodList) ||
                const DeepCollectionEquality()
                    .equals(other.foodList, foodList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(foodList);

  @JsonKey(ignore: true)
  @override
  _$VendorCopyWith<_Vendor> get copyWith =>
      __$VendorCopyWithImpl<_Vendor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VendorToJson(this);
  }
}

abstract class _Vendor extends Vendor {
  factory _Vendor(
      {required int id,
      required String name,
      String? code,
      String category,
      String image,
      List<Menu> foodList}) = _$_Vendor;
  _Vendor._() : super._();

  factory _Vendor.fromJson(Map<String, dynamic> json) = _$_Vendor.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get code => throw _privateConstructorUsedError;
  @override
  String get category => throw _privateConstructorUsedError;
  @override
  String get image => throw _privateConstructorUsedError;
  @override
  List<Menu> get foodList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VendorCopyWith<_Vendor> get copyWith => throw _privateConstructorUsedError;
}
