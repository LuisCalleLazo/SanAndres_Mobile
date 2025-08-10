import 'package:drift/drift.dart';

class AutopartTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get refId => integer().nullable()();
  TextColumn get name => text().nullable()();
  IntColumn get brandId => integer()();
  IntColumn get categoryId => integer()();
}
