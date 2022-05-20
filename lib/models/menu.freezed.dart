// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return _Menu.fromJson(json);
}

/// @nodoc
class _$MenuTearOff {
  const _$MenuTearOff();

  _Menu call(
      {required int id,
      required String title,
      @JsonKey(name: "short_title") required String shortTitle,
      @JsonKey(name: "price") required String priceString,
      required List<MenuImage> images,
      int cartQty = 0}) {
    return _Menu(
      id: id,
      title: title,
      shortTitle: shortTitle,
      priceString: priceString,
      images: images,
      cartQty: cartQty,
    );
  }

  Menu fromJson(Map<String, Object> json) {
    return Menu.fromJson(json);
  }
}

/// @nodoc
const $Menu = _$MenuTearOff();

/// @nodoc
mixin _$Menu {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "short_title")
  String get shortTitle => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  String get priceString => throw _privateConstructorUsedError;
  List<MenuImage> get images => throw _privateConstructorUsedError;
  int get cartQty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuCopyWith<Menu> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCopyWith<$Res> {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) then) =
      _$MenuCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String title,
      @JsonKey(name: "short_title") String shortTitle,
      @JsonKey(name: "price") String priceString,
      List<MenuImage> images,
      int cartQty});
}

/// @nodoc
class _$MenuCopyWithImpl<$Res> implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._value, this._then);

  final Menu _value;
  // ignore: unused_field
  final $Res Function(Menu) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? shortTitle = freezed,
    Object? priceString = freezed,
    Object? images = freezed,
    Object? cartQty = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      shortTitle: shortTitle == freezed
          ? _value.shortTitle
          : shortTitle // ignore: cast_nullable_to_non_nullable
              as String,
      priceString: priceString == freezed
          ? _value.priceString
          : priceString // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<MenuImage>,
      cartQty: cartQty == freezed
          ? _value.cartQty
          : cartQty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$MenuCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$MenuCopyWith(_Menu value, $Res Function(_Menu) then) =
      __$MenuCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String title,
      @JsonKey(name: "short_title") String shortTitle,
      @JsonKey(name: "price") String priceString,
      List<MenuImage> images,
      int cartQty});
}

/// @nodoc
class __$MenuCopyWithImpl<$Res> extends _$MenuCopyWithImpl<$Res>
    implements _$MenuCopyWith<$Res> {
  __$MenuCopyWithImpl(_Menu _value, $Res Function(_Menu) _then)
      : super(_value, (v) => _then(v as _Menu));

  @override
  _Menu get _value => super._value as _Menu;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? shortTitle = freezed,
    Object? priceString = freezed,
    Object? images = freezed,
    Object? cartQty = freezed,
  }) {
    return _then(_Menu(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      shortTitle: shortTitle == freezed
          ? _value.shortTitle
          : shortTitle // ignore: cast_nullable_to_non_nullable
              as String,
      priceString: priceString == freezed
          ? _value.priceString
          : priceString // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<MenuImage>,
      cartQty: cartQty == freezed
          ? _value.cartQty
          : cartQty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Menu extends _Menu {
  _$_Menu(
      {required this.id,
      required this.title,
      @JsonKey(name: "short_title") required this.shortTitle,
      @JsonKey(name: "price") required this.priceString,
      required this.images,
      this.cartQty = 0})
      : super._();

  factory _$_Menu.fromJson(Map<String, dynamic> json) => _$$_MenuFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: "short_title")
  final String shortTitle;
  @override
  @JsonKey(name: "price")
  final String priceString;
  @override
  final List<MenuImage> images;
  @JsonKey(defaultValue: 0)
  @override
  final int cartQty;

  @override
  String toString() {
    return 'Menu(id: $id, title: $title, shortTitle: $shortTitle, priceString: $priceString, images: $images, cartQty: $cartQty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Menu &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.shortTitle, shortTitle) ||
                const DeepCollectionEquality()
                    .equals(other.shortTitle, shortTitle)) &&
            (identical(other.priceString, priceString) ||
                const DeepCollectionEquality()
                    .equals(other.priceString, priceString)) &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)) &&
            (identical(other.cartQty, cartQty) ||
                const DeepCollectionEquality().equals(other.cartQty, cartQty)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(shortTitle) ^
      const DeepCollectionEquality().hash(priceString) ^
      const DeepCollectionEquality().hash(images) ^
      const DeepCollectionEquality().hash(cartQty);

  @JsonKey(ignore: true)
  @override
  _$MenuCopyWith<_Menu> get copyWith =>
      __$MenuCopyWithImpl<_Menu>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuToJson(this);
  }
}

abstract class _Menu extends Menu {
  factory _Menu(
      {required int id,
      required String title,
      @JsonKey(name: "short_title") required String shortTitle,
      @JsonKey(name: "price") required String priceString,
      required List<MenuImage> images,
      int cartQty}) = _$_Menu;
  _Menu._() : super._();

  factory _Menu.fromJson(Map<String, dynamic> json) = _$_Menu.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "short_title")
  String get shortTitle => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "price")
  String get priceString => throw _privateConstructorUsedError;
  @override
  List<MenuImage> get images => throw _privateConstructorUsedError;
  @override
  int get cartQty => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MenuCopyWith<_Menu> get copyWith => throw _privateConstructorUsedError;
}

MenuImage _$MenuImageFromJson(Map<String, dynamic> json) {
  return _MenuImage.fromJson(json);
}

/// @nodoc
class _$MenuImageTearOff {
  const _$MenuImageTearOff();

  _MenuImage call({required int position, required String src}) {
    return _MenuImage(
      position: position,
      src: src,
    );
  }

  MenuImage fromJson(Map<String, Object> json) {
    return MenuImage.fromJson(json);
  }
}

/// @nodoc
const $MenuImage = _$MenuImageTearOff();

/// @nodoc
mixin _$MenuImage {
  int get position => throw _privateConstructorUsedError;
  String get src => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuImageCopyWith<MenuImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuImageCopyWith<$Res> {
  factory $MenuImageCopyWith(MenuImage value, $Res Function(MenuImage) then) =
      _$MenuImageCopyWithImpl<$Res>;
  $Res call({int position, String src});
}

/// @nodoc
class _$MenuImageCopyWithImpl<$Res> implements $MenuImageCopyWith<$Res> {
  _$MenuImageCopyWithImpl(this._value, this._then);

  final MenuImage _value;
  // ignore: unused_field
  final $Res Function(MenuImage) _then;

  @override
  $Res call({
    Object? position = freezed,
    Object? src = freezed,
  }) {
    return _then(_value.copyWith(
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      src: src == freezed
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MenuImageCopyWith<$Res> implements $MenuImageCopyWith<$Res> {
  factory _$MenuImageCopyWith(
          _MenuImage value, $Res Function(_MenuImage) then) =
      __$MenuImageCopyWithImpl<$Res>;
  @override
  $Res call({int position, String src});
}

/// @nodoc
class __$MenuImageCopyWithImpl<$Res> extends _$MenuImageCopyWithImpl<$Res>
    implements _$MenuImageCopyWith<$Res> {
  __$MenuImageCopyWithImpl(_MenuImage _value, $Res Function(_MenuImage) _then)
      : super(_value, (v) => _then(v as _MenuImage));

  @override
  _MenuImage get _value => super._value as _MenuImage;

  @override
  $Res call({
    Object? position = freezed,
    Object? src = freezed,
  }) {
    return _then(_MenuImage(
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      src: src == freezed
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuImage extends _MenuImage {
  _$_MenuImage({required this.position, required this.src}) : super._();

  factory _$_MenuImage.fromJson(Map<String, dynamic> json) =>
      _$$_MenuImageFromJson(json);

  @override
  final int position;
  @override
  final String src;

  @override
  String toString() {
    return 'MenuImage(position: $position, src: $src)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MenuImage &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.src, src) ||
                const DeepCollectionEquality().equals(other.src, src)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(src);

  @JsonKey(ignore: true)
  @override
  _$MenuImageCopyWith<_MenuImage> get copyWith =>
      __$MenuImageCopyWithImpl<_MenuImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuImageToJson(this);
  }
}

abstract class _MenuImage extends MenuImage {
  factory _MenuImage({required int position, required String src}) =
      _$_MenuImage;
  _MenuImage._() : super._();

  factory _MenuImage.fromJson(Map<String, dynamic> json) =
      _$_MenuImage.fromJson;

  @override
  int get position => throw _privateConstructorUsedError;
  @override
  String get src => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MenuImageCopyWith<_MenuImage> get copyWith =>
      throw _privateConstructorUsedError;
}
