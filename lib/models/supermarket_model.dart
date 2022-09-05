import 'package:json_annotation/json_annotation.dart';

part 'supermarket_model.g.dart';

@JsonSerializable()
class SupermarketModel {
  int? id;

  String name;

  SupermarketModel({
    required this.name,
  });

  factory SupermarketModel.fromJson(Map<String, dynamic> json) =>
      _$SupermarketModelFromJson(json);

  Map<String, dynamic> toJson() => _$SupermarketModelToJson(this);
}

// @JsonSerializable()
// class SupermarketLocationModel {
//   int? id;
//   int idSupermarket;
//   String locationName;

//   SupermarketLocationModel({
//     required this.idSupermarket,
//     required this.locationName,
//   });

//   factory SupermarketLocationModel.fromJson(Map<String, dynamic> json) =>
//       _$SupermarketLocationModelFromJson(json);

//   Map<String, dynamic> toJson() => _$SupermarketLocationModelToJson(this);
// }
