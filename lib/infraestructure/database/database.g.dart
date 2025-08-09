// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AutopartTableTable extends AutopartTable
    with TableInfo<$AutopartTableTable, AutopartTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AutopartTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<int> refId = GeneratedColumn<int>(
      'ref_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _brandIdMeta =
      const VerificationMeta('brandId');
  @override
  late final GeneratedColumn<int> brandId = GeneratedColumn<int>(
      'brand_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, refId, brandId, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'autopart_table';
  @override
  VerificationContext validateIntegrity(Insertable<AutopartTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ref_id')) {
      context.handle(
          _refIdMeta, refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta));
    }
    if (data.containsKey('brand_id')) {
      context.handle(_brandIdMeta,
          brandId.isAcceptableOrUnknown(data['brand_id']!, _brandIdMeta));
    } else if (isInserting) {
      context.missing(_brandIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AutopartTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AutopartTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      refId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ref_id']),
      brandId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}brand_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
    );
  }

  @override
  $AutopartTableTable createAlias(String alias) {
    return $AutopartTableTable(attachedDatabase, alias);
  }
}

class AutopartTableData extends DataClass
    implements Insertable<AutopartTableData> {
  final int id;
  final int? refId;
  final int brandId;
  final int categoryId;
  const AutopartTableData(
      {required this.id,
      this.refId,
      required this.brandId,
      required this.categoryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || refId != null) {
      map['ref_id'] = Variable<int>(refId);
    }
    map['brand_id'] = Variable<int>(brandId);
    map['category_id'] = Variable<int>(categoryId);
    return map;
  }

  AutopartTableCompanion toCompanion(bool nullToAbsent) {
    return AutopartTableCompanion(
      id: Value(id),
      refId:
          refId == null && nullToAbsent ? const Value.absent() : Value(refId),
      brandId: Value(brandId),
      categoryId: Value(categoryId),
    );
  }

  factory AutopartTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AutopartTableData(
      id: serializer.fromJson<int>(json['id']),
      refId: serializer.fromJson<int?>(json['refId']),
      brandId: serializer.fromJson<int>(json['brandId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'refId': serializer.toJson<int?>(refId),
      'brandId': serializer.toJson<int>(brandId),
      'categoryId': serializer.toJson<int>(categoryId),
    };
  }

  AutopartTableData copyWith(
          {int? id,
          Value<int?> refId = const Value.absent(),
          int? brandId,
          int? categoryId}) =>
      AutopartTableData(
        id: id ?? this.id,
        refId: refId.present ? refId.value : this.refId,
        brandId: brandId ?? this.brandId,
        categoryId: categoryId ?? this.categoryId,
      );
  AutopartTableData copyWithCompanion(AutopartTableCompanion data) {
    return AutopartTableData(
      id: data.id.present ? data.id.value : this.id,
      refId: data.refId.present ? data.refId.value : this.refId,
      brandId: data.brandId.present ? data.brandId.value : this.brandId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AutopartTableData(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('brandId: $brandId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, refId, brandId, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AutopartTableData &&
          other.id == this.id &&
          other.refId == this.refId &&
          other.brandId == this.brandId &&
          other.categoryId == this.categoryId);
}

class AutopartTableCompanion extends UpdateCompanion<AutopartTableData> {
  final Value<int> id;
  final Value<int?> refId;
  final Value<int> brandId;
  final Value<int> categoryId;
  const AutopartTableCompanion({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    this.brandId = const Value.absent(),
    this.categoryId = const Value.absent(),
  });
  AutopartTableCompanion.insert({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    required int brandId,
    required int categoryId,
  })  : brandId = Value(brandId),
        categoryId = Value(categoryId);
  static Insertable<AutopartTableData> custom({
    Expression<int>? id,
    Expression<int>? refId,
    Expression<int>? brandId,
    Expression<int>? categoryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (refId != null) 'ref_id': refId,
      if (brandId != null) 'brand_id': brandId,
      if (categoryId != null) 'category_id': categoryId,
    });
  }

  AutopartTableCompanion copyWith(
      {Value<int>? id,
      Value<int?>? refId,
      Value<int>? brandId,
      Value<int>? categoryId}) {
    return AutopartTableCompanion(
      id: id ?? this.id,
      refId: refId ?? this.refId,
      brandId: brandId ?? this.brandId,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<int>(refId.value);
    }
    if (brandId.present) {
      map['brand_id'] = Variable<int>(brandId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AutopartTableCompanion(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('brandId: $brandId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }
}

class $AutopartTypeInfoTableTable extends AutopartTypeInfoTable
    with TableInfo<$AutopartTypeInfoTableTable, AutopartTypeInfoTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AutopartTypeInfoTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<int> refId = GeneratedColumn<int>(
      'ref_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<AutopartTypeInfoEnum, String>
      type = GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<AutopartTypeInfoEnum>(
              $AutopartTypeInfoTableTable.$convertertype);
  @override
  List<GeneratedColumn> get $columns => [id, refId, name, description, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'autopart_type_info_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AutopartTypeInfoTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ref_id')) {
      context.handle(
          _refIdMeta, refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AutopartTypeInfoTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AutopartTypeInfoTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      refId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ref_id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      type: $AutopartTypeInfoTableTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
    );
  }

  @override
  $AutopartTypeInfoTableTable createAlias(String alias) {
    return $AutopartTypeInfoTableTable(attachedDatabase, alias);
  }

  static TypeConverter<AutopartTypeInfoEnum, String> $convertertype =
      const AutopartTypeInfoEnumConverter();
}

class AutopartTypeInfoTableData extends DataClass
    implements Insertable<AutopartTypeInfoTableData> {
  final int id;
  final int? refId;
  final String name;
  final String? description;
  final AutopartTypeInfoEnum type;
  const AutopartTypeInfoTableData(
      {required this.id,
      this.refId,
      required this.name,
      this.description,
      required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || refId != null) {
      map['ref_id'] = Variable<int>(refId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    {
      map['type'] = Variable<String>(
          $AutopartTypeInfoTableTable.$convertertype.toSql(type));
    }
    return map;
  }

  AutopartTypeInfoTableCompanion toCompanion(bool nullToAbsent) {
    return AutopartTypeInfoTableCompanion(
      id: Value(id),
      refId:
          refId == null && nullToAbsent ? const Value.absent() : Value(refId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      type: Value(type),
    );
  }

  factory AutopartTypeInfoTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AutopartTypeInfoTableData(
      id: serializer.fromJson<int>(json['id']),
      refId: serializer.fromJson<int?>(json['refId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      type: serializer.fromJson<AutopartTypeInfoEnum>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'refId': serializer.toJson<int?>(refId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'type': serializer.toJson<AutopartTypeInfoEnum>(type),
    };
  }

  AutopartTypeInfoTableData copyWith(
          {int? id,
          Value<int?> refId = const Value.absent(),
          String? name,
          Value<String?> description = const Value.absent(),
          AutopartTypeInfoEnum? type}) =>
      AutopartTypeInfoTableData(
        id: id ?? this.id,
        refId: refId.present ? refId.value : this.refId,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        type: type ?? this.type,
      );
  AutopartTypeInfoTableData copyWithCompanion(
      AutopartTypeInfoTableCompanion data) {
    return AutopartTypeInfoTableData(
      id: data.id.present ? data.id.value : this.id,
      refId: data.refId.present ? data.refId.value : this.refId,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AutopartTypeInfoTableData(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, refId, name, description, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AutopartTypeInfoTableData &&
          other.id == this.id &&
          other.refId == this.refId &&
          other.name == this.name &&
          other.description == this.description &&
          other.type == this.type);
}

class AutopartTypeInfoTableCompanion
    extends UpdateCompanion<AutopartTypeInfoTableData> {
  final Value<int> id;
  final Value<int?> refId;
  final Value<String> name;
  final Value<String?> description;
  final Value<AutopartTypeInfoEnum> type;
  const AutopartTypeInfoTableCompanion({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.type = const Value.absent(),
  });
  AutopartTypeInfoTableCompanion.insert({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    required AutopartTypeInfoEnum type,
  })  : name = Value(name),
        type = Value(type);
  static Insertable<AutopartTypeInfoTableData> custom({
    Expression<int>? id,
    Expression<int>? refId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (refId != null) 'ref_id': refId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (type != null) 'type': type,
    });
  }

  AutopartTypeInfoTableCompanion copyWith(
      {Value<int>? id,
      Value<int?>? refId,
      Value<String>? name,
      Value<String?>? description,
      Value<AutopartTypeInfoEnum>? type}) {
    return AutopartTypeInfoTableCompanion(
      id: id ?? this.id,
      refId: refId ?? this.refId,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<int>(refId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
          $AutopartTypeInfoTableTable.$convertertype.toSql(type.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AutopartTypeInfoTableCompanion(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $AutopartOfSellerTableTable extends AutopartOfSellerTable
    with TableInfo<$AutopartOfSellerTableTable, AutopartOfSellerTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AutopartOfSellerTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<int> refId = GeneratedColumn<int>(
      'ref_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _amountUnitMeta =
      const VerificationMeta('amountUnit');
  @override
  late final GeneratedColumn<int> amountUnit = GeneratedColumn<int>(
      'amount_unit', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _amountUnitPublicMeta =
      const VerificationMeta('amountUnitPublic');
  @override
  late final GeneratedColumn<int> amountUnitPublic = GeneratedColumn<int>(
      'amount_unit_public', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _unitPriceMeta =
      const VerificationMeta('unitPrice');
  @override
  late final GeneratedColumn<double> unitPrice = GeneratedColumn<double>(
      'unit_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitPricePublicMeta =
      const VerificationMeta('unitPricePublic');
  @override
  late final GeneratedColumn<double> unitPricePublic = GeneratedColumn<double>(
      'unit_price_public', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _wholessalePriceMeta =
      const VerificationMeta('wholessalePrice');
  @override
  late final GeneratedColumn<double> wholessalePrice = GeneratedColumn<double>(
      'wholessale_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _wholessalePricePublicMeta =
      const VerificationMeta('wholessalePricePublic');
  @override
  late final GeneratedColumn<double> wholessalePricePublic =
      GeneratedColumn<double>('wholessale_price_public', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _autopartIdMeta =
      const VerificationMeta('autopartId');
  @override
  late final GeneratedColumn<int> autopartId = GeneratedColumn<int>(
      'autopart_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        refId,
        amountUnit,
        amountUnitPublic,
        unitPrice,
        unitPricePublic,
        wholessalePrice,
        wholessalePricePublic,
        autopartId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'autopart_of_seller_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AutopartOfSellerTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ref_id')) {
      context.handle(
          _refIdMeta, refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta));
    }
    if (data.containsKey('amount_unit')) {
      context.handle(
          _amountUnitMeta,
          amountUnit.isAcceptableOrUnknown(
              data['amount_unit']!, _amountUnitMeta));
    } else if (isInserting) {
      context.missing(_amountUnitMeta);
    }
    if (data.containsKey('amount_unit_public')) {
      context.handle(
          _amountUnitPublicMeta,
          amountUnitPublic.isAcceptableOrUnknown(
              data['amount_unit_public']!, _amountUnitPublicMeta));
    } else if (isInserting) {
      context.missing(_amountUnitPublicMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(_unitPriceMeta,
          unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta));
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('unit_price_public')) {
      context.handle(
          _unitPricePublicMeta,
          unitPricePublic.isAcceptableOrUnknown(
              data['unit_price_public']!, _unitPricePublicMeta));
    } else if (isInserting) {
      context.missing(_unitPricePublicMeta);
    }
    if (data.containsKey('wholessale_price')) {
      context.handle(
          _wholessalePriceMeta,
          wholessalePrice.isAcceptableOrUnknown(
              data['wholessale_price']!, _wholessalePriceMeta));
    } else if (isInserting) {
      context.missing(_wholessalePriceMeta);
    }
    if (data.containsKey('wholessale_price_public')) {
      context.handle(
          _wholessalePricePublicMeta,
          wholessalePricePublic.isAcceptableOrUnknown(
              data['wholessale_price_public']!, _wholessalePricePublicMeta));
    } else if (isInserting) {
      context.missing(_wholessalePricePublicMeta);
    }
    if (data.containsKey('autopart_id')) {
      context.handle(
          _autopartIdMeta,
          autopartId.isAcceptableOrUnknown(
              data['autopart_id']!, _autopartIdMeta));
    } else if (isInserting) {
      context.missing(_autopartIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AutopartOfSellerTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AutopartOfSellerTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      refId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ref_id']),
      amountUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount_unit'])!,
      amountUnitPublic: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}amount_unit_public'])!,
      unitPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}unit_price'])!,
      unitPricePublic: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}unit_price_public'])!,
      wholessalePrice: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}wholessale_price'])!,
      wholessalePricePublic: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}wholessale_price_public'])!,
      autopartId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}autopart_id'])!,
    );
  }

  @override
  $AutopartOfSellerTableTable createAlias(String alias) {
    return $AutopartOfSellerTableTable(attachedDatabase, alias);
  }
}

class AutopartOfSellerTableData extends DataClass
    implements Insertable<AutopartOfSellerTableData> {
  final int id;
  final int? refId;
  final int amountUnit;
  final int amountUnitPublic;
  final double unitPrice;
  final double unitPricePublic;
  final double wholessalePrice;
  final double wholessalePricePublic;
  final int autopartId;
  const AutopartOfSellerTableData(
      {required this.id,
      this.refId,
      required this.amountUnit,
      required this.amountUnitPublic,
      required this.unitPrice,
      required this.unitPricePublic,
      required this.wholessalePrice,
      required this.wholessalePricePublic,
      required this.autopartId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || refId != null) {
      map['ref_id'] = Variable<int>(refId);
    }
    map['amount_unit'] = Variable<int>(amountUnit);
    map['amount_unit_public'] = Variable<int>(amountUnitPublic);
    map['unit_price'] = Variable<double>(unitPrice);
    map['unit_price_public'] = Variable<double>(unitPricePublic);
    map['wholessale_price'] = Variable<double>(wholessalePrice);
    map['wholessale_price_public'] = Variable<double>(wholessalePricePublic);
    map['autopart_id'] = Variable<int>(autopartId);
    return map;
  }

  AutopartOfSellerTableCompanion toCompanion(bool nullToAbsent) {
    return AutopartOfSellerTableCompanion(
      id: Value(id),
      refId:
          refId == null && nullToAbsent ? const Value.absent() : Value(refId),
      amountUnit: Value(amountUnit),
      amountUnitPublic: Value(amountUnitPublic),
      unitPrice: Value(unitPrice),
      unitPricePublic: Value(unitPricePublic),
      wholessalePrice: Value(wholessalePrice),
      wholessalePricePublic: Value(wholessalePricePublic),
      autopartId: Value(autopartId),
    );
  }

  factory AutopartOfSellerTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AutopartOfSellerTableData(
      id: serializer.fromJson<int>(json['id']),
      refId: serializer.fromJson<int?>(json['refId']),
      amountUnit: serializer.fromJson<int>(json['amountUnit']),
      amountUnitPublic: serializer.fromJson<int>(json['amountUnitPublic']),
      unitPrice: serializer.fromJson<double>(json['unitPrice']),
      unitPricePublic: serializer.fromJson<double>(json['unitPricePublic']),
      wholessalePrice: serializer.fromJson<double>(json['wholessalePrice']),
      wholessalePricePublic:
          serializer.fromJson<double>(json['wholessalePricePublic']),
      autopartId: serializer.fromJson<int>(json['autopartId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'refId': serializer.toJson<int?>(refId),
      'amountUnit': serializer.toJson<int>(amountUnit),
      'amountUnitPublic': serializer.toJson<int>(amountUnitPublic),
      'unitPrice': serializer.toJson<double>(unitPrice),
      'unitPricePublic': serializer.toJson<double>(unitPricePublic),
      'wholessalePrice': serializer.toJson<double>(wholessalePrice),
      'wholessalePricePublic': serializer.toJson<double>(wholessalePricePublic),
      'autopartId': serializer.toJson<int>(autopartId),
    };
  }

  AutopartOfSellerTableData copyWith(
          {int? id,
          Value<int?> refId = const Value.absent(),
          int? amountUnit,
          int? amountUnitPublic,
          double? unitPrice,
          double? unitPricePublic,
          double? wholessalePrice,
          double? wholessalePricePublic,
          int? autopartId}) =>
      AutopartOfSellerTableData(
        id: id ?? this.id,
        refId: refId.present ? refId.value : this.refId,
        amountUnit: amountUnit ?? this.amountUnit,
        amountUnitPublic: amountUnitPublic ?? this.amountUnitPublic,
        unitPrice: unitPrice ?? this.unitPrice,
        unitPricePublic: unitPricePublic ?? this.unitPricePublic,
        wholessalePrice: wholessalePrice ?? this.wholessalePrice,
        wholessalePricePublic:
            wholessalePricePublic ?? this.wholessalePricePublic,
        autopartId: autopartId ?? this.autopartId,
      );
  AutopartOfSellerTableData copyWithCompanion(
      AutopartOfSellerTableCompanion data) {
    return AutopartOfSellerTableData(
      id: data.id.present ? data.id.value : this.id,
      refId: data.refId.present ? data.refId.value : this.refId,
      amountUnit:
          data.amountUnit.present ? data.amountUnit.value : this.amountUnit,
      amountUnitPublic: data.amountUnitPublic.present
          ? data.amountUnitPublic.value
          : this.amountUnitPublic,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      unitPricePublic: data.unitPricePublic.present
          ? data.unitPricePublic.value
          : this.unitPricePublic,
      wholessalePrice: data.wholessalePrice.present
          ? data.wholessalePrice.value
          : this.wholessalePrice,
      wholessalePricePublic: data.wholessalePricePublic.present
          ? data.wholessalePricePublic.value
          : this.wholessalePricePublic,
      autopartId:
          data.autopartId.present ? data.autopartId.value : this.autopartId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AutopartOfSellerTableData(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('amountUnit: $amountUnit, ')
          ..write('amountUnitPublic: $amountUnitPublic, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('unitPricePublic: $unitPricePublic, ')
          ..write('wholessalePrice: $wholessalePrice, ')
          ..write('wholessalePricePublic: $wholessalePricePublic, ')
          ..write('autopartId: $autopartId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      refId,
      amountUnit,
      amountUnitPublic,
      unitPrice,
      unitPricePublic,
      wholessalePrice,
      wholessalePricePublic,
      autopartId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AutopartOfSellerTableData &&
          other.id == this.id &&
          other.refId == this.refId &&
          other.amountUnit == this.amountUnit &&
          other.amountUnitPublic == this.amountUnitPublic &&
          other.unitPrice == this.unitPrice &&
          other.unitPricePublic == this.unitPricePublic &&
          other.wholessalePrice == this.wholessalePrice &&
          other.wholessalePricePublic == this.wholessalePricePublic &&
          other.autopartId == this.autopartId);
}

class AutopartOfSellerTableCompanion
    extends UpdateCompanion<AutopartOfSellerTableData> {
  final Value<int> id;
  final Value<int?> refId;
  final Value<int> amountUnit;
  final Value<int> amountUnitPublic;
  final Value<double> unitPrice;
  final Value<double> unitPricePublic;
  final Value<double> wholessalePrice;
  final Value<double> wholessalePricePublic;
  final Value<int> autopartId;
  const AutopartOfSellerTableCompanion({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    this.amountUnit = const Value.absent(),
    this.amountUnitPublic = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.unitPricePublic = const Value.absent(),
    this.wholessalePrice = const Value.absent(),
    this.wholessalePricePublic = const Value.absent(),
    this.autopartId = const Value.absent(),
  });
  AutopartOfSellerTableCompanion.insert({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    required int amountUnit,
    required int amountUnitPublic,
    required double unitPrice,
    required double unitPricePublic,
    required double wholessalePrice,
    required double wholessalePricePublic,
    required int autopartId,
  })  : amountUnit = Value(amountUnit),
        amountUnitPublic = Value(amountUnitPublic),
        unitPrice = Value(unitPrice),
        unitPricePublic = Value(unitPricePublic),
        wholessalePrice = Value(wholessalePrice),
        wholessalePricePublic = Value(wholessalePricePublic),
        autopartId = Value(autopartId);
  static Insertable<AutopartOfSellerTableData> custom({
    Expression<int>? id,
    Expression<int>? refId,
    Expression<int>? amountUnit,
    Expression<int>? amountUnitPublic,
    Expression<double>? unitPrice,
    Expression<double>? unitPricePublic,
    Expression<double>? wholessalePrice,
    Expression<double>? wholessalePricePublic,
    Expression<int>? autopartId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (refId != null) 'ref_id': refId,
      if (amountUnit != null) 'amount_unit': amountUnit,
      if (amountUnitPublic != null) 'amount_unit_public': amountUnitPublic,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (unitPricePublic != null) 'unit_price_public': unitPricePublic,
      if (wholessalePrice != null) 'wholessale_price': wholessalePrice,
      if (wholessalePricePublic != null)
        'wholessale_price_public': wholessalePricePublic,
      if (autopartId != null) 'autopart_id': autopartId,
    });
  }

  AutopartOfSellerTableCompanion copyWith(
      {Value<int>? id,
      Value<int?>? refId,
      Value<int>? amountUnit,
      Value<int>? amountUnitPublic,
      Value<double>? unitPrice,
      Value<double>? unitPricePublic,
      Value<double>? wholessalePrice,
      Value<double>? wholessalePricePublic,
      Value<int>? autopartId}) {
    return AutopartOfSellerTableCompanion(
      id: id ?? this.id,
      refId: refId ?? this.refId,
      amountUnit: amountUnit ?? this.amountUnit,
      amountUnitPublic: amountUnitPublic ?? this.amountUnitPublic,
      unitPrice: unitPrice ?? this.unitPrice,
      unitPricePublic: unitPricePublic ?? this.unitPricePublic,
      wholessalePrice: wholessalePrice ?? this.wholessalePrice,
      wholessalePricePublic:
          wholessalePricePublic ?? this.wholessalePricePublic,
      autopartId: autopartId ?? this.autopartId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<int>(refId.value);
    }
    if (amountUnit.present) {
      map['amount_unit'] = Variable<int>(amountUnit.value);
    }
    if (amountUnitPublic.present) {
      map['amount_unit_public'] = Variable<int>(amountUnitPublic.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (unitPricePublic.present) {
      map['unit_price_public'] = Variable<double>(unitPricePublic.value);
    }
    if (wholessalePrice.present) {
      map['wholessale_price'] = Variable<double>(wholessalePrice.value);
    }
    if (wholessalePricePublic.present) {
      map['wholessale_price_public'] =
          Variable<double>(wholessalePricePublic.value);
    }
    if (autopartId.present) {
      map['autopart_id'] = Variable<int>(autopartId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AutopartOfSellerTableCompanion(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('amountUnit: $amountUnit, ')
          ..write('amountUnitPublic: $amountUnitPublic, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('unitPricePublic: $unitPricePublic, ')
          ..write('wholessalePrice: $wholessalePrice, ')
          ..write('wholessalePricePublic: $wholessalePricePublic, ')
          ..write('autopartId: $autopartId')
          ..write(')'))
        .toString();
  }
}

class $AutopartAssetTableTable extends AutopartAssetTable
    with TableInfo<$AutopartAssetTableTable, AutopartAssetTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AutopartAssetTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<int> refId = GeneratedColumn<int>(
      'ref_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _assetMeta = const VerificationMeta('asset');
  @override
  late final GeneratedColumn<String> asset = GeneratedColumn<String>(
      'asset', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _autopartIdMeta =
      const VerificationMeta('autopartId');
  @override
  late final GeneratedColumn<int> autopartId = GeneratedColumn<int>(
      'autopart_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, refId, asset, description, autopartId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'autopart_asset_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AutopartAssetTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ref_id')) {
      context.handle(
          _refIdMeta, refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta));
    }
    if (data.containsKey('asset')) {
      context.handle(
          _assetMeta, asset.isAcceptableOrUnknown(data['asset']!, _assetMeta));
    } else if (isInserting) {
      context.missing(_assetMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('autopart_id')) {
      context.handle(
          _autopartIdMeta,
          autopartId.isAcceptableOrUnknown(
              data['autopart_id']!, _autopartIdMeta));
    } else if (isInserting) {
      context.missing(_autopartIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AutopartAssetTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AutopartAssetTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      refId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ref_id']),
      asset: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}asset'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      autopartId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}autopart_id'])!,
    );
  }

  @override
  $AutopartAssetTableTable createAlias(String alias) {
    return $AutopartAssetTableTable(attachedDatabase, alias);
  }
}

class AutopartAssetTableData extends DataClass
    implements Insertable<AutopartAssetTableData> {
  final int id;
  final int? refId;
  final String asset;
  final String? description;
  final int autopartId;
  const AutopartAssetTableData(
      {required this.id,
      this.refId,
      required this.asset,
      this.description,
      required this.autopartId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || refId != null) {
      map['ref_id'] = Variable<int>(refId);
    }
    map['asset'] = Variable<String>(asset);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['autopart_id'] = Variable<int>(autopartId);
    return map;
  }

  AutopartAssetTableCompanion toCompanion(bool nullToAbsent) {
    return AutopartAssetTableCompanion(
      id: Value(id),
      refId:
          refId == null && nullToAbsent ? const Value.absent() : Value(refId),
      asset: Value(asset),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      autopartId: Value(autopartId),
    );
  }

  factory AutopartAssetTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AutopartAssetTableData(
      id: serializer.fromJson<int>(json['id']),
      refId: serializer.fromJson<int?>(json['refId']),
      asset: serializer.fromJson<String>(json['asset']),
      description: serializer.fromJson<String?>(json['description']),
      autopartId: serializer.fromJson<int>(json['autopartId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'refId': serializer.toJson<int?>(refId),
      'asset': serializer.toJson<String>(asset),
      'description': serializer.toJson<String?>(description),
      'autopartId': serializer.toJson<int>(autopartId),
    };
  }

  AutopartAssetTableData copyWith(
          {int? id,
          Value<int?> refId = const Value.absent(),
          String? asset,
          Value<String?> description = const Value.absent(),
          int? autopartId}) =>
      AutopartAssetTableData(
        id: id ?? this.id,
        refId: refId.present ? refId.value : this.refId,
        asset: asset ?? this.asset,
        description: description.present ? description.value : this.description,
        autopartId: autopartId ?? this.autopartId,
      );
  AutopartAssetTableData copyWithCompanion(AutopartAssetTableCompanion data) {
    return AutopartAssetTableData(
      id: data.id.present ? data.id.value : this.id,
      refId: data.refId.present ? data.refId.value : this.refId,
      asset: data.asset.present ? data.asset.value : this.asset,
      description:
          data.description.present ? data.description.value : this.description,
      autopartId:
          data.autopartId.present ? data.autopartId.value : this.autopartId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AutopartAssetTableData(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('asset: $asset, ')
          ..write('description: $description, ')
          ..write('autopartId: $autopartId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, refId, asset, description, autopartId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AutopartAssetTableData &&
          other.id == this.id &&
          other.refId == this.refId &&
          other.asset == this.asset &&
          other.description == this.description &&
          other.autopartId == this.autopartId);
}

class AutopartAssetTableCompanion
    extends UpdateCompanion<AutopartAssetTableData> {
  final Value<int> id;
  final Value<int?> refId;
  final Value<String> asset;
  final Value<String?> description;
  final Value<int> autopartId;
  const AutopartAssetTableCompanion({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    this.asset = const Value.absent(),
    this.description = const Value.absent(),
    this.autopartId = const Value.absent(),
  });
  AutopartAssetTableCompanion.insert({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    required String asset,
    this.description = const Value.absent(),
    required int autopartId,
  })  : asset = Value(asset),
        autopartId = Value(autopartId);
  static Insertable<AutopartAssetTableData> custom({
    Expression<int>? id,
    Expression<int>? refId,
    Expression<String>? asset,
    Expression<String>? description,
    Expression<int>? autopartId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (refId != null) 'ref_id': refId,
      if (asset != null) 'asset': asset,
      if (description != null) 'description': description,
      if (autopartId != null) 'autopart_id': autopartId,
    });
  }

  AutopartAssetTableCompanion copyWith(
      {Value<int>? id,
      Value<int?>? refId,
      Value<String>? asset,
      Value<String?>? description,
      Value<int>? autopartId}) {
    return AutopartAssetTableCompanion(
      id: id ?? this.id,
      refId: refId ?? this.refId,
      asset: asset ?? this.asset,
      description: description ?? this.description,
      autopartId: autopartId ?? this.autopartId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<int>(refId.value);
    }
    if (asset.present) {
      map['asset'] = Variable<String>(asset.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (autopartId.present) {
      map['autopart_id'] = Variable<int>(autopartId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AutopartAssetTableCompanion(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('asset: $asset, ')
          ..write('description: $description, ')
          ..write('autopartId: $autopartId')
          ..write(')'))
        .toString();
  }
}

class $AutopartBrandTableTable extends AutopartBrandTable
    with TableInfo<$AutopartBrandTableTable, AutopartBrandTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AutopartBrandTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<int> refId = GeneratedColumn<int>(
      'ref_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _logoMeta = const VerificationMeta('logo');
  @override
  late final GeneratedColumn<String> logo = GeneratedColumn<String>(
      'logo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, refId, logo, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'autopart_brand_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AutopartBrandTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ref_id')) {
      context.handle(
          _refIdMeta, refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta));
    }
    if (data.containsKey('logo')) {
      context.handle(
          _logoMeta, logo.isAcceptableOrUnknown(data['logo']!, _logoMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AutopartBrandTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AutopartBrandTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      refId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ref_id']),
      logo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}logo']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $AutopartBrandTableTable createAlias(String alias) {
    return $AutopartBrandTableTable(attachedDatabase, alias);
  }
}

class AutopartBrandTableData extends DataClass
    implements Insertable<AutopartBrandTableData> {
  final int id;
  final int? refId;
  final String? logo;
  final String name;
  const AutopartBrandTableData(
      {required this.id, this.refId, this.logo, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || refId != null) {
      map['ref_id'] = Variable<int>(refId);
    }
    if (!nullToAbsent || logo != null) {
      map['logo'] = Variable<String>(logo);
    }
    map['name'] = Variable<String>(name);
    return map;
  }

  AutopartBrandTableCompanion toCompanion(bool nullToAbsent) {
    return AutopartBrandTableCompanion(
      id: Value(id),
      refId:
          refId == null && nullToAbsent ? const Value.absent() : Value(refId),
      logo: logo == null && nullToAbsent ? const Value.absent() : Value(logo),
      name: Value(name),
    );
  }

  factory AutopartBrandTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AutopartBrandTableData(
      id: serializer.fromJson<int>(json['id']),
      refId: serializer.fromJson<int?>(json['refId']),
      logo: serializer.fromJson<String?>(json['logo']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'refId': serializer.toJson<int?>(refId),
      'logo': serializer.toJson<String?>(logo),
      'name': serializer.toJson<String>(name),
    };
  }

  AutopartBrandTableData copyWith(
          {int? id,
          Value<int?> refId = const Value.absent(),
          Value<String?> logo = const Value.absent(),
          String? name}) =>
      AutopartBrandTableData(
        id: id ?? this.id,
        refId: refId.present ? refId.value : this.refId,
        logo: logo.present ? logo.value : this.logo,
        name: name ?? this.name,
      );
  AutopartBrandTableData copyWithCompanion(AutopartBrandTableCompanion data) {
    return AutopartBrandTableData(
      id: data.id.present ? data.id.value : this.id,
      refId: data.refId.present ? data.refId.value : this.refId,
      logo: data.logo.present ? data.logo.value : this.logo,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AutopartBrandTableData(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('logo: $logo, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, refId, logo, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AutopartBrandTableData &&
          other.id == this.id &&
          other.refId == this.refId &&
          other.logo == this.logo &&
          other.name == this.name);
}

class AutopartBrandTableCompanion
    extends UpdateCompanion<AutopartBrandTableData> {
  final Value<int> id;
  final Value<int?> refId;
  final Value<String?> logo;
  final Value<String> name;
  const AutopartBrandTableCompanion({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    this.logo = const Value.absent(),
    this.name = const Value.absent(),
  });
  AutopartBrandTableCompanion.insert({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    this.logo = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<AutopartBrandTableData> custom({
    Expression<int>? id,
    Expression<int>? refId,
    Expression<String>? logo,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (refId != null) 'ref_id': refId,
      if (logo != null) 'logo': logo,
      if (name != null) 'name': name,
    });
  }

  AutopartBrandTableCompanion copyWith(
      {Value<int>? id,
      Value<int?>? refId,
      Value<String?>? logo,
      Value<String>? name}) {
    return AutopartBrandTableCompanion(
      id: id ?? this.id,
      refId: refId ?? this.refId,
      logo: logo ?? this.logo,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<int>(refId.value);
    }
    if (logo.present) {
      map['logo'] = Variable<String>(logo.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AutopartBrandTableCompanion(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('logo: $logo, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $AutopartInfoTableTable extends AutopartInfoTable
    with TableInfo<$AutopartInfoTableTable, AutopartInfoTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AutopartInfoTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<int> refId = GeneratedColumn<int>(
      'ref_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeIdMeta = const VerificationMeta('typeId');
  @override
  late final GeneratedColumn<int> typeId = GeneratedColumn<int>(
      'type_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _autopartIdMeta =
      const VerificationMeta('autopartId');
  @override
  late final GeneratedColumn<int> autopartId = GeneratedColumn<int>(
      'autopart_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, refId, value, typeId, autopartId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'autopart_info_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AutopartInfoTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ref_id')) {
      context.handle(
          _refIdMeta, refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('type_id')) {
      context.handle(_typeIdMeta,
          typeId.isAcceptableOrUnknown(data['type_id']!, _typeIdMeta));
    } else if (isInserting) {
      context.missing(_typeIdMeta);
    }
    if (data.containsKey('autopart_id')) {
      context.handle(
          _autopartIdMeta,
          autopartId.isAcceptableOrUnknown(
              data['autopart_id']!, _autopartIdMeta));
    } else if (isInserting) {
      context.missing(_autopartIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AutopartInfoTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AutopartInfoTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      refId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ref_id']),
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      typeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_id'])!,
      autopartId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}autopart_id'])!,
    );
  }

  @override
  $AutopartInfoTableTable createAlias(String alias) {
    return $AutopartInfoTableTable(attachedDatabase, alias);
  }
}

class AutopartInfoTableData extends DataClass
    implements Insertable<AutopartInfoTableData> {
  final int id;
  final int? refId;
  final String value;
  final int typeId;
  final int autopartId;
  const AutopartInfoTableData(
      {required this.id,
      this.refId,
      required this.value,
      required this.typeId,
      required this.autopartId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || refId != null) {
      map['ref_id'] = Variable<int>(refId);
    }
    map['value'] = Variable<String>(value);
    map['type_id'] = Variable<int>(typeId);
    map['autopart_id'] = Variable<int>(autopartId);
    return map;
  }

  AutopartInfoTableCompanion toCompanion(bool nullToAbsent) {
    return AutopartInfoTableCompanion(
      id: Value(id),
      refId:
          refId == null && nullToAbsent ? const Value.absent() : Value(refId),
      value: Value(value),
      typeId: Value(typeId),
      autopartId: Value(autopartId),
    );
  }

  factory AutopartInfoTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AutopartInfoTableData(
      id: serializer.fromJson<int>(json['id']),
      refId: serializer.fromJson<int?>(json['refId']),
      value: serializer.fromJson<String>(json['value']),
      typeId: serializer.fromJson<int>(json['typeId']),
      autopartId: serializer.fromJson<int>(json['autopartId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'refId': serializer.toJson<int?>(refId),
      'value': serializer.toJson<String>(value),
      'typeId': serializer.toJson<int>(typeId),
      'autopartId': serializer.toJson<int>(autopartId),
    };
  }

  AutopartInfoTableData copyWith(
          {int? id,
          Value<int?> refId = const Value.absent(),
          String? value,
          int? typeId,
          int? autopartId}) =>
      AutopartInfoTableData(
        id: id ?? this.id,
        refId: refId.present ? refId.value : this.refId,
        value: value ?? this.value,
        typeId: typeId ?? this.typeId,
        autopartId: autopartId ?? this.autopartId,
      );
  AutopartInfoTableData copyWithCompanion(AutopartInfoTableCompanion data) {
    return AutopartInfoTableData(
      id: data.id.present ? data.id.value : this.id,
      refId: data.refId.present ? data.refId.value : this.refId,
      value: data.value.present ? data.value.value : this.value,
      typeId: data.typeId.present ? data.typeId.value : this.typeId,
      autopartId:
          data.autopartId.present ? data.autopartId.value : this.autopartId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AutopartInfoTableData(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('value: $value, ')
          ..write('typeId: $typeId, ')
          ..write('autopartId: $autopartId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, refId, value, typeId, autopartId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AutopartInfoTableData &&
          other.id == this.id &&
          other.refId == this.refId &&
          other.value == this.value &&
          other.typeId == this.typeId &&
          other.autopartId == this.autopartId);
}

class AutopartInfoTableCompanion
    extends UpdateCompanion<AutopartInfoTableData> {
  final Value<int> id;
  final Value<int?> refId;
  final Value<String> value;
  final Value<int> typeId;
  final Value<int> autopartId;
  const AutopartInfoTableCompanion({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    this.value = const Value.absent(),
    this.typeId = const Value.absent(),
    this.autopartId = const Value.absent(),
  });
  AutopartInfoTableCompanion.insert({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    required String value,
    required int typeId,
    required int autopartId,
  })  : value = Value(value),
        typeId = Value(typeId),
        autopartId = Value(autopartId);
  static Insertable<AutopartInfoTableData> custom({
    Expression<int>? id,
    Expression<int>? refId,
    Expression<String>? value,
    Expression<int>? typeId,
    Expression<int>? autopartId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (refId != null) 'ref_id': refId,
      if (value != null) 'value': value,
      if (typeId != null) 'type_id': typeId,
      if (autopartId != null) 'autopart_id': autopartId,
    });
  }

  AutopartInfoTableCompanion copyWith(
      {Value<int>? id,
      Value<int?>? refId,
      Value<String>? value,
      Value<int>? typeId,
      Value<int>? autopartId}) {
    return AutopartInfoTableCompanion(
      id: id ?? this.id,
      refId: refId ?? this.refId,
      value: value ?? this.value,
      typeId: typeId ?? this.typeId,
      autopartId: autopartId ?? this.autopartId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<int>(refId.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (typeId.present) {
      map['type_id'] = Variable<int>(typeId.value);
    }
    if (autopartId.present) {
      map['autopart_id'] = Variable<int>(autopartId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AutopartInfoTableCompanion(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('value: $value, ')
          ..write('typeId: $typeId, ')
          ..write('autopartId: $autopartId')
          ..write(')'))
        .toString();
  }
}

class $CustomerTableTable extends CustomerTable
    with TableInfo<$CustomerTableTable, CustomerTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<int> refId = GeneratedColumn<int>(
      'ref_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, refId, name, phone, email];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customer_table';
  @override
  VerificationContext validateIntegrity(Insertable<CustomerTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ref_id')) {
      context.handle(
          _refIdMeta, refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta));
    } else if (isInserting) {
      context.missing(_refIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      refId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ref_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
    );
  }

  @override
  $CustomerTableTable createAlias(String alias) {
    return $CustomerTableTable(attachedDatabase, alias);
  }
}

class CustomerTableData extends DataClass
    implements Insertable<CustomerTableData> {
  final int id;
  final int refId;
  final String name;
  final String phone;
  final String email;
  const CustomerTableData(
      {required this.id,
      required this.refId,
      required this.name,
      required this.phone,
      required this.email});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ref_id'] = Variable<int>(refId);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<String>(phone);
    map['email'] = Variable<String>(email);
    return map;
  }

  CustomerTableCompanion toCompanion(bool nullToAbsent) {
    return CustomerTableCompanion(
      id: Value(id),
      refId: Value(refId),
      name: Value(name),
      phone: Value(phone),
      email: Value(email),
    );
  }

  factory CustomerTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerTableData(
      id: serializer.fromJson<int>(json['id']),
      refId: serializer.fromJson<int>(json['refId']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      email: serializer.fromJson<String>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'refId': serializer.toJson<int>(refId),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'email': serializer.toJson<String>(email),
    };
  }

  CustomerTableData copyWith(
          {int? id, int? refId, String? name, String? phone, String? email}) =>
      CustomerTableData(
        id: id ?? this.id,
        refId: refId ?? this.refId,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
      );
  CustomerTableData copyWithCompanion(CustomerTableCompanion data) {
    return CustomerTableData(
      id: data.id.present ? data.id.value : this.id,
      refId: data.refId.present ? data.refId.value : this.refId,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerTableData(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, refId, name, phone, email);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerTableData &&
          other.id == this.id &&
          other.refId == this.refId &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.email == this.email);
}

class CustomerTableCompanion extends UpdateCompanion<CustomerTableData> {
  final Value<int> id;
  final Value<int> refId;
  final Value<String> name;
  final Value<String> phone;
  final Value<String> email;
  const CustomerTableCompanion({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
  });
  CustomerTableCompanion.insert({
    this.id = const Value.absent(),
    required int refId,
    required String name,
    required String phone,
    required String email,
  })  : refId = Value(refId),
        name = Value(name),
        phone = Value(phone),
        email = Value(email);
  static Insertable<CustomerTableData> custom({
    Expression<int>? id,
    Expression<int>? refId,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? email,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (refId != null) 'ref_id': refId,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
    });
  }

  CustomerTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? refId,
      Value<String>? name,
      Value<String>? phone,
      Value<String>? email}) {
    return CustomerTableCompanion(
      id: id ?? this.id,
      refId: refId ?? this.refId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<int>(refId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerTableCompanion(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
      'token', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _refreshTokenMeta =
      const VerificationMeta('refreshToken');
  @override
  late final GeneratedColumn<String> refreshToken = GeneratedColumn<String>(
      'refresh_token', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateExpiredMeta =
      const VerificationMeta('dateExpired');
  @override
  late final GeneratedColumn<DateTime> dateExpired = GeneratedColumn<DateTime>(
      'date_expired', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<String> latitude = GeneratedColumn<String>(
      'latitude', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lengthMeta = const VerificationMeta('length');
  @override
  late final GeneratedColumn<String> length = GeneratedColumn<String>(
      'length', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, token, refreshToken, dateExpired, latitude, length];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    }
    if (data.containsKey('refresh_token')) {
      context.handle(
          _refreshTokenMeta,
          refreshToken.isAcceptableOrUnknown(
              data['refresh_token']!, _refreshTokenMeta));
    }
    if (data.containsKey('date_expired')) {
      context.handle(
          _dateExpiredMeta,
          dateExpired.isAcceptableOrUnknown(
              data['date_expired']!, _dateExpiredMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('length')) {
      context.handle(_lengthMeta,
          length.isAcceptableOrUnknown(data['length']!, _lengthMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token']),
      refreshToken: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}refresh_token']),
      dateExpired: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_expired']),
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}latitude']),
      length: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}length']),
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class UserTableData extends DataClass implements Insertable<UserTableData> {
  final int id;
  final String name;
  final String? token;
  final String? refreshToken;
  final DateTime? dateExpired;
  final String? latitude;
  final String? length;
  const UserTableData(
      {required this.id,
      required this.name,
      this.token,
      this.refreshToken,
      this.dateExpired,
      this.latitude,
      this.length});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || token != null) {
      map['token'] = Variable<String>(token);
    }
    if (!nullToAbsent || refreshToken != null) {
      map['refresh_token'] = Variable<String>(refreshToken);
    }
    if (!nullToAbsent || dateExpired != null) {
      map['date_expired'] = Variable<DateTime>(dateExpired);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<String>(latitude);
    }
    if (!nullToAbsent || length != null) {
      map['length'] = Variable<String>(length);
    }
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: Value(id),
      name: Value(name),
      token:
          token == null && nullToAbsent ? const Value.absent() : Value(token),
      refreshToken: refreshToken == null && nullToAbsent
          ? const Value.absent()
          : Value(refreshToken),
      dateExpired: dateExpired == null && nullToAbsent
          ? const Value.absent()
          : Value(dateExpired),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      length:
          length == null && nullToAbsent ? const Value.absent() : Value(length),
    );
  }

  factory UserTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      token: serializer.fromJson<String?>(json['token']),
      refreshToken: serializer.fromJson<String?>(json['refreshToken']),
      dateExpired: serializer.fromJson<DateTime?>(json['dateExpired']),
      latitude: serializer.fromJson<String?>(json['latitude']),
      length: serializer.fromJson<String?>(json['length']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'token': serializer.toJson<String?>(token),
      'refreshToken': serializer.toJson<String?>(refreshToken),
      'dateExpired': serializer.toJson<DateTime?>(dateExpired),
      'latitude': serializer.toJson<String?>(latitude),
      'length': serializer.toJson<String?>(length),
    };
  }

  UserTableData copyWith(
          {int? id,
          String? name,
          Value<String?> token = const Value.absent(),
          Value<String?> refreshToken = const Value.absent(),
          Value<DateTime?> dateExpired = const Value.absent(),
          Value<String?> latitude = const Value.absent(),
          Value<String?> length = const Value.absent()}) =>
      UserTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        token: token.present ? token.value : this.token,
        refreshToken:
            refreshToken.present ? refreshToken.value : this.refreshToken,
        dateExpired: dateExpired.present ? dateExpired.value : this.dateExpired,
        latitude: latitude.present ? latitude.value : this.latitude,
        length: length.present ? length.value : this.length,
      );
  UserTableData copyWithCompanion(UserTableCompanion data) {
    return UserTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      token: data.token.present ? data.token.value : this.token,
      refreshToken: data.refreshToken.present
          ? data.refreshToken.value
          : this.refreshToken,
      dateExpired:
          data.dateExpired.present ? data.dateExpired.value : this.dateExpired,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      length: data.length.present ? data.length.value : this.length,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('token: $token, ')
          ..write('refreshToken: $refreshToken, ')
          ..write('dateExpired: $dateExpired, ')
          ..write('latitude: $latitude, ')
          ..write('length: $length')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, token, refreshToken, dateExpired, latitude, length);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.token == this.token &&
          other.refreshToken == this.refreshToken &&
          other.dateExpired == this.dateExpired &&
          other.latitude == this.latitude &&
          other.length == this.length);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> token;
  final Value<String?> refreshToken;
  final Value<DateTime?> dateExpired;
  final Value<String?> latitude;
  final Value<String?> length;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.token = const Value.absent(),
    this.refreshToken = const Value.absent(),
    this.dateExpired = const Value.absent(),
    this.latitude = const Value.absent(),
    this.length = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.token = const Value.absent(),
    this.refreshToken = const Value.absent(),
    this.dateExpired = const Value.absent(),
    this.latitude = const Value.absent(),
    this.length = const Value.absent(),
  }) : name = Value(name);
  static Insertable<UserTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? token,
    Expression<String>? refreshToken,
    Expression<DateTime>? dateExpired,
    Expression<String>? latitude,
    Expression<String>? length,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (token != null) 'token': token,
      if (refreshToken != null) 'refresh_token': refreshToken,
      if (dateExpired != null) 'date_expired': dateExpired,
      if (latitude != null) 'latitude': latitude,
      if (length != null) 'length': length,
    });
  }

  UserTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? token,
      Value<String?>? refreshToken,
      Value<DateTime?>? dateExpired,
      Value<String?>? latitude,
      Value<String?>? length}) {
    return UserTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      dateExpired: dateExpired ?? this.dateExpired,
      latitude: latitude ?? this.latitude,
      length: length ?? this.length,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (refreshToken.present) {
      map['refresh_token'] = Variable<String>(refreshToken.value);
    }
    if (dateExpired.present) {
      map['date_expired'] = Variable<DateTime>(dateExpired.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<String>(latitude.value);
    }
    if (length.present) {
      map['length'] = Variable<String>(length.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('token: $token, ')
          ..write('refreshToken: $refreshToken, ')
          ..write('dateExpired: $dateExpired, ')
          ..write('latitude: $latitude, ')
          ..write('length: $length')
          ..write(')'))
        .toString();
  }
}

class $SaleDetailTableTable extends SaleDetailTable
    with TableInfo<$SaleDetailTableTable, SaleDetailTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SaleDetailTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<int> refId = GeneratedColumn<int>(
      'ref_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _cutomerIdMeta =
      const VerificationMeta('cutomerId');
  @override
  late final GeneratedColumn<String> cutomerId = GeneratedColumn<String>(
      'cutomer_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _saleDateMeta =
      const VerificationMeta('saleDate');
  @override
  late final GeneratedColumn<DateTime> saleDate = GeneratedColumn<DateTime>(
      'sale_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _customerNotSubscribedMeta =
      const VerificationMeta('customerNotSubscribed');
  @override
  late final GeneratedColumn<String> customerNotSubscribed =
      GeneratedColumn<String>('customer_not_subscribed', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<SaleStateEnum, String> state =
      GeneratedColumn<String>('state', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<SaleStateEnum>($SaleDetailTableTable.$converterstate);
  @override
  List<GeneratedColumn> get $columns =>
      [id, refId, cutomerId, saleDate, customerNotSubscribed, state];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sale_detail_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<SaleDetailTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ref_id')) {
      context.handle(
          _refIdMeta, refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta));
    } else if (isInserting) {
      context.missing(_refIdMeta);
    }
    if (data.containsKey('cutomer_id')) {
      context.handle(_cutomerIdMeta,
          cutomerId.isAcceptableOrUnknown(data['cutomer_id']!, _cutomerIdMeta));
    }
    if (data.containsKey('sale_date')) {
      context.handle(_saleDateMeta,
          saleDate.isAcceptableOrUnknown(data['sale_date']!, _saleDateMeta));
    } else if (isInserting) {
      context.missing(_saleDateMeta);
    }
    if (data.containsKey('customer_not_subscribed')) {
      context.handle(
          _customerNotSubscribedMeta,
          customerNotSubscribed.isAcceptableOrUnknown(
              data['customer_not_subscribed']!, _customerNotSubscribedMeta));
    } else if (isInserting) {
      context.missing(_customerNotSubscribedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SaleDetailTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SaleDetailTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      refId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ref_id'])!,
      cutomerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cutomer_id']),
      saleDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}sale_date'])!,
      customerNotSubscribed: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}customer_not_subscribed'])!,
      state: $SaleDetailTableTable.$converterstate.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state'])!),
    );
  }

  @override
  $SaleDetailTableTable createAlias(String alias) {
    return $SaleDetailTableTable(attachedDatabase, alias);
  }

  static TypeConverter<SaleStateEnum, String> $converterstate =
      const SaleStateEnumConverter();
}

class SaleDetailTableData extends DataClass
    implements Insertable<SaleDetailTableData> {
  final int id;
  final int refId;
  final String? cutomerId;
  final DateTime saleDate;
  final String customerNotSubscribed;
  final SaleStateEnum state;
  const SaleDetailTableData(
      {required this.id,
      required this.refId,
      this.cutomerId,
      required this.saleDate,
      required this.customerNotSubscribed,
      required this.state});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ref_id'] = Variable<int>(refId);
    if (!nullToAbsent || cutomerId != null) {
      map['cutomer_id'] = Variable<String>(cutomerId);
    }
    map['sale_date'] = Variable<DateTime>(saleDate);
    map['customer_not_subscribed'] = Variable<String>(customerNotSubscribed);
    {
      map['state'] =
          Variable<String>($SaleDetailTableTable.$converterstate.toSql(state));
    }
    return map;
  }

  SaleDetailTableCompanion toCompanion(bool nullToAbsent) {
    return SaleDetailTableCompanion(
      id: Value(id),
      refId: Value(refId),
      cutomerId: cutomerId == null && nullToAbsent
          ? const Value.absent()
          : Value(cutomerId),
      saleDate: Value(saleDate),
      customerNotSubscribed: Value(customerNotSubscribed),
      state: Value(state),
    );
  }

  factory SaleDetailTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SaleDetailTableData(
      id: serializer.fromJson<int>(json['id']),
      refId: serializer.fromJson<int>(json['refId']),
      cutomerId: serializer.fromJson<String?>(json['cutomerId']),
      saleDate: serializer.fromJson<DateTime>(json['saleDate']),
      customerNotSubscribed:
          serializer.fromJson<String>(json['customerNotSubscribed']),
      state: serializer.fromJson<SaleStateEnum>(json['state']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'refId': serializer.toJson<int>(refId),
      'cutomerId': serializer.toJson<String?>(cutomerId),
      'saleDate': serializer.toJson<DateTime>(saleDate),
      'customerNotSubscribed': serializer.toJson<String>(customerNotSubscribed),
      'state': serializer.toJson<SaleStateEnum>(state),
    };
  }

  SaleDetailTableData copyWith(
          {int? id,
          int? refId,
          Value<String?> cutomerId = const Value.absent(),
          DateTime? saleDate,
          String? customerNotSubscribed,
          SaleStateEnum? state}) =>
      SaleDetailTableData(
        id: id ?? this.id,
        refId: refId ?? this.refId,
        cutomerId: cutomerId.present ? cutomerId.value : this.cutomerId,
        saleDate: saleDate ?? this.saleDate,
        customerNotSubscribed:
            customerNotSubscribed ?? this.customerNotSubscribed,
        state: state ?? this.state,
      );
  SaleDetailTableData copyWithCompanion(SaleDetailTableCompanion data) {
    return SaleDetailTableData(
      id: data.id.present ? data.id.value : this.id,
      refId: data.refId.present ? data.refId.value : this.refId,
      cutomerId: data.cutomerId.present ? data.cutomerId.value : this.cutomerId,
      saleDate: data.saleDate.present ? data.saleDate.value : this.saleDate,
      customerNotSubscribed: data.customerNotSubscribed.present
          ? data.customerNotSubscribed.value
          : this.customerNotSubscribed,
      state: data.state.present ? data.state.value : this.state,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SaleDetailTableData(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('cutomerId: $cutomerId, ')
          ..write('saleDate: $saleDate, ')
          ..write('customerNotSubscribed: $customerNotSubscribed, ')
          ..write('state: $state')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, refId, cutomerId, saleDate, customerNotSubscribed, state);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SaleDetailTableData &&
          other.id == this.id &&
          other.refId == this.refId &&
          other.cutomerId == this.cutomerId &&
          other.saleDate == this.saleDate &&
          other.customerNotSubscribed == this.customerNotSubscribed &&
          other.state == this.state);
}

class SaleDetailTableCompanion extends UpdateCompanion<SaleDetailTableData> {
  final Value<int> id;
  final Value<int> refId;
  final Value<String?> cutomerId;
  final Value<DateTime> saleDate;
  final Value<String> customerNotSubscribed;
  final Value<SaleStateEnum> state;
  const SaleDetailTableCompanion({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    this.cutomerId = const Value.absent(),
    this.saleDate = const Value.absent(),
    this.customerNotSubscribed = const Value.absent(),
    this.state = const Value.absent(),
  });
  SaleDetailTableCompanion.insert({
    this.id = const Value.absent(),
    required int refId,
    this.cutomerId = const Value.absent(),
    required DateTime saleDate,
    required String customerNotSubscribed,
    required SaleStateEnum state,
  })  : refId = Value(refId),
        saleDate = Value(saleDate),
        customerNotSubscribed = Value(customerNotSubscribed),
        state = Value(state);
  static Insertable<SaleDetailTableData> custom({
    Expression<int>? id,
    Expression<int>? refId,
    Expression<String>? cutomerId,
    Expression<DateTime>? saleDate,
    Expression<String>? customerNotSubscribed,
    Expression<String>? state,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (refId != null) 'ref_id': refId,
      if (cutomerId != null) 'cutomer_id': cutomerId,
      if (saleDate != null) 'sale_date': saleDate,
      if (customerNotSubscribed != null)
        'customer_not_subscribed': customerNotSubscribed,
      if (state != null) 'state': state,
    });
  }

  SaleDetailTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? refId,
      Value<String?>? cutomerId,
      Value<DateTime>? saleDate,
      Value<String>? customerNotSubscribed,
      Value<SaleStateEnum>? state}) {
    return SaleDetailTableCompanion(
      id: id ?? this.id,
      refId: refId ?? this.refId,
      cutomerId: cutomerId ?? this.cutomerId,
      saleDate: saleDate ?? this.saleDate,
      customerNotSubscribed:
          customerNotSubscribed ?? this.customerNotSubscribed,
      state: state ?? this.state,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<int>(refId.value);
    }
    if (cutomerId.present) {
      map['cutomer_id'] = Variable<String>(cutomerId.value);
    }
    if (saleDate.present) {
      map['sale_date'] = Variable<DateTime>(saleDate.value);
    }
    if (customerNotSubscribed.present) {
      map['customer_not_subscribed'] =
          Variable<String>(customerNotSubscribed.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(
          $SaleDetailTableTable.$converterstate.toSql(state.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SaleDetailTableCompanion(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('cutomerId: $cutomerId, ')
          ..write('saleDate: $saleDate, ')
          ..write('customerNotSubscribed: $customerNotSubscribed, ')
          ..write('state: $state')
          ..write(')'))
        .toString();
  }
}

class $SaleTableTable extends SaleTable
    with TableInfo<$SaleTableTable, SaleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SaleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<int> refId = GeneratedColumn<int>(
      'ref_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _autopartIdMeta =
      const VerificationMeta('autopartId');
  @override
  late final GeneratedColumn<int> autopartId = GeneratedColumn<int>(
      'autopart_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _saleDetailIdMeta =
      const VerificationMeta('saleDetailId');
  @override
  late final GeneratedColumn<int> saleDetailId = GeneratedColumn<int>(
      'sale_detail_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, refId, autopartId, saleDetailId, amount, price, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sale_table';
  @override
  VerificationContext validateIntegrity(Insertable<SaleTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ref_id')) {
      context.handle(
          _refIdMeta, refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta));
    } else if (isInserting) {
      context.missing(_refIdMeta);
    }
    if (data.containsKey('autopart_id')) {
      context.handle(
          _autopartIdMeta,
          autopartId.isAcceptableOrUnknown(
              data['autopart_id']!, _autopartIdMeta));
    } else if (isInserting) {
      context.missing(_autopartIdMeta);
    }
    if (data.containsKey('sale_detail_id')) {
      context.handle(
          _saleDetailIdMeta,
          saleDetailId.isAcceptableOrUnknown(
              data['sale_detail_id']!, _saleDetailIdMeta));
    } else if (isInserting) {
      context.missing(_saleDetailIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SaleTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SaleTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      refId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ref_id'])!,
      autopartId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}autopart_id'])!,
      saleDetailId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sale_detail_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $SaleTableTable createAlias(String alias) {
    return $SaleTableTable(attachedDatabase, alias);
  }
}

class SaleTableData extends DataClass implements Insertable<SaleTableData> {
  final int id;
  final int refId;
  final int autopartId;
  final int saleDetailId;
  final int amount;
  final double price;
  final String name;
  const SaleTableData(
      {required this.id,
      required this.refId,
      required this.autopartId,
      required this.saleDetailId,
      required this.amount,
      required this.price,
      required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ref_id'] = Variable<int>(refId);
    map['autopart_id'] = Variable<int>(autopartId);
    map['sale_detail_id'] = Variable<int>(saleDetailId);
    map['amount'] = Variable<int>(amount);
    map['price'] = Variable<double>(price);
    map['name'] = Variable<String>(name);
    return map;
  }

  SaleTableCompanion toCompanion(bool nullToAbsent) {
    return SaleTableCompanion(
      id: Value(id),
      refId: Value(refId),
      autopartId: Value(autopartId),
      saleDetailId: Value(saleDetailId),
      amount: Value(amount),
      price: Value(price),
      name: Value(name),
    );
  }

  factory SaleTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SaleTableData(
      id: serializer.fromJson<int>(json['id']),
      refId: serializer.fromJson<int>(json['refId']),
      autopartId: serializer.fromJson<int>(json['autopartId']),
      saleDetailId: serializer.fromJson<int>(json['saleDetailId']),
      amount: serializer.fromJson<int>(json['amount']),
      price: serializer.fromJson<double>(json['price']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'refId': serializer.toJson<int>(refId),
      'autopartId': serializer.toJson<int>(autopartId),
      'saleDetailId': serializer.toJson<int>(saleDetailId),
      'amount': serializer.toJson<int>(amount),
      'price': serializer.toJson<double>(price),
      'name': serializer.toJson<String>(name),
    };
  }

  SaleTableData copyWith(
          {int? id,
          int? refId,
          int? autopartId,
          int? saleDetailId,
          int? amount,
          double? price,
          String? name}) =>
      SaleTableData(
        id: id ?? this.id,
        refId: refId ?? this.refId,
        autopartId: autopartId ?? this.autopartId,
        saleDetailId: saleDetailId ?? this.saleDetailId,
        amount: amount ?? this.amount,
        price: price ?? this.price,
        name: name ?? this.name,
      );
  SaleTableData copyWithCompanion(SaleTableCompanion data) {
    return SaleTableData(
      id: data.id.present ? data.id.value : this.id,
      refId: data.refId.present ? data.refId.value : this.refId,
      autopartId:
          data.autopartId.present ? data.autopartId.value : this.autopartId,
      saleDetailId: data.saleDetailId.present
          ? data.saleDetailId.value
          : this.saleDetailId,
      amount: data.amount.present ? data.amount.value : this.amount,
      price: data.price.present ? data.price.value : this.price,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SaleTableData(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('autopartId: $autopartId, ')
          ..write('saleDetailId: $saleDetailId, ')
          ..write('amount: $amount, ')
          ..write('price: $price, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, refId, autopartId, saleDetailId, amount, price, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SaleTableData &&
          other.id == this.id &&
          other.refId == this.refId &&
          other.autopartId == this.autopartId &&
          other.saleDetailId == this.saleDetailId &&
          other.amount == this.amount &&
          other.price == this.price &&
          other.name == this.name);
}

class SaleTableCompanion extends UpdateCompanion<SaleTableData> {
  final Value<int> id;
  final Value<int> refId;
  final Value<int> autopartId;
  final Value<int> saleDetailId;
  final Value<int> amount;
  final Value<double> price;
  final Value<String> name;
  const SaleTableCompanion({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    this.autopartId = const Value.absent(),
    this.saleDetailId = const Value.absent(),
    this.amount = const Value.absent(),
    this.price = const Value.absent(),
    this.name = const Value.absent(),
  });
  SaleTableCompanion.insert({
    this.id = const Value.absent(),
    required int refId,
    required int autopartId,
    required int saleDetailId,
    required int amount,
    required double price,
    required String name,
  })  : refId = Value(refId),
        autopartId = Value(autopartId),
        saleDetailId = Value(saleDetailId),
        amount = Value(amount),
        price = Value(price),
        name = Value(name);
  static Insertable<SaleTableData> custom({
    Expression<int>? id,
    Expression<int>? refId,
    Expression<int>? autopartId,
    Expression<int>? saleDetailId,
    Expression<int>? amount,
    Expression<double>? price,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (refId != null) 'ref_id': refId,
      if (autopartId != null) 'autopart_id': autopartId,
      if (saleDetailId != null) 'sale_detail_id': saleDetailId,
      if (amount != null) 'amount': amount,
      if (price != null) 'price': price,
      if (name != null) 'name': name,
    });
  }

  SaleTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? refId,
      Value<int>? autopartId,
      Value<int>? saleDetailId,
      Value<int>? amount,
      Value<double>? price,
      Value<String>? name}) {
    return SaleTableCompanion(
      id: id ?? this.id,
      refId: refId ?? this.refId,
      autopartId: autopartId ?? this.autopartId,
      saleDetailId: saleDetailId ?? this.saleDetailId,
      amount: amount ?? this.amount,
      price: price ?? this.price,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<int>(refId.value);
    }
    if (autopartId.present) {
      map['autopart_id'] = Variable<int>(autopartId.value);
    }
    if (saleDetailId.present) {
      map['sale_detail_id'] = Variable<int>(saleDetailId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SaleTableCompanion(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('autopartId: $autopartId, ')
          ..write('saleDetailId: $saleDetailId, ')
          ..write('amount: $amount, ')
          ..write('price: $price, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $CountryTableTable extends CountryTable
    with TableInfo<$CountryTableTable, CountryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<int> refId = GeneratedColumn<int>(
      'ref_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedColumn<String> photo = GeneratedColumn<String>(
      'photo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _codePhoneMeta =
      const VerificationMeta('codePhone');
  @override
  late final GeneratedColumn<String> codePhone = GeneratedColumn<String>(
      'code_phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, refId, name, photo, codePhone];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'country_table';
  @override
  VerificationContext validateIntegrity(Insertable<CountryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ref_id')) {
      context.handle(
          _refIdMeta, refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta));
    } else if (isInserting) {
      context.missing(_refIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo']!, _photoMeta));
    }
    if (data.containsKey('code_phone')) {
      context.handle(_codePhoneMeta,
          codePhone.isAcceptableOrUnknown(data['code_phone']!, _codePhoneMeta));
    } else if (isInserting) {
      context.missing(_codePhoneMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CountryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CountryTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      refId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ref_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      photo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo']),
      codePhone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code_phone'])!,
    );
  }

  @override
  $CountryTableTable createAlias(String alias) {
    return $CountryTableTable(attachedDatabase, alias);
  }
}

class CountryTableData extends DataClass
    implements Insertable<CountryTableData> {
  final int id;
  final int refId;
  final String name;
  final String? photo;
  final String codePhone;
  const CountryTableData(
      {required this.id,
      required this.refId,
      required this.name,
      this.photo,
      required this.codePhone});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ref_id'] = Variable<int>(refId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || photo != null) {
      map['photo'] = Variable<String>(photo);
    }
    map['code_phone'] = Variable<String>(codePhone);
    return map;
  }

  CountryTableCompanion toCompanion(bool nullToAbsent) {
    return CountryTableCompanion(
      id: Value(id),
      refId: Value(refId),
      name: Value(name),
      photo:
          photo == null && nullToAbsent ? const Value.absent() : Value(photo),
      codePhone: Value(codePhone),
    );
  }

  factory CountryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CountryTableData(
      id: serializer.fromJson<int>(json['id']),
      refId: serializer.fromJson<int>(json['refId']),
      name: serializer.fromJson<String>(json['name']),
      photo: serializer.fromJson<String?>(json['photo']),
      codePhone: serializer.fromJson<String>(json['codePhone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'refId': serializer.toJson<int>(refId),
      'name': serializer.toJson<String>(name),
      'photo': serializer.toJson<String?>(photo),
      'codePhone': serializer.toJson<String>(codePhone),
    };
  }

  CountryTableData copyWith(
          {int? id,
          int? refId,
          String? name,
          Value<String?> photo = const Value.absent(),
          String? codePhone}) =>
      CountryTableData(
        id: id ?? this.id,
        refId: refId ?? this.refId,
        name: name ?? this.name,
        photo: photo.present ? photo.value : this.photo,
        codePhone: codePhone ?? this.codePhone,
      );
  CountryTableData copyWithCompanion(CountryTableCompanion data) {
    return CountryTableData(
      id: data.id.present ? data.id.value : this.id,
      refId: data.refId.present ? data.refId.value : this.refId,
      name: data.name.present ? data.name.value : this.name,
      photo: data.photo.present ? data.photo.value : this.photo,
      codePhone: data.codePhone.present ? data.codePhone.value : this.codePhone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CountryTableData(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('name: $name, ')
          ..write('photo: $photo, ')
          ..write('codePhone: $codePhone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, refId, name, photo, codePhone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountryTableData &&
          other.id == this.id &&
          other.refId == this.refId &&
          other.name == this.name &&
          other.photo == this.photo &&
          other.codePhone == this.codePhone);
}

class CountryTableCompanion extends UpdateCompanion<CountryTableData> {
  final Value<int> id;
  final Value<int> refId;
  final Value<String> name;
  final Value<String?> photo;
  final Value<String> codePhone;
  const CountryTableCompanion({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    this.name = const Value.absent(),
    this.photo = const Value.absent(),
    this.codePhone = const Value.absent(),
  });
  CountryTableCompanion.insert({
    this.id = const Value.absent(),
    required int refId,
    required String name,
    this.photo = const Value.absent(),
    required String codePhone,
  })  : refId = Value(refId),
        name = Value(name),
        codePhone = Value(codePhone);
  static Insertable<CountryTableData> custom({
    Expression<int>? id,
    Expression<int>? refId,
    Expression<String>? name,
    Expression<String>? photo,
    Expression<String>? codePhone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (refId != null) 'ref_id': refId,
      if (name != null) 'name': name,
      if (photo != null) 'photo': photo,
      if (codePhone != null) 'code_phone': codePhone,
    });
  }

  CountryTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? refId,
      Value<String>? name,
      Value<String?>? photo,
      Value<String>? codePhone}) {
    return CountryTableCompanion(
      id: id ?? this.id,
      refId: refId ?? this.refId,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      codePhone: codePhone ?? this.codePhone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<int>(refId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (photo.present) {
      map['photo'] = Variable<String>(photo.value);
    }
    if (codePhone.present) {
      map['code_phone'] = Variable<String>(codePhone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountryTableCompanion(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('name: $name, ')
          ..write('photo: $photo, ')
          ..write('codePhone: $codePhone')
          ..write(')'))
        .toString();
  }
}

class $CityTableTable extends CityTable
    with TableInfo<$CityTableTable, CityTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CityTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<int> refId = GeneratedColumn<int>(
      'ref_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedColumn<String> photo = GeneratedColumn<String>(
      'photo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _countryIdMeta =
      const VerificationMeta('countryId');
  @override
  late final GeneratedColumn<int> countryId = GeneratedColumn<int>(
      'country_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, refId, name, photo, countryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'city_table';
  @override
  VerificationContext validateIntegrity(Insertable<CityTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ref_id')) {
      context.handle(
          _refIdMeta, refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta));
    } else if (isInserting) {
      context.missing(_refIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo']!, _photoMeta));
    }
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta));
    } else if (isInserting) {
      context.missing(_countryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CityTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CityTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      refId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ref_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      photo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo']),
      countryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}country_id'])!,
    );
  }

  @override
  $CityTableTable createAlias(String alias) {
    return $CityTableTable(attachedDatabase, alias);
  }
}

class CityTableData extends DataClass implements Insertable<CityTableData> {
  final int id;
  final int refId;
  final String name;
  final String? photo;
  final int countryId;
  const CityTableData(
      {required this.id,
      required this.refId,
      required this.name,
      this.photo,
      required this.countryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ref_id'] = Variable<int>(refId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || photo != null) {
      map['photo'] = Variable<String>(photo);
    }
    map['country_id'] = Variable<int>(countryId);
    return map;
  }

  CityTableCompanion toCompanion(bool nullToAbsent) {
    return CityTableCompanion(
      id: Value(id),
      refId: Value(refId),
      name: Value(name),
      photo:
          photo == null && nullToAbsent ? const Value.absent() : Value(photo),
      countryId: Value(countryId),
    );
  }

  factory CityTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CityTableData(
      id: serializer.fromJson<int>(json['id']),
      refId: serializer.fromJson<int>(json['refId']),
      name: serializer.fromJson<String>(json['name']),
      photo: serializer.fromJson<String?>(json['photo']),
      countryId: serializer.fromJson<int>(json['countryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'refId': serializer.toJson<int>(refId),
      'name': serializer.toJson<String>(name),
      'photo': serializer.toJson<String?>(photo),
      'countryId': serializer.toJson<int>(countryId),
    };
  }

  CityTableData copyWith(
          {int? id,
          int? refId,
          String? name,
          Value<String?> photo = const Value.absent(),
          int? countryId}) =>
      CityTableData(
        id: id ?? this.id,
        refId: refId ?? this.refId,
        name: name ?? this.name,
        photo: photo.present ? photo.value : this.photo,
        countryId: countryId ?? this.countryId,
      );
  CityTableData copyWithCompanion(CityTableCompanion data) {
    return CityTableData(
      id: data.id.present ? data.id.value : this.id,
      refId: data.refId.present ? data.refId.value : this.refId,
      name: data.name.present ? data.name.value : this.name,
      photo: data.photo.present ? data.photo.value : this.photo,
      countryId: data.countryId.present ? data.countryId.value : this.countryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CityTableData(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('name: $name, ')
          ..write('photo: $photo, ')
          ..write('countryId: $countryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, refId, name, photo, countryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CityTableData &&
          other.id == this.id &&
          other.refId == this.refId &&
          other.name == this.name &&
          other.photo == this.photo &&
          other.countryId == this.countryId);
}

class CityTableCompanion extends UpdateCompanion<CityTableData> {
  final Value<int> id;
  final Value<int> refId;
  final Value<String> name;
  final Value<String?> photo;
  final Value<int> countryId;
  const CityTableCompanion({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    this.name = const Value.absent(),
    this.photo = const Value.absent(),
    this.countryId = const Value.absent(),
  });
  CityTableCompanion.insert({
    this.id = const Value.absent(),
    required int refId,
    required String name,
    this.photo = const Value.absent(),
    required int countryId,
  })  : refId = Value(refId),
        name = Value(name),
        countryId = Value(countryId);
  static Insertable<CityTableData> custom({
    Expression<int>? id,
    Expression<int>? refId,
    Expression<String>? name,
    Expression<String>? photo,
    Expression<int>? countryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (refId != null) 'ref_id': refId,
      if (name != null) 'name': name,
      if (photo != null) 'photo': photo,
      if (countryId != null) 'country_id': countryId,
    });
  }

  CityTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? refId,
      Value<String>? name,
      Value<String?>? photo,
      Value<int>? countryId}) {
    return CityTableCompanion(
      id: id ?? this.id,
      refId: refId ?? this.refId,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      countryId: countryId ?? this.countryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<int>(refId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (photo.present) {
      map['photo'] = Variable<String>(photo.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<int>(countryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CityTableCompanion(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('name: $name, ')
          ..write('photo: $photo, ')
          ..write('countryId: $countryId')
          ..write(')'))
        .toString();
  }
}

class $CategoryTableTable extends CategoryTable
    with TableInfo<$CategoryTableTable, CategoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<int> refId = GeneratedColumn<int>(
      'ref_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, refId, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_table';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ref_id')) {
      context.handle(
          _refIdMeta, refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta));
    } else if (isInserting) {
      context.missing(_refIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      refId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ref_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $CategoryTableTable createAlias(String alias) {
    return $CategoryTableTable(attachedDatabase, alias);
  }
}

class CategoryTableData extends DataClass
    implements Insertable<CategoryTableData> {
  final int id;
  final int refId;
  final String name;
  final String? description;
  const CategoryTableData(
      {required this.id,
      required this.refId,
      required this.name,
      this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ref_id'] = Variable<int>(refId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  CategoryTableCompanion toCompanion(bool nullToAbsent) {
    return CategoryTableCompanion(
      id: Value(id),
      refId: Value(refId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory CategoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryTableData(
      id: serializer.fromJson<int>(json['id']),
      refId: serializer.fromJson<int>(json['refId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'refId': serializer.toJson<int>(refId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
    };
  }

  CategoryTableData copyWith(
          {int? id,
          int? refId,
          String? name,
          Value<String?> description = const Value.absent()}) =>
      CategoryTableData(
        id: id ?? this.id,
        refId: refId ?? this.refId,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
      );
  CategoryTableData copyWithCompanion(CategoryTableCompanion data) {
    return CategoryTableData(
      id: data.id.present ? data.id.value : this.id,
      refId: data.refId.present ? data.refId.value : this.refId,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableData(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, refId, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryTableData &&
          other.id == this.id &&
          other.refId == this.refId &&
          other.name == this.name &&
          other.description == this.description);
}

class CategoryTableCompanion extends UpdateCompanion<CategoryTableData> {
  final Value<int> id;
  final Value<int> refId;
  final Value<String> name;
  final Value<String?> description;
  const CategoryTableCompanion({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  CategoryTableCompanion.insert({
    this.id = const Value.absent(),
    required int refId,
    required String name,
    this.description = const Value.absent(),
  })  : refId = Value(refId),
        name = Value(name);
  static Insertable<CategoryTableData> custom({
    Expression<int>? id,
    Expression<int>? refId,
    Expression<String>? name,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (refId != null) 'ref_id': refId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  CategoryTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? refId,
      Value<String>? name,
      Value<String?>? description}) {
    return CategoryTableCompanion(
      id: id ?? this.id,
      refId: refId ?? this.refId,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<int>(refId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableCompanion(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AutopartTableTable autopartTable = $AutopartTableTable(this);
  late final $AutopartTypeInfoTableTable autopartTypeInfoTable =
      $AutopartTypeInfoTableTable(this);
  late final $AutopartOfSellerTableTable autopartOfSellerTable =
      $AutopartOfSellerTableTable(this);
  late final $AutopartAssetTableTable autopartAssetTable =
      $AutopartAssetTableTable(this);
  late final $AutopartBrandTableTable autopartBrandTable =
      $AutopartBrandTableTable(this);
  late final $AutopartInfoTableTable autopartInfoTable =
      $AutopartInfoTableTable(this);
  late final $CustomerTableTable customerTable = $CustomerTableTable(this);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $SaleDetailTableTable saleDetailTable =
      $SaleDetailTableTable(this);
  late final $SaleTableTable saleTable = $SaleTableTable(this);
  late final $CountryTableTable countryTable = $CountryTableTable(this);
  late final $CityTableTable cityTable = $CityTableTable(this);
  late final $CategoryTableTable categoryTable = $CategoryTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        autopartTable,
        autopartTypeInfoTable,
        autopartOfSellerTable,
        autopartAssetTable,
        autopartBrandTable,
        autopartInfoTable,
        customerTable,
        userTable,
        saleDetailTable,
        saleTable,
        countryTable,
        cityTable,
        categoryTable
      ];
}

typedef $$AutopartTableTableCreateCompanionBuilder = AutopartTableCompanion
    Function({
  Value<int> id,
  Value<int?> refId,
  required int brandId,
  required int categoryId,
});
typedef $$AutopartTableTableUpdateCompanionBuilder = AutopartTableCompanion
    Function({
  Value<int> id,
  Value<int?> refId,
  Value<int> brandId,
  Value<int> categoryId,
});

class $$AutopartTableTableFilterComposer
    extends Composer<_$AppDatabase, $AutopartTableTable> {
  $$AutopartTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get brandId => $composableBuilder(
      column: $table.brandId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));
}

class $$AutopartTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AutopartTableTable> {
  $$AutopartTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get brandId => $composableBuilder(
      column: $table.brandId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));
}

class $$AutopartTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AutopartTableTable> {
  $$AutopartTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<int> get brandId =>
      $composableBuilder(column: $table.brandId, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);
}

class $$AutopartTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AutopartTableTable,
    AutopartTableData,
    $$AutopartTableTableFilterComposer,
    $$AutopartTableTableOrderingComposer,
    $$AutopartTableTableAnnotationComposer,
    $$AutopartTableTableCreateCompanionBuilder,
    $$AutopartTableTableUpdateCompanionBuilder,
    (
      AutopartTableData,
      BaseReferences<_$AppDatabase, $AutopartTableTable, AutopartTableData>
    ),
    AutopartTableData,
    PrefetchHooks Function()> {
  $$AutopartTableTableTableManager(_$AppDatabase db, $AutopartTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AutopartTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AutopartTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AutopartTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> refId = const Value.absent(),
            Value<int> brandId = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
          }) =>
              AutopartTableCompanion(
            id: id,
            refId: refId,
            brandId: brandId,
            categoryId: categoryId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> refId = const Value.absent(),
            required int brandId,
            required int categoryId,
          }) =>
              AutopartTableCompanion.insert(
            id: id,
            refId: refId,
            brandId: brandId,
            categoryId: categoryId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AutopartTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AutopartTableTable,
    AutopartTableData,
    $$AutopartTableTableFilterComposer,
    $$AutopartTableTableOrderingComposer,
    $$AutopartTableTableAnnotationComposer,
    $$AutopartTableTableCreateCompanionBuilder,
    $$AutopartTableTableUpdateCompanionBuilder,
    (
      AutopartTableData,
      BaseReferences<_$AppDatabase, $AutopartTableTable, AutopartTableData>
    ),
    AutopartTableData,
    PrefetchHooks Function()>;
typedef $$AutopartTypeInfoTableTableCreateCompanionBuilder
    = AutopartTypeInfoTableCompanion Function({
  Value<int> id,
  Value<int?> refId,
  required String name,
  Value<String?> description,
  required AutopartTypeInfoEnum type,
});
typedef $$AutopartTypeInfoTableTableUpdateCompanionBuilder
    = AutopartTypeInfoTableCompanion Function({
  Value<int> id,
  Value<int?> refId,
  Value<String> name,
  Value<String?> description,
  Value<AutopartTypeInfoEnum> type,
});

class $$AutopartTypeInfoTableTableFilterComposer
    extends Composer<_$AppDatabase, $AutopartTypeInfoTableTable> {
  $$AutopartTypeInfoTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<AutopartTypeInfoEnum, AutopartTypeInfoEnum,
          String>
      get type => $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$AutopartTypeInfoTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AutopartTypeInfoTableTable> {
  $$AutopartTypeInfoTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));
}

class $$AutopartTypeInfoTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AutopartTypeInfoTableTable> {
  $$AutopartTypeInfoTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AutopartTypeInfoEnum, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);
}

class $$AutopartTypeInfoTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AutopartTypeInfoTableTable,
    AutopartTypeInfoTableData,
    $$AutopartTypeInfoTableTableFilterComposer,
    $$AutopartTypeInfoTableTableOrderingComposer,
    $$AutopartTypeInfoTableTableAnnotationComposer,
    $$AutopartTypeInfoTableTableCreateCompanionBuilder,
    $$AutopartTypeInfoTableTableUpdateCompanionBuilder,
    (
      AutopartTypeInfoTableData,
      BaseReferences<_$AppDatabase, $AutopartTypeInfoTableTable,
          AutopartTypeInfoTableData>
    ),
    AutopartTypeInfoTableData,
    PrefetchHooks Function()> {
  $$AutopartTypeInfoTableTableTableManager(
      _$AppDatabase db, $AutopartTypeInfoTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AutopartTypeInfoTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$AutopartTypeInfoTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AutopartTypeInfoTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> refId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<AutopartTypeInfoEnum> type = const Value.absent(),
          }) =>
              AutopartTypeInfoTableCompanion(
            id: id,
            refId: refId,
            name: name,
            description: description,
            type: type,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> refId = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            required AutopartTypeInfoEnum type,
          }) =>
              AutopartTypeInfoTableCompanion.insert(
            id: id,
            refId: refId,
            name: name,
            description: description,
            type: type,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AutopartTypeInfoTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $AutopartTypeInfoTableTable,
        AutopartTypeInfoTableData,
        $$AutopartTypeInfoTableTableFilterComposer,
        $$AutopartTypeInfoTableTableOrderingComposer,
        $$AutopartTypeInfoTableTableAnnotationComposer,
        $$AutopartTypeInfoTableTableCreateCompanionBuilder,
        $$AutopartTypeInfoTableTableUpdateCompanionBuilder,
        (
          AutopartTypeInfoTableData,
          BaseReferences<_$AppDatabase, $AutopartTypeInfoTableTable,
              AutopartTypeInfoTableData>
        ),
        AutopartTypeInfoTableData,
        PrefetchHooks Function()>;
typedef $$AutopartOfSellerTableTableCreateCompanionBuilder
    = AutopartOfSellerTableCompanion Function({
  Value<int> id,
  Value<int?> refId,
  required int amountUnit,
  required int amountUnitPublic,
  required double unitPrice,
  required double unitPricePublic,
  required double wholessalePrice,
  required double wholessalePricePublic,
  required int autopartId,
});
typedef $$AutopartOfSellerTableTableUpdateCompanionBuilder
    = AutopartOfSellerTableCompanion Function({
  Value<int> id,
  Value<int?> refId,
  Value<int> amountUnit,
  Value<int> amountUnitPublic,
  Value<double> unitPrice,
  Value<double> unitPricePublic,
  Value<double> wholessalePrice,
  Value<double> wholessalePricePublic,
  Value<int> autopartId,
});

class $$AutopartOfSellerTableTableFilterComposer
    extends Composer<_$AppDatabase, $AutopartOfSellerTableTable> {
  $$AutopartOfSellerTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amountUnit => $composableBuilder(
      column: $table.amountUnit, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amountUnitPublic => $composableBuilder(
      column: $table.amountUnitPublic,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get unitPricePublic => $composableBuilder(
      column: $table.unitPricePublic,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get wholessalePrice => $composableBuilder(
      column: $table.wholessalePrice,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get wholessalePricePublic => $composableBuilder(
      column: $table.wholessalePricePublic,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get autopartId => $composableBuilder(
      column: $table.autopartId, builder: (column) => ColumnFilters(column));
}

class $$AutopartOfSellerTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AutopartOfSellerTableTable> {
  $$AutopartOfSellerTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amountUnit => $composableBuilder(
      column: $table.amountUnit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amountUnitPublic => $composableBuilder(
      column: $table.amountUnitPublic,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get unitPricePublic => $composableBuilder(
      column: $table.unitPricePublic,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get wholessalePrice => $composableBuilder(
      column: $table.wholessalePrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get wholessalePricePublic => $composableBuilder(
      column: $table.wholessalePricePublic,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get autopartId => $composableBuilder(
      column: $table.autopartId, builder: (column) => ColumnOrderings(column));
}

class $$AutopartOfSellerTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AutopartOfSellerTableTable> {
  $$AutopartOfSellerTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<int> get amountUnit => $composableBuilder(
      column: $table.amountUnit, builder: (column) => column);

  GeneratedColumn<int> get amountUnitPublic => $composableBuilder(
      column: $table.amountUnitPublic, builder: (column) => column);

  GeneratedColumn<double> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<double> get unitPricePublic => $composableBuilder(
      column: $table.unitPricePublic, builder: (column) => column);

  GeneratedColumn<double> get wholessalePrice => $composableBuilder(
      column: $table.wholessalePrice, builder: (column) => column);

  GeneratedColumn<double> get wholessalePricePublic => $composableBuilder(
      column: $table.wholessalePricePublic, builder: (column) => column);

  GeneratedColumn<int> get autopartId => $composableBuilder(
      column: $table.autopartId, builder: (column) => column);
}

class $$AutopartOfSellerTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AutopartOfSellerTableTable,
    AutopartOfSellerTableData,
    $$AutopartOfSellerTableTableFilterComposer,
    $$AutopartOfSellerTableTableOrderingComposer,
    $$AutopartOfSellerTableTableAnnotationComposer,
    $$AutopartOfSellerTableTableCreateCompanionBuilder,
    $$AutopartOfSellerTableTableUpdateCompanionBuilder,
    (
      AutopartOfSellerTableData,
      BaseReferences<_$AppDatabase, $AutopartOfSellerTableTable,
          AutopartOfSellerTableData>
    ),
    AutopartOfSellerTableData,
    PrefetchHooks Function()> {
  $$AutopartOfSellerTableTableTableManager(
      _$AppDatabase db, $AutopartOfSellerTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AutopartOfSellerTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$AutopartOfSellerTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AutopartOfSellerTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> refId = const Value.absent(),
            Value<int> amountUnit = const Value.absent(),
            Value<int> amountUnitPublic = const Value.absent(),
            Value<double> unitPrice = const Value.absent(),
            Value<double> unitPricePublic = const Value.absent(),
            Value<double> wholessalePrice = const Value.absent(),
            Value<double> wholessalePricePublic = const Value.absent(),
            Value<int> autopartId = const Value.absent(),
          }) =>
              AutopartOfSellerTableCompanion(
            id: id,
            refId: refId,
            amountUnit: amountUnit,
            amountUnitPublic: amountUnitPublic,
            unitPrice: unitPrice,
            unitPricePublic: unitPricePublic,
            wholessalePrice: wholessalePrice,
            wholessalePricePublic: wholessalePricePublic,
            autopartId: autopartId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> refId = const Value.absent(),
            required int amountUnit,
            required int amountUnitPublic,
            required double unitPrice,
            required double unitPricePublic,
            required double wholessalePrice,
            required double wholessalePricePublic,
            required int autopartId,
          }) =>
              AutopartOfSellerTableCompanion.insert(
            id: id,
            refId: refId,
            amountUnit: amountUnit,
            amountUnitPublic: amountUnitPublic,
            unitPrice: unitPrice,
            unitPricePublic: unitPricePublic,
            wholessalePrice: wholessalePrice,
            wholessalePricePublic: wholessalePricePublic,
            autopartId: autopartId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AutopartOfSellerTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $AutopartOfSellerTableTable,
        AutopartOfSellerTableData,
        $$AutopartOfSellerTableTableFilterComposer,
        $$AutopartOfSellerTableTableOrderingComposer,
        $$AutopartOfSellerTableTableAnnotationComposer,
        $$AutopartOfSellerTableTableCreateCompanionBuilder,
        $$AutopartOfSellerTableTableUpdateCompanionBuilder,
        (
          AutopartOfSellerTableData,
          BaseReferences<_$AppDatabase, $AutopartOfSellerTableTable,
              AutopartOfSellerTableData>
        ),
        AutopartOfSellerTableData,
        PrefetchHooks Function()>;
typedef $$AutopartAssetTableTableCreateCompanionBuilder
    = AutopartAssetTableCompanion Function({
  Value<int> id,
  Value<int?> refId,
  required String asset,
  Value<String?> description,
  required int autopartId,
});
typedef $$AutopartAssetTableTableUpdateCompanionBuilder
    = AutopartAssetTableCompanion Function({
  Value<int> id,
  Value<int?> refId,
  Value<String> asset,
  Value<String?> description,
  Value<int> autopartId,
});

class $$AutopartAssetTableTableFilterComposer
    extends Composer<_$AppDatabase, $AutopartAssetTableTable> {
  $$AutopartAssetTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get asset => $composableBuilder(
      column: $table.asset, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get autopartId => $composableBuilder(
      column: $table.autopartId, builder: (column) => ColumnFilters(column));
}

class $$AutopartAssetTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AutopartAssetTableTable> {
  $$AutopartAssetTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get asset => $composableBuilder(
      column: $table.asset, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get autopartId => $composableBuilder(
      column: $table.autopartId, builder: (column) => ColumnOrderings(column));
}

class $$AutopartAssetTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AutopartAssetTableTable> {
  $$AutopartAssetTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<String> get asset =>
      $composableBuilder(column: $table.asset, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get autopartId => $composableBuilder(
      column: $table.autopartId, builder: (column) => column);
}

class $$AutopartAssetTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AutopartAssetTableTable,
    AutopartAssetTableData,
    $$AutopartAssetTableTableFilterComposer,
    $$AutopartAssetTableTableOrderingComposer,
    $$AutopartAssetTableTableAnnotationComposer,
    $$AutopartAssetTableTableCreateCompanionBuilder,
    $$AutopartAssetTableTableUpdateCompanionBuilder,
    (
      AutopartAssetTableData,
      BaseReferences<_$AppDatabase, $AutopartAssetTableTable,
          AutopartAssetTableData>
    ),
    AutopartAssetTableData,
    PrefetchHooks Function()> {
  $$AutopartAssetTableTableTableManager(
      _$AppDatabase db, $AutopartAssetTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AutopartAssetTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AutopartAssetTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AutopartAssetTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> refId = const Value.absent(),
            Value<String> asset = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> autopartId = const Value.absent(),
          }) =>
              AutopartAssetTableCompanion(
            id: id,
            refId: refId,
            asset: asset,
            description: description,
            autopartId: autopartId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> refId = const Value.absent(),
            required String asset,
            Value<String?> description = const Value.absent(),
            required int autopartId,
          }) =>
              AutopartAssetTableCompanion.insert(
            id: id,
            refId: refId,
            asset: asset,
            description: description,
            autopartId: autopartId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AutopartAssetTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AutopartAssetTableTable,
    AutopartAssetTableData,
    $$AutopartAssetTableTableFilterComposer,
    $$AutopartAssetTableTableOrderingComposer,
    $$AutopartAssetTableTableAnnotationComposer,
    $$AutopartAssetTableTableCreateCompanionBuilder,
    $$AutopartAssetTableTableUpdateCompanionBuilder,
    (
      AutopartAssetTableData,
      BaseReferences<_$AppDatabase, $AutopartAssetTableTable,
          AutopartAssetTableData>
    ),
    AutopartAssetTableData,
    PrefetchHooks Function()>;
typedef $$AutopartBrandTableTableCreateCompanionBuilder
    = AutopartBrandTableCompanion Function({
  Value<int> id,
  Value<int?> refId,
  Value<String?> logo,
  required String name,
});
typedef $$AutopartBrandTableTableUpdateCompanionBuilder
    = AutopartBrandTableCompanion Function({
  Value<int> id,
  Value<int?> refId,
  Value<String?> logo,
  Value<String> name,
});

class $$AutopartBrandTableTableFilterComposer
    extends Composer<_$AppDatabase, $AutopartBrandTableTable> {
  $$AutopartBrandTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get logo => $composableBuilder(
      column: $table.logo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));
}

class $$AutopartBrandTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AutopartBrandTableTable> {
  $$AutopartBrandTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get logo => $composableBuilder(
      column: $table.logo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$AutopartBrandTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AutopartBrandTableTable> {
  $$AutopartBrandTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<String> get logo =>
      $composableBuilder(column: $table.logo, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$AutopartBrandTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AutopartBrandTableTable,
    AutopartBrandTableData,
    $$AutopartBrandTableTableFilterComposer,
    $$AutopartBrandTableTableOrderingComposer,
    $$AutopartBrandTableTableAnnotationComposer,
    $$AutopartBrandTableTableCreateCompanionBuilder,
    $$AutopartBrandTableTableUpdateCompanionBuilder,
    (
      AutopartBrandTableData,
      BaseReferences<_$AppDatabase, $AutopartBrandTableTable,
          AutopartBrandTableData>
    ),
    AutopartBrandTableData,
    PrefetchHooks Function()> {
  $$AutopartBrandTableTableTableManager(
      _$AppDatabase db, $AutopartBrandTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AutopartBrandTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AutopartBrandTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AutopartBrandTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> refId = const Value.absent(),
            Value<String?> logo = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              AutopartBrandTableCompanion(
            id: id,
            refId: refId,
            logo: logo,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> refId = const Value.absent(),
            Value<String?> logo = const Value.absent(),
            required String name,
          }) =>
              AutopartBrandTableCompanion.insert(
            id: id,
            refId: refId,
            logo: logo,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AutopartBrandTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AutopartBrandTableTable,
    AutopartBrandTableData,
    $$AutopartBrandTableTableFilterComposer,
    $$AutopartBrandTableTableOrderingComposer,
    $$AutopartBrandTableTableAnnotationComposer,
    $$AutopartBrandTableTableCreateCompanionBuilder,
    $$AutopartBrandTableTableUpdateCompanionBuilder,
    (
      AutopartBrandTableData,
      BaseReferences<_$AppDatabase, $AutopartBrandTableTable,
          AutopartBrandTableData>
    ),
    AutopartBrandTableData,
    PrefetchHooks Function()>;
typedef $$AutopartInfoTableTableCreateCompanionBuilder
    = AutopartInfoTableCompanion Function({
  Value<int> id,
  Value<int?> refId,
  required String value,
  required int typeId,
  required int autopartId,
});
typedef $$AutopartInfoTableTableUpdateCompanionBuilder
    = AutopartInfoTableCompanion Function({
  Value<int> id,
  Value<int?> refId,
  Value<String> value,
  Value<int> typeId,
  Value<int> autopartId,
});

class $$AutopartInfoTableTableFilterComposer
    extends Composer<_$AppDatabase, $AutopartInfoTableTable> {
  $$AutopartInfoTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get typeId => $composableBuilder(
      column: $table.typeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get autopartId => $composableBuilder(
      column: $table.autopartId, builder: (column) => ColumnFilters(column));
}

class $$AutopartInfoTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AutopartInfoTableTable> {
  $$AutopartInfoTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get typeId => $composableBuilder(
      column: $table.typeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get autopartId => $composableBuilder(
      column: $table.autopartId, builder: (column) => ColumnOrderings(column));
}

class $$AutopartInfoTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AutopartInfoTableTable> {
  $$AutopartInfoTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<int> get typeId =>
      $composableBuilder(column: $table.typeId, builder: (column) => column);

  GeneratedColumn<int> get autopartId => $composableBuilder(
      column: $table.autopartId, builder: (column) => column);
}

class $$AutopartInfoTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AutopartInfoTableTable,
    AutopartInfoTableData,
    $$AutopartInfoTableTableFilterComposer,
    $$AutopartInfoTableTableOrderingComposer,
    $$AutopartInfoTableTableAnnotationComposer,
    $$AutopartInfoTableTableCreateCompanionBuilder,
    $$AutopartInfoTableTableUpdateCompanionBuilder,
    (
      AutopartInfoTableData,
      BaseReferences<_$AppDatabase, $AutopartInfoTableTable,
          AutopartInfoTableData>
    ),
    AutopartInfoTableData,
    PrefetchHooks Function()> {
  $$AutopartInfoTableTableTableManager(
      _$AppDatabase db, $AutopartInfoTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AutopartInfoTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AutopartInfoTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AutopartInfoTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> refId = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> typeId = const Value.absent(),
            Value<int> autopartId = const Value.absent(),
          }) =>
              AutopartInfoTableCompanion(
            id: id,
            refId: refId,
            value: value,
            typeId: typeId,
            autopartId: autopartId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> refId = const Value.absent(),
            required String value,
            required int typeId,
            required int autopartId,
          }) =>
              AutopartInfoTableCompanion.insert(
            id: id,
            refId: refId,
            value: value,
            typeId: typeId,
            autopartId: autopartId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AutopartInfoTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AutopartInfoTableTable,
    AutopartInfoTableData,
    $$AutopartInfoTableTableFilterComposer,
    $$AutopartInfoTableTableOrderingComposer,
    $$AutopartInfoTableTableAnnotationComposer,
    $$AutopartInfoTableTableCreateCompanionBuilder,
    $$AutopartInfoTableTableUpdateCompanionBuilder,
    (
      AutopartInfoTableData,
      BaseReferences<_$AppDatabase, $AutopartInfoTableTable,
          AutopartInfoTableData>
    ),
    AutopartInfoTableData,
    PrefetchHooks Function()>;
typedef $$CustomerTableTableCreateCompanionBuilder = CustomerTableCompanion
    Function({
  Value<int> id,
  required int refId,
  required String name,
  required String phone,
  required String email,
});
typedef $$CustomerTableTableUpdateCompanionBuilder = CustomerTableCompanion
    Function({
  Value<int> id,
  Value<int> refId,
  Value<String> name,
  Value<String> phone,
  Value<String> email,
});

class $$CustomerTableTableFilterComposer
    extends Composer<_$AppDatabase, $CustomerTableTable> {
  $$CustomerTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));
}

class $$CustomerTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomerTableTable> {
  $$CustomerTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));
}

class $$CustomerTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomerTableTable> {
  $$CustomerTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);
}

class $$CustomerTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomerTableTable,
    CustomerTableData,
    $$CustomerTableTableFilterComposer,
    $$CustomerTableTableOrderingComposer,
    $$CustomerTableTableAnnotationComposer,
    $$CustomerTableTableCreateCompanionBuilder,
    $$CustomerTableTableUpdateCompanionBuilder,
    (
      CustomerTableData,
      BaseReferences<_$AppDatabase, $CustomerTableTable, CustomerTableData>
    ),
    CustomerTableData,
    PrefetchHooks Function()> {
  $$CustomerTableTableTableManager(_$AppDatabase db, $CustomerTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomerTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomerTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomerTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> refId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> phone = const Value.absent(),
            Value<String> email = const Value.absent(),
          }) =>
              CustomerTableCompanion(
            id: id,
            refId: refId,
            name: name,
            phone: phone,
            email: email,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int refId,
            required String name,
            required String phone,
            required String email,
          }) =>
              CustomerTableCompanion.insert(
            id: id,
            refId: refId,
            name: name,
            phone: phone,
            email: email,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CustomerTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomerTableTable,
    CustomerTableData,
    $$CustomerTableTableFilterComposer,
    $$CustomerTableTableOrderingComposer,
    $$CustomerTableTableAnnotationComposer,
    $$CustomerTableTableCreateCompanionBuilder,
    $$CustomerTableTableUpdateCompanionBuilder,
    (
      CustomerTableData,
      BaseReferences<_$AppDatabase, $CustomerTableTable, CustomerTableData>
    ),
    CustomerTableData,
    PrefetchHooks Function()>;
typedef $$UserTableTableCreateCompanionBuilder = UserTableCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> token,
  Value<String?> refreshToken,
  Value<DateTime?> dateExpired,
  Value<String?> latitude,
  Value<String?> length,
});
typedef $$UserTableTableUpdateCompanionBuilder = UserTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> token,
  Value<String?> refreshToken,
  Value<DateTime?> dateExpired,
  Value<String?> latitude,
  Value<String?> length,
});

class $$UserTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get token => $composableBuilder(
      column: $table.token, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get refreshToken => $composableBuilder(
      column: $table.refreshToken, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateExpired => $composableBuilder(
      column: $table.dateExpired, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get length => $composableBuilder(
      column: $table.length, builder: (column) => ColumnFilters(column));
}

class $$UserTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get token => $composableBuilder(
      column: $table.token, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get refreshToken => $composableBuilder(
      column: $table.refreshToken,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateExpired => $composableBuilder(
      column: $table.dateExpired, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get length => $composableBuilder(
      column: $table.length, builder: (column) => ColumnOrderings(column));
}

class $$UserTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);

  GeneratedColumn<String> get refreshToken => $composableBuilder(
      column: $table.refreshToken, builder: (column) => column);

  GeneratedColumn<DateTime> get dateExpired => $composableBuilder(
      column: $table.dateExpired, builder: (column) => column);

  GeneratedColumn<String> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<String> get length =>
      $composableBuilder(column: $table.length, builder: (column) => column);
}

class $$UserTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserTableTable,
    UserTableData,
    $$UserTableTableFilterComposer,
    $$UserTableTableOrderingComposer,
    $$UserTableTableAnnotationComposer,
    $$UserTableTableCreateCompanionBuilder,
    $$UserTableTableUpdateCompanionBuilder,
    (
      UserTableData,
      BaseReferences<_$AppDatabase, $UserTableTable, UserTableData>
    ),
    UserTableData,
    PrefetchHooks Function()> {
  $$UserTableTableTableManager(_$AppDatabase db, $UserTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> token = const Value.absent(),
            Value<String?> refreshToken = const Value.absent(),
            Value<DateTime?> dateExpired = const Value.absent(),
            Value<String?> latitude = const Value.absent(),
            Value<String?> length = const Value.absent(),
          }) =>
              UserTableCompanion(
            id: id,
            name: name,
            token: token,
            refreshToken: refreshToken,
            dateExpired: dateExpired,
            latitude: latitude,
            length: length,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> token = const Value.absent(),
            Value<String?> refreshToken = const Value.absent(),
            Value<DateTime?> dateExpired = const Value.absent(),
            Value<String?> latitude = const Value.absent(),
            Value<String?> length = const Value.absent(),
          }) =>
              UserTableCompanion.insert(
            id: id,
            name: name,
            token: token,
            refreshToken: refreshToken,
            dateExpired: dateExpired,
            latitude: latitude,
            length: length,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserTableTable,
    UserTableData,
    $$UserTableTableFilterComposer,
    $$UserTableTableOrderingComposer,
    $$UserTableTableAnnotationComposer,
    $$UserTableTableCreateCompanionBuilder,
    $$UserTableTableUpdateCompanionBuilder,
    (
      UserTableData,
      BaseReferences<_$AppDatabase, $UserTableTable, UserTableData>
    ),
    UserTableData,
    PrefetchHooks Function()>;
typedef $$SaleDetailTableTableCreateCompanionBuilder = SaleDetailTableCompanion
    Function({
  Value<int> id,
  required int refId,
  Value<String?> cutomerId,
  required DateTime saleDate,
  required String customerNotSubscribed,
  required SaleStateEnum state,
});
typedef $$SaleDetailTableTableUpdateCompanionBuilder = SaleDetailTableCompanion
    Function({
  Value<int> id,
  Value<int> refId,
  Value<String?> cutomerId,
  Value<DateTime> saleDate,
  Value<String> customerNotSubscribed,
  Value<SaleStateEnum> state,
});

class $$SaleDetailTableTableFilterComposer
    extends Composer<_$AppDatabase, $SaleDetailTableTable> {
  $$SaleDetailTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cutomerId => $composableBuilder(
      column: $table.cutomerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get saleDate => $composableBuilder(
      column: $table.saleDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerNotSubscribed => $composableBuilder(
      column: $table.customerNotSubscribed,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<SaleStateEnum, SaleStateEnum, String>
      get state => $composableBuilder(
          column: $table.state,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$SaleDetailTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SaleDetailTableTable> {
  $$SaleDetailTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cutomerId => $composableBuilder(
      column: $table.cutomerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get saleDate => $composableBuilder(
      column: $table.saleDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerNotSubscribed => $composableBuilder(
      column: $table.customerNotSubscribed,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnOrderings(column));
}

class $$SaleDetailTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SaleDetailTableTable> {
  $$SaleDetailTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<String> get cutomerId =>
      $composableBuilder(column: $table.cutomerId, builder: (column) => column);

  GeneratedColumn<DateTime> get saleDate =>
      $composableBuilder(column: $table.saleDate, builder: (column) => column);

  GeneratedColumn<String> get customerNotSubscribed => $composableBuilder(
      column: $table.customerNotSubscribed, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SaleStateEnum, String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);
}

class $$SaleDetailTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SaleDetailTableTable,
    SaleDetailTableData,
    $$SaleDetailTableTableFilterComposer,
    $$SaleDetailTableTableOrderingComposer,
    $$SaleDetailTableTableAnnotationComposer,
    $$SaleDetailTableTableCreateCompanionBuilder,
    $$SaleDetailTableTableUpdateCompanionBuilder,
    (
      SaleDetailTableData,
      BaseReferences<_$AppDatabase, $SaleDetailTableTable, SaleDetailTableData>
    ),
    SaleDetailTableData,
    PrefetchHooks Function()> {
  $$SaleDetailTableTableTableManager(
      _$AppDatabase db, $SaleDetailTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SaleDetailTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SaleDetailTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SaleDetailTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> refId = const Value.absent(),
            Value<String?> cutomerId = const Value.absent(),
            Value<DateTime> saleDate = const Value.absent(),
            Value<String> customerNotSubscribed = const Value.absent(),
            Value<SaleStateEnum> state = const Value.absent(),
          }) =>
              SaleDetailTableCompanion(
            id: id,
            refId: refId,
            cutomerId: cutomerId,
            saleDate: saleDate,
            customerNotSubscribed: customerNotSubscribed,
            state: state,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int refId,
            Value<String?> cutomerId = const Value.absent(),
            required DateTime saleDate,
            required String customerNotSubscribed,
            required SaleStateEnum state,
          }) =>
              SaleDetailTableCompanion.insert(
            id: id,
            refId: refId,
            cutomerId: cutomerId,
            saleDate: saleDate,
            customerNotSubscribed: customerNotSubscribed,
            state: state,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SaleDetailTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SaleDetailTableTable,
    SaleDetailTableData,
    $$SaleDetailTableTableFilterComposer,
    $$SaleDetailTableTableOrderingComposer,
    $$SaleDetailTableTableAnnotationComposer,
    $$SaleDetailTableTableCreateCompanionBuilder,
    $$SaleDetailTableTableUpdateCompanionBuilder,
    (
      SaleDetailTableData,
      BaseReferences<_$AppDatabase, $SaleDetailTableTable, SaleDetailTableData>
    ),
    SaleDetailTableData,
    PrefetchHooks Function()>;
typedef $$SaleTableTableCreateCompanionBuilder = SaleTableCompanion Function({
  Value<int> id,
  required int refId,
  required int autopartId,
  required int saleDetailId,
  required int amount,
  required double price,
  required String name,
});
typedef $$SaleTableTableUpdateCompanionBuilder = SaleTableCompanion Function({
  Value<int> id,
  Value<int> refId,
  Value<int> autopartId,
  Value<int> saleDetailId,
  Value<int> amount,
  Value<double> price,
  Value<String> name,
});

class $$SaleTableTableFilterComposer
    extends Composer<_$AppDatabase, $SaleTableTable> {
  $$SaleTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get autopartId => $composableBuilder(
      column: $table.autopartId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get saleDetailId => $composableBuilder(
      column: $table.saleDetailId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));
}

class $$SaleTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SaleTableTable> {
  $$SaleTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get autopartId => $composableBuilder(
      column: $table.autopartId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get saleDetailId => $composableBuilder(
      column: $table.saleDetailId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$SaleTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SaleTableTable> {
  $$SaleTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<int> get autopartId => $composableBuilder(
      column: $table.autopartId, builder: (column) => column);

  GeneratedColumn<int> get saleDetailId => $composableBuilder(
      column: $table.saleDetailId, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$SaleTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SaleTableTable,
    SaleTableData,
    $$SaleTableTableFilterComposer,
    $$SaleTableTableOrderingComposer,
    $$SaleTableTableAnnotationComposer,
    $$SaleTableTableCreateCompanionBuilder,
    $$SaleTableTableUpdateCompanionBuilder,
    (
      SaleTableData,
      BaseReferences<_$AppDatabase, $SaleTableTable, SaleTableData>
    ),
    SaleTableData,
    PrefetchHooks Function()> {
  $$SaleTableTableTableManager(_$AppDatabase db, $SaleTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SaleTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SaleTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SaleTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> refId = const Value.absent(),
            Value<int> autopartId = const Value.absent(),
            Value<int> saleDetailId = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              SaleTableCompanion(
            id: id,
            refId: refId,
            autopartId: autopartId,
            saleDetailId: saleDetailId,
            amount: amount,
            price: price,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int refId,
            required int autopartId,
            required int saleDetailId,
            required int amount,
            required double price,
            required String name,
          }) =>
              SaleTableCompanion.insert(
            id: id,
            refId: refId,
            autopartId: autopartId,
            saleDetailId: saleDetailId,
            amount: amount,
            price: price,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SaleTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SaleTableTable,
    SaleTableData,
    $$SaleTableTableFilterComposer,
    $$SaleTableTableOrderingComposer,
    $$SaleTableTableAnnotationComposer,
    $$SaleTableTableCreateCompanionBuilder,
    $$SaleTableTableUpdateCompanionBuilder,
    (
      SaleTableData,
      BaseReferences<_$AppDatabase, $SaleTableTable, SaleTableData>
    ),
    SaleTableData,
    PrefetchHooks Function()>;
typedef $$CountryTableTableCreateCompanionBuilder = CountryTableCompanion
    Function({
  Value<int> id,
  required int refId,
  required String name,
  Value<String?> photo,
  required String codePhone,
});
typedef $$CountryTableTableUpdateCompanionBuilder = CountryTableCompanion
    Function({
  Value<int> id,
  Value<int> refId,
  Value<String> name,
  Value<String?> photo,
  Value<String> codePhone,
});

class $$CountryTableTableFilterComposer
    extends Composer<_$AppDatabase, $CountryTableTable> {
  $$CountryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photo => $composableBuilder(
      column: $table.photo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get codePhone => $composableBuilder(
      column: $table.codePhone, builder: (column) => ColumnFilters(column));
}

class $$CountryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CountryTableTable> {
  $$CountryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photo => $composableBuilder(
      column: $table.photo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get codePhone => $composableBuilder(
      column: $table.codePhone, builder: (column) => ColumnOrderings(column));
}

class $$CountryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CountryTableTable> {
  $$CountryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get photo =>
      $composableBuilder(column: $table.photo, builder: (column) => column);

  GeneratedColumn<String> get codePhone =>
      $composableBuilder(column: $table.codePhone, builder: (column) => column);
}

class $$CountryTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CountryTableTable,
    CountryTableData,
    $$CountryTableTableFilterComposer,
    $$CountryTableTableOrderingComposer,
    $$CountryTableTableAnnotationComposer,
    $$CountryTableTableCreateCompanionBuilder,
    $$CountryTableTableUpdateCompanionBuilder,
    (
      CountryTableData,
      BaseReferences<_$AppDatabase, $CountryTableTable, CountryTableData>
    ),
    CountryTableData,
    PrefetchHooks Function()> {
  $$CountryTableTableTableManager(_$AppDatabase db, $CountryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CountryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CountryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CountryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> refId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> photo = const Value.absent(),
            Value<String> codePhone = const Value.absent(),
          }) =>
              CountryTableCompanion(
            id: id,
            refId: refId,
            name: name,
            photo: photo,
            codePhone: codePhone,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int refId,
            required String name,
            Value<String?> photo = const Value.absent(),
            required String codePhone,
          }) =>
              CountryTableCompanion.insert(
            id: id,
            refId: refId,
            name: name,
            photo: photo,
            codePhone: codePhone,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CountryTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CountryTableTable,
    CountryTableData,
    $$CountryTableTableFilterComposer,
    $$CountryTableTableOrderingComposer,
    $$CountryTableTableAnnotationComposer,
    $$CountryTableTableCreateCompanionBuilder,
    $$CountryTableTableUpdateCompanionBuilder,
    (
      CountryTableData,
      BaseReferences<_$AppDatabase, $CountryTableTable, CountryTableData>
    ),
    CountryTableData,
    PrefetchHooks Function()>;
typedef $$CityTableTableCreateCompanionBuilder = CityTableCompanion Function({
  Value<int> id,
  required int refId,
  required String name,
  Value<String?> photo,
  required int countryId,
});
typedef $$CityTableTableUpdateCompanionBuilder = CityTableCompanion Function({
  Value<int> id,
  Value<int> refId,
  Value<String> name,
  Value<String?> photo,
  Value<int> countryId,
});

class $$CityTableTableFilterComposer
    extends Composer<_$AppDatabase, $CityTableTable> {
  $$CityTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photo => $composableBuilder(
      column: $table.photo, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get countryId => $composableBuilder(
      column: $table.countryId, builder: (column) => ColumnFilters(column));
}

class $$CityTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CityTableTable> {
  $$CityTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photo => $composableBuilder(
      column: $table.photo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get countryId => $composableBuilder(
      column: $table.countryId, builder: (column) => ColumnOrderings(column));
}

class $$CityTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CityTableTable> {
  $$CityTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get photo =>
      $composableBuilder(column: $table.photo, builder: (column) => column);

  GeneratedColumn<int> get countryId =>
      $composableBuilder(column: $table.countryId, builder: (column) => column);
}

class $$CityTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CityTableTable,
    CityTableData,
    $$CityTableTableFilterComposer,
    $$CityTableTableOrderingComposer,
    $$CityTableTableAnnotationComposer,
    $$CityTableTableCreateCompanionBuilder,
    $$CityTableTableUpdateCompanionBuilder,
    (
      CityTableData,
      BaseReferences<_$AppDatabase, $CityTableTable, CityTableData>
    ),
    CityTableData,
    PrefetchHooks Function()> {
  $$CityTableTableTableManager(_$AppDatabase db, $CityTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CityTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CityTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CityTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> refId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> photo = const Value.absent(),
            Value<int> countryId = const Value.absent(),
          }) =>
              CityTableCompanion(
            id: id,
            refId: refId,
            name: name,
            photo: photo,
            countryId: countryId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int refId,
            required String name,
            Value<String?> photo = const Value.absent(),
            required int countryId,
          }) =>
              CityTableCompanion.insert(
            id: id,
            refId: refId,
            name: name,
            photo: photo,
            countryId: countryId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CityTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CityTableTable,
    CityTableData,
    $$CityTableTableFilterComposer,
    $$CityTableTableOrderingComposer,
    $$CityTableTableAnnotationComposer,
    $$CityTableTableCreateCompanionBuilder,
    $$CityTableTableUpdateCompanionBuilder,
    (
      CityTableData,
      BaseReferences<_$AppDatabase, $CityTableTable, CityTableData>
    ),
    CityTableData,
    PrefetchHooks Function()>;
typedef $$CategoryTableTableCreateCompanionBuilder = CategoryTableCompanion
    Function({
  Value<int> id,
  required int refId,
  required String name,
  Value<String?> description,
});
typedef $$CategoryTableTableUpdateCompanionBuilder = CategoryTableCompanion
    Function({
  Value<int> id,
  Value<int> refId,
  Value<String> name,
  Value<String?> description,
});

class $$CategoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));
}

class $$CategoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refId => $composableBuilder(
      column: $table.refId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));
}

class $$CategoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);
}

class $$CategoryTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoryTableTable,
    CategoryTableData,
    $$CategoryTableTableFilterComposer,
    $$CategoryTableTableOrderingComposer,
    $$CategoryTableTableAnnotationComposer,
    $$CategoryTableTableCreateCompanionBuilder,
    $$CategoryTableTableUpdateCompanionBuilder,
    (
      CategoryTableData,
      BaseReferences<_$AppDatabase, $CategoryTableTable, CategoryTableData>
    ),
    CategoryTableData,
    PrefetchHooks Function()> {
  $$CategoryTableTableTableManager(_$AppDatabase db, $CategoryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> refId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              CategoryTableCompanion(
            id: id,
            refId: refId,
            name: name,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int refId,
            required String name,
            Value<String?> description = const Value.absent(),
          }) =>
              CategoryTableCompanion.insert(
            id: id,
            refId: refId,
            name: name,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoryTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoryTableTable,
    CategoryTableData,
    $$CategoryTableTableFilterComposer,
    $$CategoryTableTableOrderingComposer,
    $$CategoryTableTableAnnotationComposer,
    $$CategoryTableTableCreateCompanionBuilder,
    $$CategoryTableTableUpdateCompanionBuilder,
    (
      CategoryTableData,
      BaseReferences<_$AppDatabase, $CategoryTableTable, CategoryTableData>
    ),
    CategoryTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AutopartTableTableTableManager get autopartTable =>
      $$AutopartTableTableTableManager(_db, _db.autopartTable);
  $$AutopartTypeInfoTableTableTableManager get autopartTypeInfoTable =>
      $$AutopartTypeInfoTableTableTableManager(_db, _db.autopartTypeInfoTable);
  $$AutopartOfSellerTableTableTableManager get autopartOfSellerTable =>
      $$AutopartOfSellerTableTableTableManager(_db, _db.autopartOfSellerTable);
  $$AutopartAssetTableTableTableManager get autopartAssetTable =>
      $$AutopartAssetTableTableTableManager(_db, _db.autopartAssetTable);
  $$AutopartBrandTableTableTableManager get autopartBrandTable =>
      $$AutopartBrandTableTableTableManager(_db, _db.autopartBrandTable);
  $$AutopartInfoTableTableTableManager get autopartInfoTable =>
      $$AutopartInfoTableTableTableManager(_db, _db.autopartInfoTable);
  $$CustomerTableTableTableManager get customerTable =>
      $$CustomerTableTableTableManager(_db, _db.customerTable);
  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db, _db.userTable);
  $$SaleDetailTableTableTableManager get saleDetailTable =>
      $$SaleDetailTableTableTableManager(_db, _db.saleDetailTable);
  $$SaleTableTableTableManager get saleTable =>
      $$SaleTableTableTableManager(_db, _db.saleTable);
  $$CountryTableTableTableManager get countryTable =>
      $$CountryTableTableTableManager(_db, _db.countryTable);
  $$CityTableTableTableManager get cityTable =>
      $$CityTableTableTableManager(_db, _db.cityTable);
  $$CategoryTableTableTableManager get categoryTable =>
      $$CategoryTableTableTableManager(_db, _db.categoryTable);
}
