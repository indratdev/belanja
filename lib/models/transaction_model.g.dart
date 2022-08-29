// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      idSupermarket: json['idSupermarket'] as int,
      transactionDate: json['transactionDate'] as String,
      itemName: json['itemName'] as String,
      description: json['description'] as String,
      amount: (json['amount'] as num).toDouble(),
    )..id = json['id'] as int?;

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idSupermarket': instance.idSupermarket,
      'transactionDate': instance.transactionDate,
      'itemName': instance.itemName,
      'description': instance.description,
      'amount': instance.amount,
    };
