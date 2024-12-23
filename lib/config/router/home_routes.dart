

import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/pages/app/home_page.dart';

const String pathBase = "/home";

final homeRoutes = [
  GoRoute(
    path: pathBase,
    name: HomePage.name,
    builder: (context, state) => const HomePage(),
  ),
  // GoRoute(
  //   path: '$pathBase/perfil',
  //   name: PerfilPage.name,
  //   builder: (context, state) => const PerfilPage(),
  // ),
];
