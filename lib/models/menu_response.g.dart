// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuResponse _$$_MenuResponseFromJson(Map<String, dynamic> json) =>
    _$_MenuResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Menu.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextCursor: json['next_cursor'] as String?,
    );

Map<String, dynamic> _$$_MenuResponseToJson(_$_MenuResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'next_cursor': instance.nextCursor,
    };
