
import 'package:dio/dio.dart';
import 'package:san_andres_mobile/domain/entities/auth/auth.dart';


abstract class AuthDatasource {
  Future<Response> login(String nameOrGamil, String password);
  Future<AuthResponse> register(String nameOrGamil, String password);
}
