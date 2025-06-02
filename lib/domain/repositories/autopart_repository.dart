import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';

abstract class AutopartRepository {
  Future<List<Autopart>> getAutopartsGlobal();
}