class AutopartList {
  final int id;
  final String code;
  final double price;
  final String? asset;
  AutopartList({
    required this.id,
    required this.code,
    required this.price,
    this.asset = "https://picsum.photos/id/1/600/250"
  });
}
