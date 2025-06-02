class AutopartInfo {

  final int id;
  final String value;
  final int typeId;
  final int autopartId;

  AutopartInfo({
    required this.id,
    required this.value,
    required this.typeId,
    required this.autopartId,
  });

  factory AutopartInfo.fromMap(Map<String, dynamic> map) {
    return AutopartInfo(
      id: map['id'],
      value: map['value'],
      typeId: map['typeId'],
      autopartId: map['autopartId'],
    );
  }
}

class AutopartInfoList {
  final String type;
  final String value;

  AutopartInfoList({
    required this.type,
    required this.value,
  });

  factory AutopartInfoList.fromMap(Map<String, dynamic> map) {
    return AutopartInfoList(
      type: map['type'] as String,
      value: map['value'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'value': value,
    };
  }
}