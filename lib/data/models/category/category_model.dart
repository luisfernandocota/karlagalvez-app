import 'dart:convert';

import '../../../domain/entities/category/category.dart';

List<TypeModel> typeModelListFromRemoteJson(String str) => List<TypeModel>.from(
    json.decode(str)['data'].map((x) => TypeModel.fromJson(x)));

List<TypeModel> typeModelListFromLocalJson(String str) =>
    List<TypeModel>.from(json.decode(str).map((x) => TypeModel.fromJson(x)));

String typeModelListToJson(List<TypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TypeModel extends Category {
  const TypeModel({
    required String id,
    required String name,
    required String charge,
  }) : super(
          id: id,
          name: name,
          charge: charge,
        );

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        id: json["id"].toString(),
        name: json["name"],
        charge: json["charge"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "charge": charge,
      };

  factory TypeModel.fromEntity(Category entity) => TypeModel(
        id: entity.id,
        name: entity.name,
        charge: entity.charge,
      );
}
