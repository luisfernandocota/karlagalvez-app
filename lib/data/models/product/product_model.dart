import '../../../domain/entities/product/product.dart';
import '../category/category_model.dart';
import 'price_tag_model.dart';

class ProductModel extends Product {
  const ProductModel({
    required String id,
    required String name,
    required String description,
    required List<SizesModel> priceTags,
    required List<TypeModel> categories,
    required List<String> images,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
          id: id,
          name: name,
          description: description,
          priceTags: priceTags,
          categories: categories,
          images: images,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"].toString(),
        name: json["name"],
        description: json["description"],
        priceTags: List<SizesModel>.from(
            json["sizes"].map((x) => SizesModel.fromJson(x))),
        categories: List<TypeModel>.from(
            json["types"].map((x) => TypeModel.fromJson(x))),
        images:
            List<String>.from(json["products_gallery"].map((x) => x['image'])),
        createdAt: DateTime.parse(json["created"]),
        updatedAt: DateTime.parse(json["modified"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "priceTags": List<dynamic>.from(
            (priceTags as List<SizesModel>).map((x) => x.toJson())),
        "categories": List<dynamic>.from(
            (categories as List<TypeModel>).map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };

  factory ProductModel.fromEntity(Product entity) => ProductModel(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        priceTags: entity.priceTags
            .map((priceTag) => SizesModel.fromEntity(priceTag))
            .toList(),
        categories: entity.categories
            .map((category) => TypeModel.fromEntity(category))
            .toList(),
        images: entity.images,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );
}
