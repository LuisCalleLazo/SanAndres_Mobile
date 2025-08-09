import 'package:drift/drift.dart';

class CustomerTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get refId => integer()();
  TextColumn get name => text()();
  TextColumn get phone => text()();
  TextColumn get email => text()();
}
