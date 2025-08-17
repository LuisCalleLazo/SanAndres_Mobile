import 'package:san_andres_mobile/domain/entities/autoparts/syncable_item.dart';

class AutopartBrand implements SyncableItem {
  @override
  final int id;
  final String name;
  final String? logo;
  

  AutopartBrand({
    required this.id,
    required this.name,
    required this.logo,
  });

  @override
  bool hasChanges(SyncableItem other) {
    if (other is! AutopartBrand) return true;
    return name != other.name || logo != other.logo;
  }
}
