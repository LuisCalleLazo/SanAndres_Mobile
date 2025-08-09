import 'package:drift/drift.dart';

class CountryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get refId => integer()();
  TextColumn get name => text()();
  TextColumn get photo => text().nullable()();
  TextColumn get codePhone => text()();
}
