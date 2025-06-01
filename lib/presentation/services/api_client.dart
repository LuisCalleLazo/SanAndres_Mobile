import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['API_USER_URL']!,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      
    ),
  );

  Dio get client => _dio;
}

final api = Api().client;
