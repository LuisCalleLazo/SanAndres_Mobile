import 'package:drift/drift.dart';

class AutopartAssetTable extends Table
{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get refId => integer().nullable()();
  TextColumn get asset => text()();
  TextColumn get description => text().nullable()();
  IntColumn get autopartId => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
