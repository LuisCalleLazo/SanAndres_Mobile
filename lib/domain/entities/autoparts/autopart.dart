import 'package:san_andres_mobile/domain/entities/autoparts/syncable_item.dart';

class Autopart implements SyncableItem {
  @override
  final int id;
  final int brandId;
  final int categoryId;
  final String? name;

  Autopart({
    required this.id,
    required this.brandId,
    required this.categoryId,
    this.name,
  });
  @override
  bool hasChanges(SyncableItem other) {
    if (other is! Autopart) return true;
    return name != other.name || brandId != other.brandId || categoryId != other.categoryId;
  }
}

class AutopartAsset implements SyncableItem {
  @override
  final int id;
  final int autopartId;
  final String asset;
  final String description;

  AutopartAsset({
    required this.id,
    required this.description,
    required this.autopartId,
    required this.asset,
  });
  @override
  bool hasChanges(SyncableItem other) {
    if (other is! AutopartAsset) return true;
    return asset != other.asset || description != other.description || autopartId != other.autopartId;
  }
}

class AutopartInfo implements SyncableItem {
  @override
  final int id;
  final int typeId;
  final int autopartId;
  final String value;

  AutopartInfo({
    required this.id,
    required this.typeId,
    required this.autopartId,
    required this.value,
  });
  @override
  bool hasChanges(SyncableItem other) {
    if (other is! AutopartInfo) return true;
    return typeId!= other.typeId || autopartId != other.autopartId || value != other.value;
  }
}
