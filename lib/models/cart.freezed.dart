// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CartTearOff {
  const _$CartTearOff();

  _Cart call(
      {required Vendor vendor,
      required List<Menu> items,
      VendorLocation? vendorLocation,
      VendorLocation? deliveryLocation,
      int? orderID,
      DateTime? dateTime,
      OrderType orderType = OrderType.delivery}) {
    return _Cart(
      vendor: vendor,
      items: items,
      vendorLocation: vendorLocation,
      deliveryLocation: deliveryLocation,
      orderID: orderID,
      dateTime: dateTime,
      orderType: orderType,
    );
  }
}

/// @nodoc
const $Cart = _$CartTearOff();

/// @nodoc
mixin _$Cart {
  Vendor get vendor => throw _privateConstructorUsedError;
  List<Menu> get items => throw _privateConstructorUsedError;
  VendorLocation? get vendorLocation => throw _privateConstructorUsedError;
  VendorLocation? get deliveryLocation => throw _privateConstructorUsedError;
  int? get orderID => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;
  OrderType get orderType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res>;
  $Res call(
      {Vendor vendor,
      List<Menu> items,
      VendorLocation? vendorLocation,
      VendorLocation? deliveryLocation,
      int? orderID,
      DateTime? dateTime,
      OrderType orderType});

  $VendorCopyWith<$Res> get vendor;
  $VendorLocationCopyWith<$Res>? get vendorLocation;
  $VendorLocationCopyWith<$Res>? get deliveryLocation;
}

/// @nodoc
class _$CartCopyWithImpl<$Res> implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  final Cart _value;
  // ignore: unused_field
  final $Res Function(Cart) _then;

  @override
  $Res call({
    Object? vendor = freezed,
    Object? items = freezed,
    Object? vendorLocation = freezed,
    Object? deliveryLocation = freezed,
    Object? orderID = freezed,
    Object? dateTime = freezed,
    Object? orderType = freezed,
  }) {
    return _then(_value.copyWith(
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as Vendor,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
      vendorLocation: vendorLocation == freezed
          ? _value.vendorLocation
          : vendorLocation // ignore: cast_nullable_to_non_nullable
              as VendorLocation?,
      deliveryLocation: deliveryLocation == freezed
          ? _value.deliveryLocation
          : deliveryLocation // ignore: cast_nullable_to_non_nullable
              as VendorLocation?,
      orderID: orderID == freezed
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      orderType: orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType,
    ));
  }

  @override
  $VendorCopyWith<$Res> get vendor {
    return $VendorCopyWith<$Res>(_value.vendor, (value) {
      return _then(_value.copyWith(vendor: value));
    });
  }

  @override
  $VendorLocationCopyWith<$Res>? get vendorLocation {
    if (_value.vendorLocation == null) {
      return null;
    }

    return $VendorLocationCopyWith<$Res>(_value.vendorLocation!, (value) {
      return _then(_value.copyWith(vendorLocation: value));
    });
  }

  @override
  $VendorLocationCopyWith<$Res>? get deliveryLocation {
    if (_value.deliveryLocation == null) {
      return null;
    }

    return $VendorLocationCopyWith<$Res>(_value.deliveryLocation!, (value) {
      return _then(_value.copyWith(deliveryLocation: value));
    });
  }
}

/// @nodoc
abstract class _$CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$CartCopyWith(_Cart value, $Res Function(_Cart) then) =
      __$CartCopyWithImpl<$Res>;
  @override
  $Res call(
      {Vendor vendor,
      List<Menu> items,
      VendorLocation? vendorLocation,
      VendorLocation? deliveryLocation,
      int? orderID,
      DateTime? dateTime,
      OrderType orderType});

  @override
  $VendorCopyWith<$Res> get vendor;
  @override
  $VendorLocationCopyWith<$Res>? get vendorLocation;
  @override
  $VendorLocationCopyWith<$Res>? get deliveryLocation;
}

/// @nodoc
class __$CartCopyWithImpl<$Res> extends _$CartCopyWithImpl<$Res>
    implements _$CartCopyWith<$Res> {
  __$CartCopyWithImpl(_Cart _value, $Res Function(_Cart) _then)
      : super(_value, (v) => _then(v as _Cart));

  @override
  _Cart get _value => super._value as _Cart;

  @override
  $Res call({
    Object? vendor = freezed,
    Object? items = freezed,
    Object? vendorLocation = freezed,
    Object? deliveryLocation = freezed,
    Object? orderID = freezed,
    Object? dateTime = freezed,
    Object? orderType = freezed,
  }) {
    return _then(_Cart(
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as Vendor,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
      vendorLocation: vendorLocation == freezed
          ? _value.vendorLocation
          : vendorLocation // ignore: cast_nullable_to_non_nullable
              as VendorLocation?,
      deliveryLocation: deliveryLocation == freezed
          ? _value.deliveryLocation
          : deliveryLocation // ignore: cast_nullable_to_non_nullable
              as VendorLocation?,
      orderID: orderID == freezed
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      orderType: orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType,
    ));
  }
}

/// @nodoc

class _$_Cart extends _Cart {
  _$_Cart(
      {required this.vendor,
      required this.items,
      this.vendorLocation,
      this.deliveryLocation,
      this.orderID,
      this.dateTime,
      this.orderType = OrderType.delivery})
      : super._();

  @override
  final Vendor vendor;
  @override
  final List<Menu> items;
  @override
  final VendorLocation? vendorLocation;
  @override
  final VendorLocation? deliveryLocation;
  @override
  final int? orderID;
  @override
  final DateTime? dateTime;
  @JsonKey(defaultValue: OrderType.delivery)
  @override
  final OrderType orderType;

  @override
  String toString() {
    return 'Cart(vendor: $vendor, items: $items, vendorLocation: $vendorLocation, deliveryLocation: $deliveryLocation, orderID: $orderID, dateTime: $dateTime, orderType: $orderType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Cart &&
            (identical(other.vendor, vendor) ||
                const DeepCollectionEquality().equals(other.vendor, vendor)) &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.vendorLocation, vendorLocation) ||
                const DeepCollectionEquality()
                    .equals(other.vendorLocation, vendorLocation)) &&
            (identical(other.deliveryLocation, deliveryLocation) ||
                const DeepCollectionEquality()
                    .equals(other.deliveryLocation, deliveryLocation)) &&
            (identical(other.orderID, orderID) ||
                const DeepCollectionEquality()
                    .equals(other.orderID, orderID)) &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)) &&
            (identical(other.orderType, orderType) ||
                const DeepCollectionEquality()
                    .equals(other.orderType, orderType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(vendor) ^
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(vendorLocation) ^
      const DeepCollectionEquality().hash(deliveryLocation) ^
      const DeepCollectionEquality().hash(orderID) ^
      const DeepCollectionEquality().hash(dateTime) ^
      const DeepCollectionEquality().hash(orderType);

  @JsonKey(ignore: true)
  @override
  _$CartCopyWith<_Cart> get copyWith =>
      __$CartCopyWithImpl<_Cart>(this, _$identity);
}

abstract class _Cart extends Cart {
  factory _Cart(
      {required Vendor vendor,
      required List<Menu> items,
      VendorLocation? vendorLocation,
      VendorLocation? deliveryLocation,
      int? orderID,
      DateTime? dateTime,
      OrderType orderType}) = _$_Cart;
  _Cart._() : super._();

  @override
  Vendor get vendor => throw _privateConstructorUsedError;
  @override
  List<Menu> get items => throw _privateConstructorUsedError;
  @override
  VendorLocation? get vendorLocation => throw _privateConstructorUsedError;
  @override
  VendorLocation? get deliveryLocation => throw _privateConstructorUsedError;
  @override
  int? get orderID => throw _privateConstructorUsedError;
  @override
  DateTime? get dateTime => throw _privateConstructorUsedError;
  @override
  OrderType get orderType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CartCopyWith<_Cart> get copyWith => throw _privateConstructorUsedError;
}
