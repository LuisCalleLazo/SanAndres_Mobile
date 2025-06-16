

import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/pages/catalogs/catalog_page.dart';
import 'package:san_andres_mobile/presentation/pages/reports/best_seller_page.dart';
import 'package:san_andres_mobile/presentation/pages/reports/net_profits_page.dart';
import 'package:san_andres_mobile/presentation/pages/reports/quotes_page.dart';
import 'package:san_andres_mobile/presentation/pages/reports/sales_customer_page.dart';

const String pathBase = "/reports";

final reportsRoutes = [
  GoRoute(
    path: '$pathBase/best-seller',
    name: BestSellerPage.name,
    builder: (context, state) => const BestSellerPage(),
  ),
  GoRoute(
    path: '$pathBase/net-profits',
    name: NetProfitsPage.name,
    builder: (context, state) => const NetProfitsPage(),
  ),
  GoRoute(
    path: '$pathBase/quotes',
    name: QuotesPage.name,
    builder: (context, state) => const QuotesPage(),
  ),
  GoRoute(
    path: '$pathBase/sales-customer',
    name: SalesCustomerPage.name,
    builder: (context, state) => const SalesCustomerPage(),
  ),
  GoRoute(
    path: '$pathBase/catalog',
    name: CatalogPage.name,
    builder: (context, state) => const CatalogPage(),
  ),
];

