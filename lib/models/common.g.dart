// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedImpl<T> _$$PaginatedImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$PaginatedImpl<T>(
      page: (json['page'] as num).toInt(),
      pageSize: (json['page_size'] as num).toInt(),
      totalNum: (json['total_num'] as num).toInt(),
      totalPage: (json['total_page'] as num).toInt(),
      items: (json['items'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$$PaginatedImplToJson<T>(
  _$PaginatedImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'page': instance.page,
      'page_size': instance.pageSize,
      'total_num': instance.totalNum,
      'total_page': instance.totalPage,
      'items': instance.items.map(toJsonT).toList(),
    };
