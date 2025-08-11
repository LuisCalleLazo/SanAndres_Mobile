
import 'package:flutter/material.dart';
import 'package:san_andres_mobile/domain/entities/auth/auth.dart';
import 'package:san_andres_mobile/infraestructure/database/database.dart';


abstract class AuthRepository {
  Future<AuthResponse> login(String namwOrGamil, String password, BuildContext context);
  Future<bool> verifyUser();
  Future<UserTableData?> getUserAuth();
}
