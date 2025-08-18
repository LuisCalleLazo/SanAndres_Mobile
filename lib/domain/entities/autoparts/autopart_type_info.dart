import 'package:san_andres_mobile/domain/entities/autoparts/syncable_item.dart';

class AutopartTypeInfo implements SyncableItem {
  @override
  final int id;
  final String name;
  final String description;
  final AutopartTypeInfoEnum type;
  AutopartTypeInfo({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
  });
  @override
  bool hasChanges(SyncableItem other) {
    if (other is! AutopartTypeInfo) return true;
    return name != other.name || description != other.description;
  }
}

enum AutopartTypeInfoEnum
{
  code, measures, contains 
}