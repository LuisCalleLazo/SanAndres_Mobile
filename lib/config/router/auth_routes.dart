
import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/pages/auth/login_page.dart';
import 'package:san_andres_mobile/presentation/pages/auth/register_page.dart';

const String pathBase = "/auth";

final List<GoRoute> authRoutes = [
  GoRoute(
    path: '$pathBase/login',
    name: LoginPage.name,
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '$pathBase/register',
    name: RegisterPage.name,
    builder: (context, state) => const RegisterPage(),
  ),
];
