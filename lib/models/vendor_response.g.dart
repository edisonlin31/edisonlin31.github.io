// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VendorResponse _$$_VendorResponseFromJson(Map<String, dynamic> json) =>
    _$_VendorResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Vendor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VendorResponseToJson(_$_VendorResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
