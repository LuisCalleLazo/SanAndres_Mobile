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
}

enum AutopartTypeInfoEnum
{
  code, measures, contains 
}