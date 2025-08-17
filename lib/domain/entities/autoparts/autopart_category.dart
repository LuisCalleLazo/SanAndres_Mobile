import 'package:san_andres_mobile/domain/entities/autoparts/syncable_item.dart';

class AutopartCategory implements SyncableItem {
  @override
  final int id;
  final String name;
  final String? description;

  AutopartCategory({
    required this.id,
    required this.name,
    this.description,
  });

  @override
  bool hasChanges(SyncableItem other) {
    if (other is! AutopartCategory) return true;
    return name != other.name || description != other.description;
  }
}
