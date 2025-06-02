class AutopartTypeInfo {
  final int id;
  final String name;
  final String description;
  final AutopartTypeInfoEnum typeValue;
  AutopartTypeInfo({
    required this.id,
    required this.name,
    required this.description,
    required this.typeValue,
  });

  factory AutopartTypeInfo.fromMap(Map<String, dynamic> map) {
    return AutopartTypeInfo(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      typeValue: map['typeValue'],
    );
  }
}

enum AutopartTypeInfoEnum
{
  code, measures, contains 
}