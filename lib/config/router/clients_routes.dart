

import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/pages/clients/add_client_page.dart';
import 'package:san_andres_mobile/presentation/pages/clients/edit_client_page.dart';

const String pathBase = "/clients";

final clientsRoutes = [
  GoRoute(
    path: '$pathBase/add',
    name: AddClientPage.name,
    builder: (context, state) => const AddClientPage(),
  ),
  GoRoute(
    path: '$pathBase/edit',
    name: EditClientPage.name,
    builder: (context, state) => const EditClientPage(),
  ),
];

