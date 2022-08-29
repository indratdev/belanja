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

SupermarketLocationModel _$SupermarketLocationModelFromJson(
        Map<String, dynamic> json) =>
    SupermarketLocationModel(
      idSupermarket: json['idSupermarket'] as int,
      locationName: json['locationName'] as String,
    )..id = json['id'] as int?;

Map<String, dynamic> _$SupermarketLocationModelToJson(
        SupermarketLocationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idSupermarket': instance.idSupermarket,
      'locationName': instance.locationName,
    };
