
import 'package:flutter/material.dart';
import 'package:san_andres_mobile/domain/entities/auth/auth.dart';


abstract class AuthRepository {
  Future<AuthResponse> login(String namwOrGamil, String password, BuildContext context);
  Future<AuthResponse> register(String namwOrGamil, String password);
}
