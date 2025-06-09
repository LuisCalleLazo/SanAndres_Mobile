

import 'package:san_andres_mobile/domain/entities/auth/user.dart';

class AuthResponse {
  final UserResponse user;
  final String currentToken;
  final String refreshToken;

  AuthResponse({
    required this.user,
    required this.currentToken,
    required this.refreshToken,
  });
}
