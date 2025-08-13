import 'package:drift/drift.dart';
import 'package:san_andres_mobile/domain/datasources/user_datasource.dart';
import 'package:san_andres_mobile/infraestructure/database/database.dart';

class UserDatasourceImpl extends UserDatasource {
  final AppDatabase _database;

  UserDatasourceImpl(this._database);

  @override
  Future<UserTableData?> getLastUser() async {
    final query = _database.select(_database.userTable)
      ..orderBy(
          [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)])
      ..limit(1);

    return await query.getSingleOrNull();
  }

  @override
  Future<int> createUser(UserTableCompanion user) async {
    return await _database.into(_database.userTable).insert(user);
  }

  @override
  Future<void> deleteUser() async {
    await _database.delete(_database.userTable).go();
  }
}
