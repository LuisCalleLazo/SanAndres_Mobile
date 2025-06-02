class AutopartAsset {
  final int id;
  final String asset;
  final String description;
  final int autopartId;

  AutopartAsset({
    required this.id,
    required this.asset,
    required this.description,
    required this.autopartId,
  });


  factory AutopartAsset.fromMap(Map<String, dynamic> map) {
    return AutopartAsset(
      id: map['id'],
      asset: map['asset'],
      description: map['description'],
      autopartId: map['autopartId'],
    );
  }
}