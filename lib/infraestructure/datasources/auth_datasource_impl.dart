import 'package:dio/dio.dart';
import 'package:san_andres_mobile/domain/datasources/auth_datasource.dart';
import '../../presentation/services/api_client.dart';

class AuthDatasourceImpl extends AuthDatasource {
  final Dio _client = api;
  AuthDatasourceImpl();

  @override
  Future<Response> login(String nameOrGamil, String password) async {
    final response = await _client.post('auth/login', data: {
      'nameOrGmail': nameOrGamil,
      'password': password,
    });
    
    return response;
  }
}
