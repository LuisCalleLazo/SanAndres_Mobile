

import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/pages/app/edit_info_people_page.dart';
import 'package:san_andres_mobile/presentation/pages/app/edit_photo_perfil_page.dart';
import 'package:san_andres_mobile/presentation/pages/app/help_page.dart';
import 'package:san_andres_mobile/presentation/pages/app/home_page.dart';

const String pathBase = "/home";

final homeRoutes = [
  GoRoute(
    path: pathBase,
    name: HomePage.name,
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '$pathBase/perfil',
    name: EditInfoPeoplePage.name,
    builder: (context, state) => const EditInfoPeoplePage(),
  ),
  GoRoute(
    path: '$pathBase/perfil/photo',
    name: EditPhotoPerfilPage.name,
    builder: (context, state) => const EditPhotoPerfilPage(),
  ),
  GoRoute(
    path: '$pathBase/help',
    name: HelpPage.name,
    builder: (context, state) => const HelpPage(),
  ),
];

