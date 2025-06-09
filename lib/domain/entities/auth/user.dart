class UserInfo {
  final String name;
  final String email;

  UserInfo({
    required this.name,
    required this.email,
  });
}

class UserResponse extends UserInfo {
  final int id;

  UserResponse({
    required this.id,
    required super.name,
    required super.email,
  });
}
