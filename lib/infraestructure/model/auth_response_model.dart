

import 'package:san_andres_mobile/domain/entities/auth/auth.dart';
import 'package:san_andres_mobile/infraestructure/model/user_response_model.dart';

class AuthResponseModel extends AuthResponse {
  AuthResponseModel({
    required super.user,
    required super.currentToken,
    required super.refreshToken,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      user: UserResponseModel.fromJson(json['user']),
      currentToken: json['currentToken'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'currentToken': currentToken,
      'refreshToken': refreshToken,
    };
  }
}
