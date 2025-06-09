

import 'package:san_andres_mobile/domain/entities/auth/user.dart';

class UserResponseModel extends UserResponse {
  UserResponseModel({
    required super.id,
    required super.name,
    required super.email
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
