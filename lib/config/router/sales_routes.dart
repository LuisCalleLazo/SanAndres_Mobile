import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/domain/entities/sales/sale_customer.dart';
import 'package:san_andres_mobile/presentation/pages/sales/add_sale_page.dart';
import 'package:san_andres_mobile/presentation/pages/sales/edit_sale_page.dart';
import 'package:san_andres_mobile/presentation/pages/sales/receipt_sale_page.dart';
import 'package:san_andres_mobile/presentation/pages/sales/sale_items_page.dart';

const String pathBase = "/sales";

final salesRoutes = [
  GoRoute(
    path: '$pathBase/add',
    name: AddSalePage.name,
    builder: (context, state) => const AddSalePage(),
  ),
  GoRoute(
    path: '$pathBase/edit',
    name: EditSalePage.name,
    builder: (context, state) => const EditSalePage(),
  ),
  GoRoute(
    path: '$pathBase/receipt',
    name: ReceiptSalePage.name,
    builder: (context, state) => const ReceiptSalePage()
  ),
  GoRoute(
    path: '$pathBase/items',
    name: SaleItemsPage.name,
    builder: (context, state) {
      final sale = state.extra as SaleCustomer;
      return SaleItemsPage(sale: sale);
    },
  ),
];
