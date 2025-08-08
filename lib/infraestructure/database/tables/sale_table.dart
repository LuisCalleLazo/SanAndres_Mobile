import 'package:drift/drift.dart';

class SaleTable extends Table
{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get refId => integer()();
  IntColumn get autopartId => integer()();
  IntColumn get saleDetailId => integer()();
  IntColumn get amount => integer()();
  RealColumn get price => real()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}