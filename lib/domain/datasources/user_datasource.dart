
import 'package:san_andres_mobile/infraestructure/database/database.dart';

abstract class UserDatasource {
  Future<UserTableData?> getLastUser();
  Future<int> createUser(UserTableCompanion user);
  Future<void> deleteUser();
}