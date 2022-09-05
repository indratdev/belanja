import 'package:json_annotation/json_annotation.dart';

part 'supermarketlocation_model.g.dart';

@JsonSerializable()
class SupermarketLocationModel {
  int id;
  int idSupermarket;
  String locationName;

  SupermarketLocationModel({
    required this.id,
    required this.idSupermarket,
    required this.locationName,
  });

  factory SupermarketLocationModel.fromJson(Map<String, dynamic> json) =>
      _$SupermarketLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$SupermarketLocationModelToJson(this);
}
