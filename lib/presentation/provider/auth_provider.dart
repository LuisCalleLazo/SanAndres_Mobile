import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:san_andres_mobile/domain/entities/auth/auth.dart';
import 'package:san_andres_mobile/domain/entities/auth/user.dart';
import 'package:san_andres_mobile/domain/repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  AuthProvider(this.authRepository);

  AuthResponse? _currentAuth;
  UserResponse? get user => _currentAuth?.user;
  int? get userId => _userId;
  String? get name => _name;
  bool get isSeller => _seller;
  bool get isCustomer => _customer;
  bool get isAuthenticated => _isAuthenticated;

  int? _userId;
  String? _name;
  bool _seller = false;
  bool _customer = false;
  bool _isAuthenticated = false;

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  Future<void> initialize() async {
    _isAuthenticated = await authRepository.verifyUser();
    if (_isAuthenticated) {
      await _loadUserData();
    }
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> _loadUserData() async {
    try {
      final auth = await authRepository.getUserAuth();
      if (auth != null) {
        _setAuthData(auth);
      } else {
        _clearAuthData();
      }
    } catch (e) {
      _clearAuthData();
    }
  }

  Future<bool> login(
      String nameOrEmail, String password, BuildContext context) async {
    try {
      final auth = await authRepository.login(nameOrEmail, password, context);
      _setAuthData(auth);
      return true;
    } catch (e) {
      _clearAuthData();
      rethrow;
    }
  }

  Future<bool> registerUser(
      {required String name,
      required String email,
      required String password,
      required String momFirstName,
      required String dadFirstName,
      required String momLastName,
      required String dadLastName,
      required DateTime birthDate,
      required String address,
      required String ci,
      required BuildContext context}) async {
    try {
      // final auth = await authRepository.registerUser(
      //   name: name,
      //   email: email,
      //   password: password,
      //   momFirstName: momFirstName,
      //   dadFirstName: dadFirstName,
      //   momLastName: momLastName,
      //   dadLastName: dadLastName,
      //   birthDate: birthDate,
      //   address: address,
      //   ci: ci,
      // );
      // _setAuthData(auth);
      return true;
    } catch (e) {
      _clearAuthData();
      rethrow;
    }
  }

  void _setAuthData(AuthResponse auth) {
    _currentAuth = auth;
    final decodedToken = JwtDecoder.decode(auth.currentToken);
    _userId = int.parse(decodedToken['id']);
    _name = decodedToken['name'];
    _seller = decodedToken['seller'] == "True";
    _customer = decodedToken['customer'] == "True";
    _isAuthenticated = true;
    notifyListeners();
  }

  void _clearAuthData() {
    _currentAuth = null;
    _userId = null;
    _name = null;
    _seller = false;
    _customer = false;
    _isAuthenticated = false;
    notifyListeners();
  }

  Future<void> checkAuthentication() async {
    _isAuthenticated = await authRepository.verifyUser();
    notifyListeners();
  }

  void logout() {
    _clearAuthData();
    authRepository.logout();
  }
}
