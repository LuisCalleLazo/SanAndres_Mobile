import 'package:dio/dio.dart';

abstract class AuthDatasource {
  Future<Response> login(String nameOrGamil, String password);
}
