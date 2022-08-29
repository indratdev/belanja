import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  int? id;

  int idSupermarket;
  String transactionDate, itemName, description;
  double amount;

  TransactionModel({
    required this.idSupermarket,
    required this.transactionDate,
    required this.itemName,
    required this.description,
    required this.amount,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
