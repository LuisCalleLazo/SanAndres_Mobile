import 'dart:io';

import 'package:san_andres_mobile/shared/data/autoparts_sql.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AutopartsInitDb {
  static final AutopartsInitDb instance = AutopartsInitDb._init();
  static Database? _database;

  AutopartsInitDb._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('autoparts.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = join(await getDatabasesPath(), filePath);
    final exists = await File(dbPath).exists();

    if (!exists) {
      final database = await openDatabase(
        dbPath,
        version: 1,
        onCreate: (db, version) async {
          await _createDB(db, version);
          // ignore: avoid_print
          print('Base de datos creada correctamente en: $dbPath');
        },
      );
      await seeder();
      return database;
    } else {
      // La base de datos ya existe, simplemente la abrimos
      final database = await openDatabase(dbPath, version: 1);
      // ignore: avoid_print
      print('Base de datos ya existe, se abre sin insertar semillas');
      return database;
    }
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Country (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        photo TEXT NOT NULL,
        codePhone TEXT NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE Customer (
        id INTEGER,
        name TEXT NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE Category (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        refId INTEGER,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        asset TEXT
        type TEXT CHECK(type IN (
          'consumable',  -- piezas de alta rotación
          'specific',    -- repuesto específico de modelo/máquina
          'generic',     -- repuesto genérico para varios modelos
          'function',    -- según función o sistema (motor, frenos)
          'material',    -- según material (metal, plástico)
          'location'     -- según ubicación en vehículo
        ))
      );
    ''');

    await db.execute('''
      CREATE TABLE AutopartTypeInfo (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        refId INTEGER,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        typeValue TEXT CHECK(typeValue IN ('code', 'measures', 'contains'))
      );
    ''');

    await db.execute('''
      CREATE TABLE AutopartBrand (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        refId INTEGER,
        name TEXT NOT NULL,
        logo TEXT NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE Autopart (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        refId INTEGER,
        brandId INTEGER NOT NULL,
        categoryId INTEGER NOT NULL,
        FOREIGN KEY (brandId) REFERENCES AutopartBrand(id),
        FOREIGN KEY (categoryId) REFERENCES Category(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE AutopartAsset (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        refId INTEGER,
        asset TEXT NOT NULL,
        description TEXT NOT NULL,
        autopartId INTEGER NOT NULL,
        FOREIGN KEY (autopartId) REFERENCES Autopart(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE AutopartInfo (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        refId INTEGER,
        value TEXT NOT NULL,
        typeId INTEGER NOT NULL,
        autopartId INTEGER NOT NULL,
        FOREIGN KEY (typeId) REFERENCES AutopartTypeInfo(id),
        FOREIGN KEY (autopartId) REFERENCES Autopart(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE AutopartOfSeller (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        refId INTEGER,
        autopartId INTEGER NOT NULL,
        amountUnit INTEGER NOT NULL,
        amountUnitPublic INTEGER,
        unitPrice REAL NOT NULL,
        unitPricePublic REAL,
        wholesalePrice REAL NOT NULL,
        wholesalePricePublic REAL,
        FOREIGN KEY (autopartId) REFERENCES Autopart(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE SaleDetail (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        refId INTEGER,
        customerId INTEGER,
        customerName TEXT,
        saleDate TEXT NOT NULL,
        state TEXT NOT NULL,
        FOREIGN KEY (customerId) REFERENCES Customer(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE Sale (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        refId INTEGER,
        autopartId INTEGER NOT NULL,
        saleDetailId INTEGER NOT NULL,
        amount INTEGER NOT NULL,
        price REAL NOT NULL,
        FOREIGN KEY (autopartId) REFERENCES Autopart(id),
        FOREIGN KEY (saleDetailId) REFERENCES SaleDetail(id)
      );
    ''');
  }

  Future<void> seeder() async {
    final db = await instance.database;

    await db.transaction((txn) async {
      // Insertar Countries
      for (var country in AutopartsSql.getSeedCountries()) {
        await txn.insert(
            'Country',
            {
              'id': country.id,
              'name': country.name,
              'photo': country.photo,
              'codePhone': country.codePhone,
            },
            conflictAlgorithm: ConflictAlgorithm.ignore);
      }

      // Insertar AutopartBrand
      for (var brand in AutopartsSql.getSeedAutopartBrand()) {
        await txn.insert(
            'AutopartBrand',
            {
              'id': brand.id,
              'name': brand.name,
              'logo': brand.logo,
            },
            conflictAlgorithm: ConflictAlgorithm.ignore);
      }

      // Insertar Category
      for (var category in AutopartsSql.getSeedCategiries()) {
        await txn.insert(
            'Category',
            {
              'id': category.id,
              'name': category.name,
              'description': category.description,
              'asset': category.asset,
            },
            conflictAlgorithm: ConflictAlgorithm.ignore);
      }

      // Insertar AutopartTypeInfo
      for (var typeInfo in AutopartsSql.getSeedAutopartTypeInfo()) {
        await txn.insert(
            'AutopartTypeInfo',
            {
              'id': typeInfo.id,
              'name': typeInfo.name,
              'description': typeInfo.description,
              'typeValue': typeInfo.typeValue.toString().split('.').last,
            },
            conflictAlgorithm: ConflictAlgorithm.ignore);
      }

      // Insertar Autopart
      for (var autopart in AutopartsSql.getSeedAutopart()) {
        await txn.insert(
            'Autopart',
            {
              'id': autopart.id,
              'brandId': autopart.brandId,
              'categoryId': autopart.categoryId,
            },
            conflictAlgorithm: ConflictAlgorithm.ignore);
      }

      // Insertar AutopartAsset
      for (var asset in AutopartsSql.getSeedDataAupartAsset()) {
        await txn.insert(
            'AutopartAsset',
            {
              'id': asset.id,
              'asset': asset.asset,
              'description': asset.description,
              'autopartId': asset.autopartId,
            },
            conflictAlgorithm: ConflictAlgorithm.ignore);
      }

      // Insertar AutopartInfo
      for (var info in AutopartsSql.getSeedAutopartInfo()) {
        await txn.insert(
            'AutopartInfo',
            {
              'id': info.id,
              'value': info.value,
              'typeId': info.typeId,
              'autopartId': info.autopartId,
            },
            conflictAlgorithm: ConflictAlgorithm.ignore);
      }
    });

    // ignore: avoid_print
    print('Datos semilla insertados correctamente');
  }
}
