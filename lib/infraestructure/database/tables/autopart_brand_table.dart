import 'package:drift/drift.dart';

class AutopartBrandTable extends Table
{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get refId => integer().nullable()();
  TextColumn get logo => text().nullable()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}
