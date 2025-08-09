import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_type_info.dart';
import 'package:san_andres_mobile/infraestructure/database/tables/autopart_asset_table.dart';
import 'package:san_andres_mobile/infraestructure/database/tables/autopart_brand_table.dart';
import 'package:san_andres_mobile/infraestructure/database/tables/autopart_info_table.dart';
import 'package:san_andres_mobile/infraestructure/database/tables/autopart_of_seller_table.dart';
import 'package:san_andres_mobile/infraestructure/database/tables/autopart_table.dart';
import 'package:san_andres_mobile/infraestructure/database/tables/autopart_type_info_table.dart';
import 'package:san_andres_mobile/infraestructure/database/tables/category_table.dart';
import 'package:san_andres_mobile/infraestructure/database/tables/city_table.dart';
import 'package:san_andres_mobile/infraestructure/database/tables/country_table.dart';
import 'package:san_andres_mobile/infraestructure/database/tables/customer_table.dart';
import 'package:san_andres_mobile/infraestructure/database/tables/sale_detail_table.dart';
import 'package:san_andres_mobile/infraestructure/database/tables/sale_table.dart';
import 'package:san_andres_mobile/infraestructure/database/tables/user_table.dart';
import 'package:san_andres_mobile/infraestructure/model/sale_state_enum.dart';

part 'database.g.dart'; 

@DriftDatabase(
  tables: [
    AutopartTable,
    AutopartTypeInfoTable,
    AutopartOfSellerTable,
    AutopartAssetTable,
    AutopartBrandTable,
    AutopartInfoTable,
    CustomerTable,
    UserTable,
    SaleDetailTable,
    SaleTable,
    CountryTable,
    CityTable,
    CategoryTable
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'autojap_andres_db.sqlite'));
      return NativeDatabase(file);
    });
  }
}
