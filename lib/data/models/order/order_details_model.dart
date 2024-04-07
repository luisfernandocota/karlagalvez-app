import 'dart:convert';

import '../../../domain/entities/order/order_details.dart';
import '../user/delivery_info_model.dart';
import 'order_item_model.dart';

List<OrderDetailsModel> orderDetailsModelListFromJson(String str) =>
    List<OrderDetailsModel>.from(
        json.decode(str)['data'].map((x) => OrderDetailsModel.fromJson(x)));

List<OrderDetailsModel> orderDetailsModelListFromLocalJson(String str) =>
    List<OrderDetailsModel>.from(
        json.decode(str).map((x) => OrderDetailsModel.fromJson(x)));

OrderDetailsModel orderDetailsModelFromJson(String str) =>
    OrderDetailsModel.fromJson(json.decode(str)['data']);

String orderModelListToJsonBody(List<OrderDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonBody())));

String orderModelListToJson(List<OrderDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

String orderDetailsModelToJson(OrderDetailsModel data) =>
    json.encode(data.toJsonBody());

class OrderDetailsModel extends OrderDetails {
  const OrderDetailsModel({
    required String id,
    required String folio,
    required String customerName,
    required String customerEmail,
    required List<OrderItemModel> orderItems,
    required DeliveryInfoModel deliveryInfo,
  }) : super(
          id: id,
          folio: folio,
          customerEmail: customerEmail,
          customerName: customerName,
          orderItems: orderItems,
          deliveryInfo: deliveryInfo,
        );

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        id: json["id"].toString(),
        orderItems: List<OrderItemModel>.from(
            json["order_items"].map((x) => OrderItemModel.fromJson(x))),
        deliveryInfo: DeliveryInfoModel.fromJson(json["delivery_info"]),
        folio: json['folio'],
        customerEmail: json['email'],
        customerName: json['name'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_items": List<dynamic>.from(
            (orderItems as List<OrderItemModel>).map((x) => x.toJson())),
        "delivery_info": (deliveryInfo as DeliveryInfoModel).toJson()
      };

  Map<String, dynamic> toJsonBody() => {
        "id": id,
        "order_items": List<dynamic>.from(
            (orderItems as List<OrderItemModel>).map((x) => x.toJsonBody())),
        "delivery_info": deliveryInfo.id,
      };

  factory OrderDetailsModel.fromEntity(OrderDetails entity) =>
      OrderDetailsModel(
          id: entity.id,
          folio: entity.folio,
          customerEmail: entity.customerEmail,
          customerName: entity.customerName,
          orderItems: entity.orderItems
              .map((orderItem) => OrderItemModel.fromEntity(orderItem))
              .toList(),
          deliveryInfo: DeliveryInfoModel.fromEntity(entity.deliveryInfo));
}
