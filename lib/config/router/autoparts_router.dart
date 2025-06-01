

import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/pages/autoparts/add_autoparts_page.dart';
import 'package:san_andres_mobile/presentation/pages/autoparts/edit_audtoparts_page.dart';
import 'package:san_andres_mobile/presentation/pages/autoparts/imgs_autoparts_page.dart';

const String pathBase = "/autoparts";

final autopartsRoutes = [
  GoRoute(
    path: '$pathBase/add',
    name: AddAutopartsPage.name,
    builder: (context, state) => const AddAutopartsPage(),
  ),
  GoRoute(
    path: '$pathBase/edit',
    name: EditAudtopartsPage.name,
    builder: (context, state) => const EditAudtopartsPage(),
  ),
  GoRoute(
    path: '$pathBase/imgs',
    name: ImgsAutopartsPage.name,
    builder: (context, state) => const ImgsAutopartsPage(),
  ),
];

