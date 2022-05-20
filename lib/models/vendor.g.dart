// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Vendor _$$_VendorFromJson(Map<String, dynamic> json) => _$_Vendor(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String?,
      category: json['category'] as String? ?? '',
      image: json['image'] as String? ??
          'https://cdn.shopify.com/s/files/1/0520/4502/1376/t/24/assets/umamibannermobile7-1646288494220.jpg?v=1646288496',
      foodList: (json['foodList'] as List<dynamic>?)
              ?.map((e) => Menu.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_VendorToJson(_$_Vendor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'category': instance.category,
      'image': instance.image,
      'foodList': instance.foodList,
    };
