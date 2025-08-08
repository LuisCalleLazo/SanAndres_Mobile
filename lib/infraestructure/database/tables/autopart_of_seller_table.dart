import 'package:drift/drift.dart';

class AutopartOfSellerTable extends Table
{

  IntColumn get id => integer().autoIncrement()();
  IntColumn get refId => integer().nullable()();
  IntColumn get amountUnit => integer()();
  IntColumn get amountUnitPublic => integer()();
  RealColumn get unitPrice => real()();
  RealColumn get unitPricePublic => real()();
  RealColumn get wholessalePrice => real()();
  RealColumn get wholessalePricePublic => real()();
  IntColumn get autopartId => integer()();

  @override
  Set<Column> get primaryKey => {id};
}