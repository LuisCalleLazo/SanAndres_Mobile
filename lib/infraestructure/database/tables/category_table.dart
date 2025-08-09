import 'package:drift/drift.dart';

class CategoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get refId => integer()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
}
