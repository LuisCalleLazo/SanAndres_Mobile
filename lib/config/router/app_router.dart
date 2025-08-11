import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/config/router/auth_routes.dart';
import 'package:san_andres_mobile/config/router/autoparts_router.dart';
import 'package:san_andres_mobile/config/router/clients_routes.dart';
import 'package:san_andres_mobile/config/router/home_routes.dart';
import 'package:san_andres_mobile/config/router/reports_routes.dart';
import 'package:san_andres_mobile/config/router/sales_routes.dart';

final appRouter = GoRouter(
  initialLocation: '/auth',
  routes: [
    ...authRoutes,
    ...homeRoutes,
    ...autopartsRoutes,
    ...salesRoutes,
    ...clientsRoutes,
    ...reportsRoutes,
  ],
);
