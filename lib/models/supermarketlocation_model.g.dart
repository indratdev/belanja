// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supermarketlocation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupermarketLocationModel _$SupermarketLocationModelFromJson(
        Map<String, dynamic> json) =>
    SupermarketLocationModel(
      id: json['id'] as int,
      idSupermarket: json['idSupermarket'] as int,
      locationName: json['locationName'] as String,
    );

Map<String, dynamic> _$SupermarketLocationModelToJson(
        SupermarketLocationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idSupermarket': instance.idSupermarket,
      'locationName': instance.locationName,
    };
