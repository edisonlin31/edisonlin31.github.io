// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Menu _$$_MenuFromJson(Map<String, dynamic> json) => _$_Menu(
      id: json['id'] as int,
      title: json['title'] as String,
      shortTitle: json['short_title'] as String,
      priceString: json['price'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => MenuImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      cartQty: json['cartQty'] as int? ?? 0,
    );

Map<String, dynamic> _$$_MenuToJson(_$_Menu instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'short_title': instance.shortTitle,
      'price': instance.priceString,
      'images': instance.images,
      'cartQty': instance.cartQty,
    };

_$_MenuImage _$$_MenuImageFromJson(Map<String, dynamic> json) => _$_MenuImage(
      position: json['position'] as int,
      src: json['src'] as String,
    );

Map<String, dynamic> _$$_MenuImageToJson(_$_MenuImage instance) =>
    <String, dynamic>{
      'position': instance.position,
      'src': instance.src,
    };
