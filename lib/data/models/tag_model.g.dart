// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TagModel _$TagModelFromJson(Map<String, dynamic> json) => _TagModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      quoteCount: (json['quoteCount'] as num).toInt(),
    );

Map<String, dynamic> _$TagModelToJson(_TagModel instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'quoteCount': instance.quoteCount,
    };
