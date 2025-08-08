import 'package:drift/drift.dart';
import 'package:san_andres_mobile/infraestructure/model/sale_state_enum.dart';

class SaleDetailTable extends Table
{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get refId => integer()();
  TextColumn get cutomerId => text().nullable()();
  DateTimeColumn get saleDate => dateTime()(); 
  TextColumn get customerNotSubscribed => text()(); 
  TextColumn get state => text().map(const SaleStateEnumConverter())(); 

  @override
  Set<Column> get primaryKey => {id};
}


class SaleStateEnumConverter extends TypeConverter<SaleStateEnum, String> {
  const SaleStateEnumConverter();

  @override
  SaleStateEnum fromSql(String fromDb) {
    return SaleStateEnum.values.firstWhere(
      (e) => e.name == fromDb,
      orElse: () => SaleStateEnum.nothing,
    );
  }

  @override
  String toSql(SaleStateEnum value) {
    return value.name;
  }
}