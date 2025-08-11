import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:san_andres_mobile/domain/entities/auth/auth.dart';
import 'package:san_andres_mobile/domain/entities/auth/user.dart';
import 'package:san_andres_mobile/domain/repositories/auth_repository.dart';
import 'package:san_andres_mobile/presentation/services/api_client.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  AuthProvider(this.authRepository);

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
  bool _isAuthenticated = false;
  Future<void> initialize() async {
    _isAuthenticated = await authRepository.verifyUser();
    if (_isAuthenticated) {
      await _loadUserData();
    }
    notifyListeners();
  }

  Future<void> _loadUserData() async {
    try {
      // Obtener el último usuario autenticado
      final user = await authRepository.getUserAuth();
      if (user != null && user.token != null) {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(user.token!);

        _userId = int.parse(decodedToken['id']);
        _name = decodedToken['name'];
        _seller = decodedToken['seller'] == "True";
        _customer = decodedToken['customer'] == "True";

        _isAuthenticated = true;
      }
    } catch (e) {
      _isAuthenticated = false;
      _clearUserData();
    }
  }

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
    context.push('/home/loading');
  }

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
    required String momFirstName,
    required String dadFirstName,
    required String momLastName,
    required String dadLastName,
    required DateTime birthDate,
    required String address,
    required String ci,
    required BuildContext context,
  }) async {
    try {
      final response = await api.post(
        'auth/register-user',
        data: {
          "name": name,
          "email": email,
          "password": password,
          "momFirstName": momFirstName,
          "dadFirstName": dadFirstName,
          "momLastName": momLastName,
          "dadLastName": dadLastName,
          "birthDate": birthDate.toUtc().toIso8601String(),
          "adress": address,
          "ci": ci,
          "cityId": 7,
          "sellerOrCustomer": false,
        },
      );

      // Procesar la respuesta
      _current = AuthResponse(
        user: UserResponse(
          id: response.data['user']['id'],
          name: response.data['user']['name'],
          email: response.data['user']['email'],
        ),
        currentToken: response.data['currentToken'],
        refreshToken: response.data['refreshToken'],
      );

      // Decodificar el token para obtener información adicional
      Map<String, dynamic> decodedToken =
          JwtDecoder.decode(_current!.currentToken);

      _userId = int.parse(decodedToken['id']);
      _name = decodedToken['name'];
      _seller = decodedToken['seller'] == "True";
      _customer = decodedToken['customer'] == "True";
      _user = _current!.user;

      notifyListeners();
    } catch (e) {
      // Manejar errores
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error en el registro: ${e.toString()}')),
        );
      }
      rethrow;
    }
  }

  void _clearUserData() {
    _current = null;
    _user = null;
    _userId = null;
    _name = null;
    _seller = null;
    _customer = null;
    _isAuthenticated = false;
  }

  Future<void> checkAuthentication() async {
    _isAuthenticated = await authRepository.verifyUser();
    notifyListeners();
  }

  void logout() {
    _current = null;
    notifyListeners();
  }
}
