import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_asset.dart';

abstract class AutopartRepository {
  Future<List<AutopartList>> getAutopartsGlobal();
  Future<List<AutopartAsset>> getAutopartAssets(int autopartId);
}