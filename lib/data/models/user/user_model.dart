import 'dart:convert';

import '../../../domain/entities/user/user.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends User {
  const UserModel({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
          email: email,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"].toString(),
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fist_name": firstName,
        "last_name": lastName,
        "email": email,
      };
}
