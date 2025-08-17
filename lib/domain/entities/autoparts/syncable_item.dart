abstract class SyncableItem {
  int get id;
  bool hasChanges(covariant SyncableItem other);
}
