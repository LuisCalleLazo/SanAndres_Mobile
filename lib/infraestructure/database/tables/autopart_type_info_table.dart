import 'package:drift/drift.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_type_info.dart';

class AutopartTypeInfoTable extends Table
{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get refId => integer().nullable()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get type => text().map(const AutopartTypeInfoEnumConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

class AutopartTypeInfoEnumConverter extends TypeConverter<AutopartTypeInfoEnum, String> {
  const AutopartTypeInfoEnumConverter();

  @override
  AutopartTypeInfoEnum fromSql(String fromDb) {
    return AutopartTypeInfoEnum.values.firstWhere(
      (e) => e.name == fromDb,
      orElse: () => AutopartTypeInfoEnum.code,
    );
  }

  @override
  String toSql(AutopartTypeInfoEnum value) {
    return value.name;
  }
}