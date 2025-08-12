import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_list.dart';
import 'package:san_andres_mobile/presentation/pages/autoparts/data_autoparts_page.dart';
import 'package:san_andres_mobile/presentation/pages/autoparts/detail_search_autopart.dart';
import 'package:san_andres_mobile/presentation/pages/autoparts/edit_audtoparts_page.dart';
import 'package:san_andres_mobile/presentation/pages/autoparts/imgs_autoparts_page.dart';
import 'package:san_andres_mobile/presentation/pages/autoparts/maps_search_autopart.dart';

const String pathBase = "/autoparts";

final autopartsRoutes = [
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
  GoRoute(
    path: '$pathBase/detail-of-search',
    name: DetailSearchAutopart.name,
    builder: (context, state) {
      final autopart = state.extra as AutopartList;
      return DetailSearchAutopart(autopart: autopart);
    },
  ),
  GoRoute(
    path: '$pathBase/search-map',
    name: MapsSearchAutopart.name,
    builder: (context, state) => const MapsSearchAutopart(),
  ),
  GoRoute(
    path: '$pathBase/manage',
    name: DataAutopartsPage.name,
    builder: (context, state) => const DataAutopartsPage(),
  ),
];
