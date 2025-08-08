import 'package:drift/drift.dart';

class UserTable extends Table
{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get token => text().nullable()(); 
  TextColumn get refreshToken => text().nullable()(); 
  DateTimeColumn get dateExpired => dateTime().nullable()();

  TextColumn get latitude => text().nullable()(); 
  TextColumn get length => text().nullable()(); 

  @override
  Set<Column> get primaryKey => {id};
}