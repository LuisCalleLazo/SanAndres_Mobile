import 'package:drift/drift.dart';

class AutopartInfoTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get refId => integer().nullable()();
  TextColumn get value => text()();
  IntColumn get typeId => integer()();
  IntColumn get autopartId => integer()();
}
