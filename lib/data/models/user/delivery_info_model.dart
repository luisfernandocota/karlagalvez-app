import 'dart:convert';

import '../../../domain/entities/user/delivery_info.dart';

DeliveryInfoModel deliveryInfoModelFromRemoteJson(String str) =>
    DeliveryInfoModel.fromJson(json.decode(str)['data']);

DeliveryInfoModel deliveryInfoModelFromLocalJson(String str) =>
    DeliveryInfoModel.fromJson(json.decode(str));

List<DeliveryInfoModel> deliveryInfoModelListFromRemoteJson(String str) =>
    List<DeliveryInfoModel>.from(
        json.decode(str)['data'].map((x) => DeliveryInfoModel.fromJson(x)));

List<DeliveryInfoModel> deliveryInfoModelListFromLocalJson(String str) =>
    List<DeliveryInfoModel>.from(
        json.decode(str).map((x) => DeliveryInfoModel.fromJson(x)));

String deliveryInfoModelToJson(DeliveryInfoModel data) =>
    json.encode(data.toJson());

String deliveryInfoModelListToJson(List<DeliveryInfoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeliveryInfoModel extends DeliveryInfo {
  const DeliveryInfoModel({
    required String id,
    required String address,
    required String numExt,
    required String city,
    required String state,
    required String suburb,
    required String zipCode,
  }) : super(
          id: id,
          address: address,
          city: city,
          zipCode: zipCode,
          state: state,
          numExt: numExt,
          suburb: suburb,
        );

  factory DeliveryInfoModel.fromJson(Map<String, dynamic> json) =>
      DeliveryInfoModel(
        id: json["id"].toString(),
        address: json["address"],
        city: json["city"],
        zipCode: json["zip_code"],
        state: json["state"],
        numExt: json["num_ext"],
        suburb: json["suburb"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "address": address,
        "city": city,
        "zip_code": zipCode,
        "state": state,
        "num_ext": numExt,
        "suburb": suburb,
      };

  factory DeliveryInfoModel.fromEntity(DeliveryInfo entity) =>
      DeliveryInfoModel(
        id: entity.id,
        address: entity.address,
        city: entity.city,
        zipCode: entity.zipCode,
        state: entity.state,
        numExt: entity.numExt,
        suburb: entity.suburb,
      );
}
