import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:san_andres_mobile/domain/datasources/auth_datasource.dart';
import 'package:san_andres_mobile/domain/datasources/user_datasource.dart';
import 'package:san_andres_mobile/domain/entities/auth/auth.dart';
import 'package:san_andres_mobile/domain/entities/auth/user.dart';
import 'package:san_andres_mobile/infraestructure/model/auth_response_model.dart';
import 'package:san_andres_mobile/presentation/services/api_error_handle.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource authDatasource;
  final UserDatasource userDatasource;

  AuthRepositoryImpl({
    required this.authDatasource,
    required this.userDatasource,
  });

  @override
  Future<AuthResponse> login(
      String email, String password, BuildContext context) async {
    final errorHandler = ApiErrorHandler(context);
    try {
      final response = await authDatasource.login(email, password);
      // Verificar si la respuesta tiene los datos correctos
      errorHandler.handleResponse(
        response: response,
        showSuccessSnackbar: true,
        successMessage: "Inicio de sesión exitoso",
        isLogin: true,
      );
      final authResponse = AuthResponseModel.fromJson(response.data);
      // await _saveUserData(authResponse);

      return authResponse;
    } on DioException catch (e) {
      errorHandler.handleError(error: e);
      throw Exception(e);
    }
  }

  @override
  Future<bool> verifyUser() async {
    try {
      final user = await userDatasource.getLastUser();

      if (user == null) return false;

      if (user.token == null || user.token!.isEmpty) return false;

      if (user.dateExpired == null) return false;

      final now = DateTime.now();
      if (now.isAfter(user.dateExpired!)) return false;

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<AuthResponse?> getUserAuth() async {
    final userTableData = await userDatasource.getLastUser();

    if (userTableData == null) return null;

    return AuthResponse(
      user: UserResponse(
        id: userTableData.id,
        name: userTableData.name,
        email: '',
      ),
      currentToken: userTableData.token ?? '',
      refreshToken: userTableData.refreshToken ?? '',
    );
  }

  @override
  Future<void> logout() async {
    try {
      await userDatasource.deleteUser();

      // 2. Opcional: Hacer logout en el backend si es necesario
      // await authDatasource.logoutOnServer();
    } catch (e) {
      // Puedes registrar el error pero no lanzar excepción para no interrumpir el flujo
      debugPrint('Error during logout: $e');
    }
  }
}
