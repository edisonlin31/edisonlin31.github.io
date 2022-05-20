// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VendorLocation _$$_VendorLocationFromJson(Map<String, dynamic> json) =>
    _$_VendorLocation(
      id: json['id'] as int,
      name: json['name'] as String,
      isDefault: json['default'] as bool,
      phone: json['phone'] as String?,
      zip: json['zip'] as String?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
    );

Map<String, dynamic> _$$_VendorLocationToJson(_$_VendorLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'default': instance.isDefault,
      'phone': instance.phone,
      'zip': instance.zip,
      'address1': instance.address1,
      'address2': instance.address2,
    };
