import 'package:drift/drift.dart';

class CityTable extends Table
{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get refId => integer()();
  TextColumn get name => text()();
  TextColumn get photo => text().nullable()(); 
  IntColumn get countryId => integer()(); 

  @override
  Set<Column> get primaryKey => {id};
}