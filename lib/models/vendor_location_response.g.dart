// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VendorLocationResponse _$$_VendorLocationResponseFromJson(
        Map<String, dynamic> json) =>
    _$_VendorLocationResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => VendorLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextCursor: json['next_cursor'] as String?,
    );

Map<String, dynamic> _$$_VendorLocationResponseToJson(
        _$_VendorLocationResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'next_cursor': instance.nextCursor,
    };
