import 'package:karlagalvezapp/data/models/category/category_model.dart';

import '../../../domain/entities/order/order_item.dart';
import '../product/price_tag_model.dart';
import '../product/product_model.dart';

class OrderItemModel extends OrderItem {
  const OrderItemModel({
    required String id,
    required ProductModel product,
    required SizesModel size,
    required TypeModel type,
    required num price,
    required num quantity,
    required String namePersonalization,
  }) : super(
          id: id,
          product: product,
          size: size,
          price: price,
          quantity: quantity,
          namePersonalization: namePersonalization,
          type: type,
        );

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
        id: json["id"].toString(),
        product: ProductModel.fromJson(json["product"]),
        size: SizesModel.fromJson(json["size"][0]),
        price: double.parse(json["price"]),
        quantity: json["quantity"],
        type: TypeModel.fromJson(json['type'][0]),
        namePersonalization: json['name_personalization'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": (product as ProductModel).toJson(),
        "size": (size as SizesModel).toJson(),
        "price": price,
        "quantity": quantity,
        "type": (type as TypeModel).toJson(),
        "name_personalization": namePersonalization,
      };

  Map<String, dynamic> toJsonBody() => {
        "_id": id,
        "product": product.id,
        "size": size.id,
        "price": price,
        "quantity": quantity,
        "type": type.id,
        "name_personalization": namePersonalization,
      };

  factory OrderItemModel.fromEntity(OrderItem entity) => OrderItemModel(
        id: entity.id,
        product: ProductModel.fromEntity(entity.product),
        size: SizesModel.fromEntity(entity.size),
        price: entity.price,
        quantity: entity.quantity,
        type: TypeModel.fromEntity(entity.type),
        namePersonalization: entity.namePersonalization,
      );
}
