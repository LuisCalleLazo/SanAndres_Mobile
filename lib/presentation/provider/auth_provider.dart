import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:san_andres_mobile/domain/entities/auth/auth.dart';
import 'package:san_andres_mobile/domain/entities/auth/user.dart';
import 'package:san_andres_mobile/infraestructure/datasources/auth_datasource_impl.dart';
import 'package:san_andres_mobile/infraestructure/repositories/auth_repository_impl.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepositoryImpl authRepository =
      AuthRepositoryImpl(AuthDataSourceImpl());

  AuthResponse? _current;
  UserResponse? _user;
  int? _userId;
  String? _name;
  bool? _seller;
  bool? _customer;

  AuthResponse? get current => _current;
  UserResponse? get user => _user;
  int? get userId => _userId;
  String? get name => _name;
  bool? get seller => _seller;
  bool? get customer => _customer;

  Future<void> login(
      String nameOremail, String password, BuildContext context) async {
    _current = await authRepository.login(nameOremail, password, context);

    Map<String, dynamic> decodedToken =
        JwtDecoder.decode(_current!.currentToken);

    if (decodedToken['seller'] == "True" ||
        decodedToken['customer'] == "True") {
      _userId = int.parse(decodedToken['id']);
      _name = decodedToken['name'];
      _seller = decodedToken['seller'] == "True";
      _customer = decodedToken['customer'] == "True";
      _user = current!.user;
      notifyListeners();
    }

    // ignore: use_build_context_synchronously
    context.push('/home');
  }

  Future<void> register(String nameOremail, String password) async {
    _current = await authRepository.register(nameOremail, password);
    notifyListeners();
  }

  void logout() {
    _current = null;
    notifyListeners();
  }
}
