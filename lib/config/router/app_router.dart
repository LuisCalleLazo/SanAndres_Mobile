import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/config/router/auth_routes.dart';
import 'package:san_andres_mobile/config/router/home_routes.dart';

final appRouter = GoRouter(
  initialLocation: '/auth/login',
  routes: [
    ...authRoutes,
    ...homeRoutes,
  ],
);
