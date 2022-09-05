// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supermarket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupermarketModel _$SupermarketModelFromJson(Map<String, dynamic> json) =>
    SupermarketModel(
      name: json['name'] as String,
    )..id = json['id'] as int?;

Map<String, dynamic> _$SupermarketModelToJson(SupermarketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
