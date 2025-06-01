import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AutopartsInitDb {
  static final AutopartsInitDb instance = AutopartsInitDb._init();
  static Database? _database;

  AutopartsInitDb._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = join(await getDatabasesPath(), filePath);

    final database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await _createDB(db, version);
        // ignore: avoid_print
        print('Base de datos creada correctamente en: $dbPath');
      },
    );
    return database;
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        email TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        email TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE sales (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        email TEXT NOT NULL
      )
    ''');
  }

    
}
