import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:san_andres_mobile/shared/constants/storage_value.dart';
import 'package:san_andres_mobile/shared/utils/types.dart';

class ApiSecure {
  final ServicesASA service;

  late final Dio _dio;

  ApiSecure({required this.service}) {
    // Obtiene la URL base según el servicio seleccionado
    String baseUrl = _getBaseUrl(service);
    
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        const storage = FlutterSecureStorage();
        final currentToken =
            await storage.read(key: StorageKey.getCurrentToken());
        if (currentToken != null) {
          options.headers['Authorization'] = 'Bearer $currentToken';
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        if (e.response?.statusCode == 401) {
          const FlutterSecureStorage()
              .delete(key: StorageKey.getCurrentToken());
          const FlutterSecureStorage()
              .delete(key: StorageKey.getRefreshToken());
          const FlutterSecureStorage().delete(key: StorageKey.getUser());
        }
        return handler.next(e);
      },
    ));
  }
  Dio get client => _dio;
  
  String _getBaseUrl(ServicesASA service) {
    switch (service) {
      case ServicesASA.autoService:
        return dotenv.env['API_USER_URL']!;
      case ServicesASA.chatService:
        return dotenv.env['API_WORK_URL']!;
      default:
        return dotenv.env['API_USER_URL']!;
    }
  }
}

final apiAuto = ApiSecure(service: ServicesASA.autoService).client;
final apiChat = ApiSecure(service: ServicesASA.chatService).client;
