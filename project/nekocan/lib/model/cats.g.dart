// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cats _$$_CatsFromJson(Map<String, dynamic> json) => _$_Cats(
      id: json['id'] as int,
      name: json['name'] as String,
      gender: json['gender'] as String,
      birthday: json['birthday'] as String,
      memo: json['memo'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_CatsToJson(_$_Cats instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'memo': instance.memo,
      'createdAt': instance.createdAt.toIso8601String(),
    };
