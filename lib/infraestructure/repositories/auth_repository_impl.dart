import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:san_andres_mobile/domain/entities/auth/auth.dart';
import 'package:san_andres_mobile/infraestructure/model/auth_response_model.dart';
import 'package:san_andres_mobile/presentation/services/api_error_handle.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_datasource_impl.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSourceImpl dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<AuthResponse> login(
      String email, String password, BuildContext context) async {
    final errorHandler = ApiErrorHandler(context);
    try {
      final response = await dataSource.login(email, password);
      // Verificar si la respuesta tiene los datos correctos
      errorHandler.handleResponse(
        response: response,
        showSuccessSnackbar: true,
        successMessage: "Inicio de sesión exitoso",
        isLogin: true,
      );
      return AuthResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      errorHandler.handleError(error: e);
      throw Exception(e);
    }
  }

  @override
  Future<AuthResponse> register(String email, String password) {
    return dataSource.register(email, password);
  }
}
