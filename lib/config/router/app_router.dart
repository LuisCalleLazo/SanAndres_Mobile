import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:san_andres_mobile/config/router/auth_routes.dart';
import 'package:san_andres_mobile/config/router/autoparts_router.dart';
import 'package:san_andres_mobile/config/router/clients_routes.dart';
import 'package:san_andres_mobile/config/router/home_routes.dart';
import 'package:san_andres_mobile/config/router/reports_routes.dart';
import 'package:san_andres_mobile/config/router/sales_routes.dart';
import 'package:san_andres_mobile/presentation/provider/auth_provider.dart';

final appRouter = GoRouter(
  initialLocation: '/auth',
  redirect: (BuildContext context, GoRouterState state) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    
    final isGoingToAuth = state.fullPath?.startsWith('/auth');
    
    // Si no está autenticado y no va a auth, redirige a auth
    if (!authProvider.isAuthenticated && !isGoingToAuth!) {
      return '/auth';
    }
    
    // No redirigir en otros casos
    return null;
  },
  routes: [
    ...authRoutes,
    ...homeRoutes,
    ...autopartsRoutes,
    ...salesRoutes,
    ...clientsRoutes,
    ...reportsRoutes,
  ],
);
