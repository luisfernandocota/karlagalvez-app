import 'package:karlagalvezapp/domain/entities/product/price_tag.dart';

class SizesModel extends Size {
  SizesModel({
    required String id,
    required String name,
    required num charge,
  }) : super(
          id: id,
          name: name,
          charge: charge,
        );

  factory SizesModel.fromJson(Map<String, dynamic> json) => SizesModel(
        id: json["id"].toString(),
        name: json["name"],
        charge: double.parse(json["charge"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "charge": charge,
      };

  factory SizesModel.fromEntity(Size entity) => SizesModel(
        id: entity.id,
        name: entity.name,
        charge: entity.charge,
      );
}
