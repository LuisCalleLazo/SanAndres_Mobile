// injection_container.dart
import 'package:get_it/get_it.dart';
import 'package:san_andres_mobile/domain/datasources/autopart_datasource.dart';
import 'package:san_andres_mobile/infraestructure/database/database.dart';
import 'package:san_andres_mobile/domain/datasources/auth_datasource.dart';
import 'package:san_andres_mobile/domain/datasources/user_datasource.dart';
import 'package:san_andres_mobile/infraestructure/datasources/auth_datasource_impl.dart';
import 'package:san_andres_mobile/infraestructure/datasources/autopart_datasource_impl.dart';
import 'package:san_andres_mobile/infraestructure/datasources/user_datasource_impl.dart';
import 'package:san_andres_mobile/domain/repositories/auth_repository.dart';
import 'package:san_andres_mobile/infraestructure/repositories/auth_repository_impl.dart';
import 'package:san_andres_mobile/infraestructure/repositories/autopart_repository_impl.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Database
  getIt.registerSingleton<AppDatabase>(AppDatabase());

  // Datasources
  getIt.registerSingleton<AuthDatasource>(
    AuthDatasourceImpl(getIt<AppDatabase>()),
  );
  getIt.registerSingleton<UserDatasource>(
    UserDatasourceImpl(getIt<AppDatabase>()),
  );
  getIt.registerSingleton<AutopartDatasource>(
    AutopartDatasourceImpl(getIt<AppDatabase>()),
  );

  // Repositories
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      authDatasource: getIt<AuthDatasource>(),
      userDatasource: getIt<UserDatasource>(),
    ),
  );
  getIt.registerSingleton<AutopartRepositoryImpl>(
    AutopartRepositoryImpl(
      dataSource: getIt<AutopartDatasource>(),
    ),
  );
}
