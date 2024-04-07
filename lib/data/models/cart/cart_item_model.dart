import 'dart:convert';

import '../../../domain/entities/cart/cart_item.dart';
import '../product/price_tag_model.dart';
import '../product/product_model.dart';

List<CartItemModel> cartItemModelListFromLocalJson(String str) =>
    List<CartItemModel>.from(
        json.decode(str).map((x) => CartItemModel.fromJson(x)));

List<CartItemModel> cartItemModelListFromRemoteJson(String str) =>
    List<CartItemModel>.from(
        json.decode(str)["data"].map((x) => CartItemModel.fromJson(x)));

List<CartItemModel> cartItemModelFromJson(String str) =>
    List<CartItemModel>.from(
        json.decode(str).map((x) => CartItemModel.fromJson(x)));

String cartItemModelToJson(List<CartItemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartItemModel extends CartItem {
  const CartItemModel({
    String? id,
    required ProductModel product,
    required SizesModel size,
  }) : super(id: id, product: product, size: size);

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json["id"],
      product: ProductModel.fromJson(json["product"]),
      size: SizesModel.fromJson(json["sizes"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": (product as ProductModel).toJson(),
        "sizes": (size as SizesModel).toJson(),
      };

  Map<String, dynamic> toBodyJson() => {
        "id": id,
        "product": product.id,
        "sizes": size.id,
      };

  factory CartItemModel.fromParent(CartItem cartItem) {
    return CartItemModel(
      id: cartItem.id,
      product: cartItem.product as ProductModel,
      size: cartItem.size as SizesModel,
    );
  }
}
